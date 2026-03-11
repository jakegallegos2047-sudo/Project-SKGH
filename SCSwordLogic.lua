
r = game:service("RunService")

local damage = 5
local slash_damage = 10
local lunge_damage = 30

sword = script.Parent.Handle
Tool = script.Parent

function blow(hit)
	if (hit.Parent == nil) then return end

	local humanoid = hit.Parent:findFirstChild("Humanoid")
	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)
	local hum = vCharacter:findFirstChild("Humanoid") 
	if humanoid~=nil and humanoid ~= hum and hum ~= nil then
		local tPlayer=game.Players:GetPlayerFromCharacter(humanoid.Parent) 
		local right_arm = vCharacter:FindFirstChild("Right Arm")
		if (right_arm ~= nil)  then
			local joint = right_arm:FindFirstChild("RightGrip")
			if (joint ~= nil and (joint.Part0 == sword or joint.Part1 == sword)) and (colors[tostring(vPlayer.TeamColor)]~=colors[tostring(tPlayer.TeamColor)]) then
				if tPlayer.Character:FindFirstChild("Shield")~=nil then
					sh=tPlayer.Character:FindFirstChild("Shield")
					if sh.Value==0 then
						tagHumanoid(humanoid, vPlayer)
						humanoid:TakeDamage(damage)
						wait(1)
						untagHumanoid(humanoid)
					elseif sh.Value<damage then
						newdm=damage-sh.Value
						sh.Value=0
						humanoid:TakeDamage(newdm)
					elseif sh.Value>damage then
						sh.Value=sh.Value-damage
					elseif sh.Value==damage then
						sh.Value=0
					end
				else
				tagHumanoid(humanoid, vPlayer)
				humanoid:TakeDamage(damage)
				wait(1)
				untagHumanoid(humanoid)
				end
			end
		end
	end
end


function tagHumanoid(humanoid, player)
	local creator_tag = Instance.new("ObjectValue")
	creator_tag.Value = player
	creator_tag.Name = "creator"
	creator_tag.Parent = humanoid
end

function untagHumanoid(humanoid)
	if humanoid ~= nil then
		local tag = humanoid:findFirstChild("creator")
		if tag ~= nil then
			tag.Parent = nil
		end
	end
end


function attack()
	damage = slash_damage
	SlashSound:play()
	local anim = Instance.new("StringValue")
	anim.Name = "toolanim"
	anim.Value = "Slash"
	anim.Parent = Tool
end

function lunge()
	damage = lunge_damage

	LungeSound:play()

	local anim = Instance.new("StringValue")
	anim.Name = "toolanim"
	anim.Value = "Lunge"
	anim.Parent = Tool
	
	
	force = Instance.new("BodyVelocity")
	force.velocity = Vector3.new(0,10,0) 
	force.maxForce = Vector3.new(0,4000,0) 
	force.Parent = Tool.Parent.Torso
	wait(.25)
	swordOut()
	wait(.25)
	force.Parent = nil
	wait(.5)
	swordUp()

	damage = slash_damage
end

function swordUp()
	Tool.GripForward = Vector3.new(-1,0,0)
	Tool.GripRight = Vector3.new(0,1,0)
	Tool.GripUp = Vector3.new(0,0,1)
end

function swordOut()
	Tool.GripForward = Vector3.new(0,0,1)
	Tool.GripRight = Vector3.new(0,-1,0)
	Tool.GripUp = Vector3.new(-1,0,0)
end

function swordAcross()

end


Tool.Enabled = true
local last_attack = 0
function onActivated()

	if not Tool.Enabled then
		return
	end

	Tool.Enabled = false

	local character = Tool.Parent;
	local humanoid = character.Humanoid
	if humanoid == nil then
		print("Humanoid not found")
		return 
	end

	t = r.Stepped:wait()

	if (t - last_attack < .2) then
		lunge()
	else
		attack()
	end

	last_attack = t

	Tool.Enabled = true
end


function onEquipped()
	local vChar=Tool.Parent
	local player=game.Players:GetPlayerFromCharacter(vChar)
	if player.TeamColor==BrickColor.new("Camo") or player.TeamColor==BrickColor.new("Br. yellowish green") then
		script.Parent.Colors.BrickColor=BrickColor.new("Lime green")
	elseif player.TeamColor==BrickColor.new("Sand green") or player.TeamColor==BrickColor.new("Bright red") then
		script.Parent.Colors.BrickColor=BrickColor.new("Really red")
	elseif player.TeamColor==BrickColor.new("Bright blue") then
		script.Parent.Colors.BrickColor=BrickColor.new("Really blue")
	elseif player.TeamColor==BrickColor.new("Bright yellow") then
		script.Parent.Colors.BrickColor=BrickColor.new("New Yeller")
	elseif player.TeamColor==BrickColor.new("Dark stone grey") then
		script.Parent.Colors.BrickColor=BrickColor.new("Deep orange")
	else
		script.Parent.Colors.BrickColor=BrickColor.new("Institutional white")
	end
	UnsheathSound:play()
end


script.Parent.Activated:connect(onActivated)
script.Parent.Equipped:connect(onEquipped)


connection = sword.Touched:connect(blow)
RS = nil
Rarm = nil
weld = nil
torso = nil
holder = nil
holderweld = nil
connection = nil
glitchConnection = nil
animating = false
animate = script.Parent.Animate
Tool = script.Parent
if script.Parent.className ~= "Tool" then
	print("The script must be placed in a tool!")
end

function Animate()
	if weld == nil or animating then return end
	animating = true
	weld.C1 = CFrame.new(weld.C1.p) * CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)
	holderweld.C1 = CFrame.new(holderweld.C1.p) * CFrame.fromEulerAnglesXYZ(math.pi/2, math.pi/2, 0)

	if animate.Value == "Slash1" then
		for i=1, 5 do
			weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((0.15 * 5)/5, (-0.1 * 5)/5, 0)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((0.15 * 5)/5,0,0)
			wait()
		end
		for i=1, 5 do
			weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((0.15 * 5)/5 * -1, (-0.1 * 5)/5 * -1, 0)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((0.15 * 5)/5 * -1,0,0)
			wait()
		end
		weld.C1 = CFrame.new(weld.C1.p) * CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)
	end
	
	if animate.Value == "SlashLeft" then
		weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ(0,-math.pi/4,0)
		for i=1, 5 do
			weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((0.2 * 5)/5,0,0)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((0.2 * 5)/5,0,0)
			wait()
		end
		for i=1, 5 do
			weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((0.2 * 5)/5 * -1,0,0)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((0.2 * 5)/5 * -1,0,0)
			wait()
		end
		weld.C1 = CFrame.new(weld.C1.p) * CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)
	end

	if animate.Value == "SlashRight" then
		weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ(-0.5,-0.35,0)
		for i=1, 5 do
			weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((0.2 * 5)/5, (0.2 * 5)/5, 0)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((0.15 * 5)/5,0,0)
			wait()
		end
		for i=1, 5 do
			weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((0.2 * 5)/5 * -1, (0.2 * 5)/5 * -1, 0)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((0.15 * 5 * -1)/5,0,0)
			wait()
		end
		weld.C1 = CFrame.new(weld.C1.p) * CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)
	end

	if animate.Value == "Stab" then
		for i=1,3 do
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((math.pi/2)/3, 0, 0)
			wait()
		end
		for i=1,3 do
			weld.C1 = weld.C1 * CFrame.new(0,0,0.75/3)
			wait()
		end
		for i=1,3 do
			weld.C1 = weld.C1 * CFrame.new(0,0,-0.75/3)
			wait()
		end
		for i=1,3 do
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((math.pi/2)/-3, 0, 0)
			wait()
		end
	end

	if animate.Value == "Lunge" then
		for i=1, 3 do
			weld.C0 = CFrame.new(weld.C0.p) * CFrame.fromEulerAnglesXYZ(0,((math.pi/4)/3) * i,((math.pi/2)/3) * i)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ(((math.pi/5)/3) * i,0,0)
			wait()
		end
		for i=1, 6 do
			weld.C0 = CFrame.new(weld.C0.p) * CFrame.fromEulerAnglesXYZ(0,math.pi/4,math.pi/2) * CFrame.fromEulerAnglesXYZ(((-math.pi/4)/6) * i, 0, 0)		
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ(((math.pi/5)/2)/6,0,0)
			wait()
		end
		for i=1, 3 do
			weld.C0 = CFrame.new(weld.C0.p) * CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.fromEulerAnglesXYZ(0,0,((-math.pi/2)/3) * i)
			holderweld.C1 = holderweld.C1 * CFrame.fromEulerAnglesXYZ((-math.pi/2)/3,0,0)
			wait()
		end
	end
	animate.Value = "none"
	animating = false
end

animate.Changed:connect(Animate)

function onEquipped(mouse)
	if mouse == nil then
		wait()
	end

	torso = Tool.Parent.Torso

	Rarm = Tool.Parent["Right Arm"]

	if mouse ~= nil then
		RS = torso["Right Shoulder"]
		RS.Parent = nil
	end
	
	holderweld = Rarm.RightGrip

	weld = Instance.new("Weld")
	weld.Part0 = torso
	weld.Part1 = Rarm
	weld.C0 = CFrame.new(1.5,0.5,0)
	weld.C1 = CFrame.new(0,0.5,0)
	weld.Parent = Tool.Parent["Head"]

	animating = true
	for i=1, 10 do
		weld.C1 = weld.C1 * CFrame.fromEulerAnglesXYZ((-math.pi/2)/10,0,0)
		wait()
	end
	animating = false
end

Tool.Equipped:connect(onEquipped)

function onUnequipped()
	if connection ~= nil then
		connection:disconnect()
	end
	if glitchConnection ~= nil then
		glitchConnection:disconnect()
	end
	if RS ~= nil and torso ~= nil then
		RS.Parent = torso
		RS = nil
	end
	if weld ~= nil and torso ~= nil and Rarm ~= nil and holder ~= nil then
		weld.Parent = nil
		weld = nil
		Rarm = nil
		holder:remove()
	end
end

Tool.Unequipped:connect(onUnequipped)
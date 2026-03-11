local part = script.Parent

part.Touched:connect(function(hit)
	local player = hit.Parent
	local playername = hit.Parent.Name
	local humanoid = hit.Parent:FindFirstChild('Humanoid')
	local player1 = game.Players:GetChildren()
	if humanoid then
		if player:FindFirstChild('Personal Key | INSERT KEY USER HERE |') or player:FindFirstChild('Master Key | HRs + |') ~= nil then
		for i,v in pairs(player1) do
			if v.Name == hit.Parent.Name then
			part.CanCollide = false
			wait(1)
			part.CanCollide = true
			end
		end
		elseif player:FindFirstChild('Personal Key | INSERT KEY USER HERE |') == nil then
			for i,v in pairs(player1) do
			if v.Name == hit.Parent.Name then
				script.Parent.Bang:Play()

		end
			end
		end
		end
	end)
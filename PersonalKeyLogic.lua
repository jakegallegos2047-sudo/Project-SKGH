admins = {'INSERT BASICKEY HERE'}
function checkIfAdmin(name) 
for i = 1,#admins do 
if (string.lower(name) == string.lower(admins[i])) then return true end 
end 
return false 
end 

function onPlayerRespawned(player) 
if checkIfAdmin(player.Name) then 
local item1 = game.Lighting['Personal Key | INSERT KEY NAME HERE |']:clone()
item1.Parent = player.Backpack 
end 
end 

function onPlayerEntered(newPlayer) 
newPlayer.Changed:connect(function (property) 
if (property == 'Character') then 
onPlayerRespawned(newPlayer) 
end 
end) 
end 

game.Players.ChildAdded:connect(onPlayerEntered) 
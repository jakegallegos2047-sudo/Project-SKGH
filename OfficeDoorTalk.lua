door = script.Parent --this is the door 

function onChatted(msg, recipient, speaker) 

local source = string.lower(speaker.Name) 
msg = string.lower(msg) 

if (msg == "KEYWORD HERE") then 
door.CanCollide = false 
door.Transparency = 0.7 
wait(5) 
door.CanCollide = true 
door.Transparency = 0 
end 

end 

function onPlayerEntered(newPlayer) 
newPlayer.Chatted:connect(function(msg, recipient) onChatted(msg, recipient, newPlayer) end) 
end 

game.Players.ChildAdded:connect(onPlayerEntered) 

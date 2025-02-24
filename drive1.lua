while true do
    pcall(function()
        local player = game.Players.LocalPlayer
        local driveButton = player.PlayerGui:WaitForChild("Garage"):WaitForChild("Frame")
            :WaitForChild("Contents"):WaitForChild("Footer"):WaitForChild("Drive")
        
        local getconnect = function(v2)
            local events = {"Activated","MouseButton1Down","MouseButton1Click","MouseButton1Up"}
            for _, event in pairs(events) do
                if v2[event] then
                    for _, connection in pairs(getconnections(v2[event])) do
                        if connection.Function then
                            connection.Function()
                        end
                    end
                end
            end
        end
        
        getconnect(driveButton)
    end)
    
    wait(2)
end

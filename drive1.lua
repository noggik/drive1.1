wait(10)  -- รอ 10 วินาทีก่อนเริ่มทำงาน

while true do
   pcall(function()
       local player = game.Players.LocalPlayer
       local garageFrame = player.PlayerGui:WaitForChild("Garage"):WaitForChild("Frame")
       
       -- เช็ค Visible ของ Frame
       if garageFrame.Visible then
           local driveButton = garageFrame:WaitForChild("Contents"):WaitForChild("Footer"):WaitForChild("Drive")
           
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
       end
   end)
   
   wait(2)
end

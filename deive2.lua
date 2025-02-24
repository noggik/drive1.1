wait(10)  -- รอ 10 วินาทีก่อนเริ่มทำงาน

while true do
   -- เริ่มการทำงานหลัก
   local workTimer = tick()
   
   -- ทำงาน 5 นาที (300 วินาที)
   while (tick() - workTimer) < 300 do
       for i,v in pairs(workspace.Cars:GetChildren()) do
           if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
               v.Main.CFrame = CFrame.new(0,200,0)
               game:GetService("TweenService"):Create(v.Main,TweenInfo.new(40,Enum.EasingStyle.Linear),{CFrame = CFrame.new(-17.2,32.3,-3.17)}):Play()
           end
       end
       wait()
   end
   
   -- เช็คความเร็วจนกว่าจะน้อยกว่า 20 แล้วรอ 10 วินาที
   while true do
       local speedLabel = game:GetService("Players").LocalPlayer.PlayerGui.VehicleHUD.Frame.Computer.Speedo.VehicleData.Speed.Label
       local speed = tonumber(speedLabel.Text)
       
       if speed and speed < 20 then
           wait(10)  -- รอ 10 วินาทีหลังจากความเร็วน้อยกว่า 20
           break  -- ออกจาก loop เพื่อเริ่มทำงานใหม่
       end
       
       wait(1)  -- เช็คทุก 1 วินาที
   end
end

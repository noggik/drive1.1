wait(10)  -- รอ 10 วินาทีก่อนเริ่มทำงาน

while true do
   -- เริ่มการทำงานหลัก
   local workTimer = tick()
   
   for i,v in pairs(workspace.Cars:GetChildren()) do
       if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
           while (tick() - workTimer) < 300 do  -- ทำงาน 5 นาที (300 วินาที)
               v.Main.CFrame = CFrame.new(0,200,0)
               game:GetService("TweenService"):Create(v.Main,TweenInfo.new(40,Enum.EasingStyle.Linear),{CFrame = CFrame.new(-17.2,32.3,-3.17)}):Play()
               wait()
           end
       end
   end
   
   -- พัก 20 วินาที
   wait(20)
end

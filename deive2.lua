task.spawn(function()
    wait(10) -- รอ 20 วินาทีก่อนเริ่มทำงานครั้งแรก
    print("✅ เริ่มทำงานหลังจากรอ 20 วินาที")

    local startTime = tick() -- เก็บเวลาที่เริ่มต้น
    
    while true do
        wait(5) -- รอ 5 วินาที

        -- เช็กว่าเวลาที่ผ่านไปถึง 180 วินาที (3 นาที) หรือยัง
        if tick() - startTime >= 180 then
            print("⏸️ หยุดทำงานชั่วคราว 5 วินาที...")
            wait(5) -- หยุดทำงาน 5 วินาที
            startTime = tick() -- รีเซ็ตเวลาเริ่มต้นใหม่
        end

        for i, v in pairs(workspace.Cars:GetChildren()) do
            if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                -- ย้ายรถไปที่จุดสูง 200 หน่วย
                v.Main.CFrame = CFrame.new(0, 200, 0)

                -- ทำ Tween ให้รถเคลื่อนที่ไปยังจุด (-17.2, 32.3, -3.17) ใน 40 วินาที
                game:GetService("TweenService"):Create(
                    v.Main,
                    TweenInfo.new(40, Enum.EasingStyle.Linear),
                    {CFrame = CFrame.new(-17.2, 32.3, -3.17)}
                ):Play()
            end
        end
    end
end)

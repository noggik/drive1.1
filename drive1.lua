-- รอ 10 วินาทีก่อนเริ่มทำงาน
task.wait(10)

local player = game:GetService("Players").LocalPlayer

-- รอจนกว่า PlayerGui จะโหลดสำเร็จ
while not player:FindFirstChild("PlayerGui") do
    task.wait(1)
end

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

local function clickDrive()
    if driveButton and driveButton:IsA("ImageButton") then
        getconnect(driveButton) -- กดปุ่ม
    end
end

clickDrive()

-- รอ 5 วินาทีก่อนเริ่มเคลื่อนย้ายรถ
task.wait(5)

while true do
    for i, v in pairs(workspace.Cars:GetChildren()) do
        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == player.Name then
            v.Main.CFrame = CFrame.new(0, 200, 0)
            local tween = game:GetService("TweenService"):Create(
                v.Main, 
                TweenInfo.new(40, Enum.EasingStyle.Linear), 
                {CFrame = CFrame.new(-17.2, 32.3, -3.17)}
            )
            tween:Play()
            tween.Completed:Wait() -- รอให้ Tween จบก่อน
        end
    end
    task.wait(180) -- รอ 3 นาทีแล้วทำใหม่
end

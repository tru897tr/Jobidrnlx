-- GUI hiển thị JobId với nút sao chép
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo Frame (bảng)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 150)
frame.Position = UDim2.new(0.5, -175, 0.5, -75) -- Giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Bo góc
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = frame

-- Label hiển thị JobId
local jobLabel = Instance.new("TextLabel")
jobLabel.Size = UDim2.new(1, -20, 0.5, -10)
jobLabel.Position = UDim2.new(0, 10, 0, 10)
jobLabel.BackgroundTransparency = 1
jobLabel.Text = "JobId: " .. game.JobId
jobLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jobLabel.TextScaled = true
jobLabel.Font = Enum.Font.SourceSansBold
jobLabel.Parent = frame

-- Nút Sao chép
local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0.6, 0, 0.3, 0)
copyBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
copyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
copyBtn.Text = "📋 Sao chép"
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.TextScaled = true
copyBtn.Font = Enum.Font.SourceSansBold
copyBtn.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = copyBtn

-- Sự kiện nút
copyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(game.JobId)
        copyBtn.Text = "✅ Đã sao chép!"
        wait(2)
        copyBtn.Text = "📋 Sao chép"
    else
        copyBtn.Text = "❌ Executor không hỗ trợ!"
        wait(2)
        copyBtn.Text = "📋 Sao chép"
    end
end)

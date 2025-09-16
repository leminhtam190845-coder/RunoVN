-- HAHA_UI.lua
-- Module quản lý Splash, Watermark, MiniWatermark và Error UI HAHA

local TweenService = game:GetService("TweenService")

local HAHA_UI = {}

-- 📌 Bảng cấu hình
HAHA_UI.Config = {
    EnableSplash = true,          -- Hiện logo splash bay ra góc
    EnableWatermark = true,       -- Giữ watermark góc phải trên
    EnableMiniWatermark = false,  -- Thêm watermark nhỏ ở góc phải dưới
    LogoId = 1234567890           -- 🔥 Thay bằng Asset ID logo HAHA của bạn
}

-- 🔥 Splash logo -> bay thành watermark
function HAHA_UI.ShowSplashToWatermark()
    if not HAHA_UI.Config.EnableSplash then return end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HAHA_Splash"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 200, 0, 200)
    imageLabel.Position = UDim2.new(0.5, -100, 0.5, -100)
    imageLabel.Image = "rbxassetid://" .. tostring(HAHA_UI.Config.LogoId)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 50)
    textLabel.Position = UDim2.new(0, 0, 1, 0)
    textLabel.Text = "HAHA Script Loaded!"
    textLabel.TextScaled = true
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = imageLabel

    task.wait(2)

    local tween = TweenService:Create(imageLabel, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(1, -160, 0, 10)
    })
    tween:Play()
    tween.Completed:Wait()

    if not HAHA_UI.Config.EnableWatermark then
        screenGui:Destroy()
        return
    end

    textLabel.Text = "HAHA"

    -- hiệu ứng chữ nhấp nháy
    task.spawn(function()
        while task.wait(0.5) do
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            task.wait(0.5)
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        end
    end)

    -- hiệu ứng xoay
    task.spawn(function()
        while task.wait(0.03) do
            imageLabel.Rotation = (imageLabel.Rotation + 2) % 360
        end
    end)

    -- hiệu ứng scale
    task.spawn(function()
        while true do
            local tweenGrow = TweenService:Create(imageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 50, 0, 50)})
            tweenGrow:Play()
            tweenGrow.Completed:Wait()

            local tweenShrink = TweenService:Create(imageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 40, 0, 40)})
            tweenShrink:Play()
            tweenShrink.Completed:Wait()
        end
    end)
end

-- 🔥 Watermark nhỏ gọn
function HAHA_UI.ShowMiniWatermark()
    if not HAHA_UI.Config.EnableMiniWatermark then return end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HAHA_MiniWatermark"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 100, 0, 30)
    frame.Position = UDim2.new(1, -110, 1, -40) -- góc phải dưới
    frame.BackgroundTransparency = 0.4
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 20, 0, 20)
    imageLabel.Position = UDim2.new(0, 5, 0.5, -10)
    imageLabel.Image = "rbxassetid://" .. tostring(HAHA_UI.Config.LogoId)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -30, 1, 0)
    textLabel.Position = UDim2.new(0, 30, 0, 0)
    textLabel.Text = "HAHA"
    textLabel.TextScaled = true
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame

    -- hiệu ứng nhấp nháy nhẹ
    task.spawn(function()
        while task.wait(1) do
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            task.wait(1)
            textLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        end
    end)
end

-- 🔥 Hiển thị Error Logo
function HAHA_UI.ShowError(errorText)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HAHA_Error"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 200, 0, 200)
    imageLabel.Position = UDim2.new(0.5, -100, 0.5, -100)
    imageLabel.Image = "rbxassetid://" .. tostring(HAHA_UI.Config.LogoId)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 50)
    textLabel.Position = UDim2.new(0, 0, 1, 0)
    textLabel.Text = "HAHA - Error: " .. tostring(errorText)
    textLabel.TextScaled = true
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = imageLabel

    error(errorText, 2)
end

return HAHA_UI

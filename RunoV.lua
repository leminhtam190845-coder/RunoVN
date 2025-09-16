-- Load module
local HAHA_UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/USERNAME/REPO/main/HAHA_UI.lua"))()

-- Chỉnh config
HAHA_UI.Config.LogoId = 1234567890 -- Asset ID logo của bạn
HAHA_UI.Config.EnableSplash = true
HAHA_UI.Config.EnableWatermark = true
HAHA_UI.Config.EnableMiniWatermark = true

-- Gọi UI
HAHA_UI.ShowSplashToWatermark()
HAHA_UI.ShowMiniWatermark()

-- Nếu muốn báo lỗi
-- HAHA_UI.ShowError("Something went wrong!")

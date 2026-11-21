-- VIOLETTE: interface-only demo (Roblox LocalScript)
-- Does not call RemoteEvents or control gameplay/exploit features.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("VioletteUIDemo")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "VioletteUIDemo"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local purple = Color3.fromRGB(175, 95, 255)
local black = Color3.fromRGB(8, 8, 10)
local white = Color3.fromRGB(255, 255, 255)
local panelBg = Color3.fromRGB(15, 15, 18)

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.fromOffset(390, 300)
panel.Position = UDim2.new(0.5, -195, 0.5, -150)
panel.BackgroundColor3 = panelBg
panel.BorderSizePixel = 0
panel.ClipsDescendants = true
panel.Parent = gui
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 18)
local outline = Instance.new("UIStroke", panel)
outline.Color = purple
outline.Transparency = 0.25

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = Color3.fromRGB(28, 19, 38)
header.BorderSizePixel = 0
header.Parent = panel

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(14, 0)
title.Size = UDim2.new(1, -100, 1, 0)
title.Font = Enum.Font.GothamBlack
title.Text = "VIOLETTE PACKET"
title.TextColor3 = white
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local uiButton = Instance.new("TextButton")
uiButton.Name = "UIToggle"
uiButton.Size = UDim2.fromOffset(66, 38)
uiButton.Position = UDim2.new(1, -78, 0, 7)
uiButton.BackgroundColor3 = black
uiButton.BorderSizePixel = 0
uiButton.Font = Enum.Font.GothamBold
uiButton.Text = "UI"
uiButton.TextColor3 = white
uiButton.TextSize = 14
uiButton.Parent = header
Instance.new("UICorner", uiButton).CornerRadius = UDim.new(0, 10)

local content = Instance.new("TextLabel")
content.BackgroundTransparency = 1
content.Position = UDim2.fromOffset(18, 72)
content.Size = UDim2.new(1, -36, 0, 100)
content.Font = Enum.Font.GothamMedium
content.Text = "Painel expandido\nAdicione aqui os controles legítimos do seu projeto."
content.TextColor3 = Color3.fromRGB(190, 190, 200)
content.TextSize = 14
content.TextWrapped = true
content.Parent = panel

local activeButton = Instance.new("TextButton")
activeButton.Name = "ActiveToggle"
activeButton.Size = UDim2.new(1, -28, 0, 42)
activeButton.Position = UDim2.fromOffset(14, 66)
activeButton.BackgroundColor3 = black
activeButton.BorderSizePixel = 0
activeButton.Font = Enum.Font.GothamBlack
activeButton.Text = "ACTIVE"
activeButton.TextColor3 = white
activeButton.TextSize = 15
activeButton.Visible = false
activeButton.Parent = panel
Instance.new("UICorner", activeButton).CornerRadius = UDim.new(0, 11)
local activeStroke = Instance.new("UIStroke", activeButton)
activeStroke.Color = Color3.fromRGB(65, 65, 75)
activeStroke.Transparency = 0.2

local collapsed = false
local isActive = true
uiButton.MouseButton1Click:Connect(function()
    collapsed = not collapsed
    content.Visible = not collapsed
    activeButton.Visible = collapsed
    panel:TweenSize(
        collapsed and UDim2.fromOffset(390, 120) or UDim2.fromOffset(390, 300),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.18,
        true
    )
    uiButton.Text = collapsed and "UI+" or "UI"
end)

activeButton.MouseButton1Click:Connect(function()
    isActive = not isActive
    activeButton.Text = isActive and "ACTIVE" or "INACTIVE"
    activeButton.TextColor3 = isActive and white or Color3.fromRGB(165, 165, 175)
end)

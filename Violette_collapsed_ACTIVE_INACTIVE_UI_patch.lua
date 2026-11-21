-- PATCH VISUAL: botão ACTIVE / INACTIVE para o estado recolhido.
-- Este trecho controla somente o texto/visual do botão; não liga/desliga
-- LAGGER, Auto Grab, RemoteEvents ou qualquer outra função do jogo.
--
-- Como aplicar na interface existente:
-- 1) Coloque este bloco depois da criação de `uiQuickBtn`.
-- 2) Substitua o callback atual de `uiQuickBtn.MouseButton1Click` pelo callback abaixo.

local collapsedStatus = "ACTIVE"

local collapsedStatusBtn = Instance.new("TextButton")
collapsedStatusBtn.Name = "CollapsedStatusToggle"
collapsedStatusBtn.Size = UDim2.new(1, -40, 0, 54)
collapsedStatusBtn.Position = UDim2.fromOffset(20, 64)
collapsedStatusBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
collapsedStatusBtn.BackgroundTransparency = 0.04
collapsedStatusBtn.BorderSizePixel = 0
collapsedStatusBtn.Text = collapsedStatus
collapsedStatusBtn.Font = Enum.Font.GothamBlack
collapsedStatusBtn.TextSize = 19
collapsedStatusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
collapsedStatusBtn.AutoButtonColor = false
collapsedStatusBtn.Visible = false
collapsedStatusBtn.ZIndex = 10
collapsedStatusBtn.Parent = Main

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 18)
statusCorner.Parent = collapsedStatusBtn

local statusStroke = Instance.new("UIStroke")
statusStroke.Color = Color3.fromRGB(65, 65, 72)
statusStroke.Thickness = 1
statusStroke.Transparency = 0.35
statusStroke.Parent = collapsedStatusBtn

collapsedStatusBtn.MouseButton1Click:Connect(function()
    collapsedStatus = (collapsedStatus == "ACTIVE") and "INACTIVE" or "ACTIVE"
    collapsedStatusBtn.Text = collapsedStatus
end)

-- Substitua o callback antigo de UI por este:
uiQuickBtn.MouseButton1Click:Connect(function()
    uiHidden = not uiHidden
    local visible = not uiHidden
    setElementsVisible(visible)
    StartBtn.Visible = visible
    uiQuickBtn.Text = uiHidden and "UI+" or "UI"

    collapsedStatusBtn.Visible = uiHidden
    TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.fromOffset(W, uiHidden and 130 or H),
    }):Play()
end)

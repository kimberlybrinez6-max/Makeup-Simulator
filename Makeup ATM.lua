local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainMenu"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "MENU"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = frame

local inicioButton = Instance.new("TextButton")
inicioButton.Size = UDim2.new(1, -20, 0, 50)
inicioButton.Position = UDim2.new(0, 10, 0, 60)
inicioButton.Text = "Inicio"
inicioButton.Parent = frame

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -20, 0, 100)
infoLabel.Position = UDim2.new(0, 10, 0, 120)
infoLabel.Text = ""
infoLabel.TextColor3 = Color3.new(1,1,1)
infoLabel.BackgroundTransparency = 1
infoLabel.Parent = frame

local makeupButton = Instance.new("TextButton")
makeupButton.Size = UDim2.new(1, -20, 0, 50)
makeupButton.Position = UDim2.new(0, 10, 0, 230)
makeupButton.Text = "Makeup Store Simulator"
makeupButton.Parent = frame

local atmButton = Instance.new("TextButton")
atmButton.Size = UDim2.new(1, -20, 0, 50)
atmButton.Position = UDim2.new(0, 10, 0, 290)
atmButton.Text = "ATM"
atmButton.Visible = false
atmButton.Parent = frame

inicioButton.MouseButton1Click:Connect(function()
    infoLabel.Text =
        "Nombre: " .. player.Name ..
        "\nUserId: " .. player.UserId ..
        "\nDisplayName: " .. player.DisplayName
end)

makeupButton.MouseButton1Click:Connect(function()
    atmButton.Visible = true
end)

local autoATM = false

atmButton.MouseButton1Click:Connect(function()
    autoATM = true
    atmButton.Text = "ATM ACTIVADO"

    while autoATM do
        wait(1)
        print("ATM atendiendo clientes automáticamente...")
    end
end)

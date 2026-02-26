local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local autoATM = false
local minimized = false

local gui = Instance.new("ScreenGui")
gui.Name = "PinkMenu"
gui.Parent = playerGui

local openCircle = Instance.new("TextButton")
openCircle.Size = UDim2.new(0,40,0,40)
openCircle.Position = UDim2.new(0.5,-20,0,10)
openCircle.BackgroundColor3 = Color3.fromRGB(255,182,193)
openCircle.Text = "💗"
openCircle.TextColor3 = Color3.fromRGB(255,0,255)
openCircle.Visible = false
openCircle.Parent = gui

local main = Instance.new("Frame")
main.Size = UDim2.new(0,520,0,260)
main.Position = UDim2.new(0.5,-260,0.5,-130)
main.BackgroundColor3 = Color3.fromRGB(255,209,220)
main.BorderColor3 = Color3.fromRGB(255,0,255)
main.BorderSizePixel = 3
main.Parent = gui

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0,30,0,30)
minimize.Position = UDim2.new(1,-70,0,5)
minimize.Text = "-"
minimize.TextColor3 = Color3.fromRGB(255,0,255)
minimize.BackgroundColor3 = Color3.fromRGB(255,182,193)
minimize.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255,0,255)
close.BackgroundColor3 = Color3.fromRGB(255,182,193)
close.Parent = main

local left = Instance.new("Frame")
left.Size = UDim2.new(0,180,1,0)
left.BackgroundColor3 = Color3.fromRGB(255,182,193)
left.Parent = main

local right = Instance.new("Frame")
right.Size = UDim2.new(1,-180,1,0)
right.Position = UDim2.new(0,180,0,0)
right.BackgroundColor3 = Color3.fromRGB(255,209,220)
right.Parent = main

local inicio = Instance.new("TextButton")
inicio.Size = UDim2.new(1,0,0,60)
inicio.Text = "Inicio >"
inicio.TextColor3 = Color3.fromRGB(255,0,255)
inicio.BackgroundColor3 = Color3.fromRGB(255,209,220)
inicio.Parent = left

local makeup = Instance.new("TextButton")
makeup.Size = UDim2.new(1,0,0,60)
makeup.Position = UDim2.new(0,0,0,70)
makeup.Text = "Makeup Store Simulator >"
makeup.TextColor3 = Color3.fromRGB(255,0,255)
makeup.BackgroundColor3 = Color3.fromRGB(255,209,220)
makeup.Parent = left

local profileImage = Instance.new("ImageLabel")
profileImage.Size = UDim2.new(0,120,0,120)
profileImage.Position = UDim2.new(0,20,0,20)
profileImage.BackgroundTransparency = 1
profileImage.Parent = right

local displayName = Instance.new("TextLabel")
displayName.Size = UDim2.new(0,200,0,40)
displayName.Position = UDim2.new(0,160,0,30)
displayName.TextColor3 = Color3.fromRGB(255,0,255)
displayName.BackgroundTransparency = 1
displayName.Parent = right

local username = Instance.new("TextLabel")
username.Size = UDim2.new(0,200,0,40)
username.Position = UDim2.new(0,160,0,70)
username.TextColor3 = Color3.fromRGB(255,0,255)
username.BackgroundTransparency = 1
username.Parent = right

local atmFrame = Instance.new("Frame")
atmFrame.Size = UDim2.new(0,220,0,120)
atmFrame.Position = UDim2.new(0.5,-110,0.5,-60)
atmFrame.BackgroundColor3 = Color3.fromRGB(255,182,193)
atmFrame.Visible = false
atmFrame.Parent = right

local atmButton = Instance.new("TextButton")
atmButton.Size = UDim2.new(1,-20,0,50)
atmButton.Position = UDim2.new(0,10,0,35)
atmButton.Text = "CAJERO AUTOMÁTICO"
atmButton.TextColor3 = Color3.fromRGB(255,0,255)
atmButton.BackgroundColor3 = Color3.fromRGB(255,209,220)
atmButton.Parent = atmFrame

local function hideAll()
profileImage.Visible = false
displayName.Visible = false
username.Visible = false
atmFrame.Visible = false
end

inicio.MouseButton1Click:Connect(function()
hideAll()
profileImage.Visible = true
displayName.Visible = true
username.Visible = true

local thumb = game.Players:GetUserThumbnailAsync(
player.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size100x100
)

profileImage.Image = thumb
displayName.Text = player.DisplayName
username.Text = "@" .. player.Name
end)

makeup.MouseButton1Click:Connect(function()
hideAll()
atmFrame.Visible = true
end)

atmButton.MouseButton1Click:Connect(function()
autoATM = not autoATM

if autoATM then
atmButton.Text = "ATM ACTIVADO"
else
atmButton.Text = "CAJERO AUTOMÁTICO"
end

task.spawn(function()
while autoATM do
task.wait(0.3)

for _,v in pairs(workspace:GetDescendants()) do

if v:IsA("ClickDetector") then
fireclickdetector(v)
end

local prompt = v:FindFirstChildOfClass("ProximityPrompt")
if prompt then
fireproximityprompt(prompt)
end

local remote = v:IsA("RemoteEvent")
if remote then
remote:FireServer()
end

end
end
end)

end)

minimize.MouseButton1Click:Connect(function()
main.Visible = false
openCircle.Visible = true
end)

openCircle.MouseButton1Click:Connect(function()
main.Visible = true
openCircle.Visible = false
end)

close.MouseButton1Click:Connect(function()
gui:Destroy()
end)

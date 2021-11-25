local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/daximul/u9yh45/main/m/s/tul.lua"))()
local window1 = library:Window("Scripts")
local window2 = library:Window("LocalPlayer")

local RemoveFallDamage = false
local AutoDisasterDetect = false
local SpamSounds = false
local DoNoclip = false

library:Keybind("Q")

window2:Slider("Walkspeed",16,120,5, function(value)
   game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

window2:Slider("JumpPower",50,300,20, function(value)
   game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)

window2:Toggle("Noclip", false, function(boolrfq)
    DoNoclip = boolrfq
end)

window1:Label("Client-Side Copy", Color3.fromRGB(127, 143, 166))
window1:Button("Copy Green Balloon",function()
while true do
if workspace:FindFirstChild("GreenBalloon") then
if not game.Players.LocalPlayer.Character:FindFirstChild("GreenBalloon") and not game.Players.LocalPlayer.Backpack:FindFirstChild("GreenBalloon") then
local workspaceClone = workspace.GreenBalloon:Clone()
workspaceClone.Parent = game.Players.LocalPlayer.Character
end
else
local balloonCheck = workspace:GetDescendants()
local balloonClone
for i, balloon in ipairs(balloonCheck) do
if (tostring(balloon.Name) == "GreenBalloon") then
balloonClone = balloon:Clone()
wait()
end
end
balloonClone.Parent = workspace
local workspaceClone = workspace.GreenBalloon:Clone()
workspaceClone.Parent = game.Players.LocalPlayer.Character
end
wait()
end
end)
    

window1:Label("Server-Side [FE]", Color3.fromRGB(127, 143, 166))
window1:Button("Bring Unanchored Bricks [E]",function()
local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local NetworkAccess = coroutine.create(function()
    settings().Physics.AllowSleep = false
    while game:GetService("RunService").RenderStepped:Wait() do
        for _, Players in next, game:GetService("Players"):GetPlayers() do
            if Players ~= game:GetService("Players").LocalPlayer then
                Players.MaximumSimulationRadius = 0 
                sethiddenproperty(Players, "SimulationRadius", 0) 
            end 
        end
        game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
        setsimulationradius(math.huge) 
    end 
end) 
coroutine.resume(NetworkAccess)
local function ForcePart(v)
    if v:IsA("Part") and v.Anchored == false and v.Parent:FindFirstChild("Humanoid") == nil and v.Parent:FindFirstChild("Head") == nil and v.Name ~= "Handle" then
        Mouse.TargetFilter = v
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2 
        AlignPosition.Attachment1 = Attachment1
    end
end
for _, v in next, game:GetService("Workspace"):GetDescendants() do
    ForcePart(v)
end
game:GetService("Workspace").DescendantAdded:Connect(function(v)
    ForcePart(v)
end)
UserInputService.InputBegan:Connect(function(Key, Chat)
    if Key.KeyCode == Enum.KeyCode.E and not Chat then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
    end
end)
spawn(function()
    while game:GetService("RunService").RenderStepped:Wait() do
        Attachment1.WorldCFrame = Updated
    end
end)
end)

window1:Toggle("FE Spam Sounds",false, function(State1)
    SpamSounds = State1
end)

window1:Toggle("Auto Disaster Detect",false,function(vasde)
    AutoDisasterDetect = vasde
if AutoDisasterDetect == true then
    local Character = game:GetService("Players").LocalPlayer.Character
local Tag = Character:FindFirstChild("SurvivalTag")
if Tag then
game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Disaster Detected",     
Text =   "" .. Tag.Value,
Button1 = "Ok", Duration = 20, })
end
local function Repeat(R)
   R.ChildAdded:connect(
       function(Find)
           if Find.Name == "SurvivalTag" then
game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Disaster Detected",     
Text =   "".. Find.Value,
Button1 = "Ok", Duration = 20, })
           end
       end
   )
end
Repeat(Character)
game:GetService("Players").LocalPlayer.CharacterAdded:connect(
   function(R)
       Repeat(R)
   end
)
end
end)

window1:Button("Free Compass",function()
    game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible
end)

window1:Toggle("Remove Fall Damage",false,function(fffv)
    RemoveFallDamage = fffv
end)
window2:Label("Teleport Areas", Color3.fromRGB(127, 143, 166))
window2:Button("Teleport To Lobby",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-243, 194, 331)
end)
window2:Button("Teleport To Map",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 47, 5)
end)
window1:Toggle("Afk Win Farm",false,function(ffffv)
    getgenv().trinkets = ffffv
while wait(5) do
if getgenv().trinkets then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-269, 180, 382)
    local char = game.Players.LocalPlayer.Character

local cPos = char.HumanoidRootPart.Position
local fPos = cPos.Z + 20

char.Humanoid:MoveTo(Vector3.new(cPos.X,cPos.Y,fPos))
end
end
end)

spawn(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {     
        ["Title"] = "Toggle Gui",     
        ["Text"] = "Q"
    })
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if DoNoclip == true then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(11)
    end
end)

while wait() do
    if RemoveFallDamage == true then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("FallDamageScript") then
            game:GetService("Players").LocalPlayer.Character.FallDamageScript:Destroy()
        end
    end
    if SpamSounds == true then
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Sound") then 
                v:Play()
            end
        end
    end
end

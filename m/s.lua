local ScriptsHolder = {}

local AddScript = function(ScriptName, Devs, GameItWorksOn, ScriptFunction)
	ScriptsHolder[#ScriptsHolder + 1] = {
		["Name"] = tostring(ScriptName),
		["Dev"] = tostring(Devs),
		["ID"] = tostring(GameItWorksOn),
		["Func"] = ScriptFunction
	}
end

local LoadURL = function(link) return loadstring(game.HttpGetAsync(game, tostring(link)))() end

AddScript("[ CMD-X ]", "Various Developers", "[Universal]", function()
	LoadURL("https://raw.githubusercontent.com/Toon-arch/cmdx-1.5/main/minified.lua")
end)

AddScript("[ Sense Client ]", "Toon", "[Universal]", function()
	LoadURL("https://raw.githubusercontent.com/Toon-arch/SenseClient/main/main.lua")
end)

AddScript("Ruin Map", "Redus", "Hotel Elephant", function()
	LoadURL("https://raw.githubusercontent.com/Redusofficial/Redus-Roblox-Scripts/main/Hotel%20elephant.lua")
end)

AddScript("Auto Farm", "RyanRenolds", "Saber Simulator", function()
	LoadURL("https://raw.githubusercontent.com/ScriptRUs/Banana/main/SaberSimulatorV2.lua")
end)

AddScript("Kill Aura", "MSDOS", "Zombie Uprising", function()
	LoadURL("https://raw.githubusercontent.com/toskaman/fb/master/MSDOS")
end)

AddScript("Inf Ammo, etc.", "Bebo Mods", "Titan Warfare", function()
	LoadURL("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/TitanWarfare")
end)

AddScript("Domain X Hub", "shlex", "[Universal]", function()
	LoadURL("https://shlex.dev/release/domainx/latest.lua")
end)

AddScript("Vape v4", "7GrandDadPGN", "Bedwars", function()
	LoadURL("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua")
end)

AddScript("[ Auto Clicker ]", "Ezpi", "[Universal]", function()
	LoadURL("https://raw.githubusercontent.com/JustEzpi/ROBLOX-Scripts/main/ROBLOX_AutoClicker")
end)

AddScript("Kill Aura", "Bebo Mods", "Combat Warriors", function()
	LoadURL("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/required.lua")
end)

AddScript("Anticheat Disabler", "Toon", "Skywars", function()
	local Players = game:GetService("Players")
	game:GetService("RunService").RenderStepped:Connect(function()
		if Players.LocalPlayer.PlayerGui.Extra:FindFirstChild("AntiSploitClient") and Players.LocalPlayer.PlayerGui.Extra:FindFirstChild("AntiSploitClient2") then
			Players.LocalPlayer.PlayerGui.Extra.AntiSploitClient:Destroy()
			Players.LocalPlayer.PlayerGui.Extra.AntiSploitClient2:Destroy()
		end
	end)
end)

AddScript("Anticheat Disabler", "Toon", "Epic Minigames", function()
	local game = game
	local GetService = game.GetService
	local Players = GetService(game, "Players")
	local Destroy, GetChildren, Find =
		game.Destroy,
		game.GetChildren,
		string.find
	for i,v in pairs(GetChildren(Players.LocalPlayer.PlayerScripts)) do
		if Find(v.Name, "Il") or Find(v.Name, "lI") or Find(v.Name, "II") or Find(v.Name, "ll") then
			Destroy(v)
		end
	end
end)

AddScript("Deadcoins Autofarm", "Toon", "Be Dead Forever Simulator", function()
	local CMP = nil
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "Computer" and v:FindFirstChild("Monitor") then
			CMP = v.Monitor
		end
	end
	while CMP == nil do wait() end
	for i,v in pairs(CMP:GetDescendants()) do
		if v:IsA("ClickDetector") and v.Name == "ClickDetector" then
			spawn(function()
				while wait(0.5) do
        				fireclickdetector(v, 0)
				end
			end)
		end
	end
	notify("bdfs", "firing pc")
end)

AddScript("Infinite Cash & Gems", "colb", "Pop It Simulator", function()
	while wait() do
		game:GetService("ReplicatedStorage").Remotes.pickUpCash:FireServer(unpack({[1] = "cash18"}))
		game:GetService("ReplicatedStorage").Remotes.addGems:FireServer(unpack({[1] = "gem18"}))
	end
end)

AddScript("Hitbox Expander", "Toon", "Be a Parkour Ninja", function()
	do local a=game:GetService("Players")local b=15;a.PlayerAdded:Connect(function(c)wait()pcall(function()c.Character.HumanoidRootPart.Size=Vector3.new(b,b,b)c.Character.HumanoidRootPart.Transparency=0.7;c.Character.HumanoidRootPart.BrickColor=BrickColor.new("Bright red")c.Character.HumanoidRootPart.Material="Plastic"c.Character.HumanoidRootPart.CanCollide=false end)c.CharacterAdded:Connect(function()wait()pcall(function()c.Character.HumanoidRootPart.Size=Vector3.new(b,b,b)c.Character.HumanoidRootPart.Transparency=0.7;c.Character.HumanoidRootPart.BrickColor=BrickColor.new("Bright red")c.Character.HumanoidRootPart.Material="Plastic"c.Character.HumanoidRootPart.CanCollide=false end)end)end)for d,e in next,a:GetPlayers()do if e.Name~=a.LocalPlayer.Name then wait()pcall(function()e.Character.HumanoidRootPart.Size=Vector3.new(b,b,b)e.Character.HumanoidRootPart.Transparency=0.7;e.Character.HumanoidRootPart.BrickColor=BrickColor.new("Bright red")e.Character.HumanoidRootPart.Material="Plastic"e.Character.HumanoidRootPart.CanCollide=false end)e.CharacterAdded:Connect(function()wait()pcall(function()e.Character.HumanoidRootPart.Size=Vector3.new(b,b,b)e.Character.HumanoidRootPart.Transparency=0.7;e.Character.HumanoidRootPart.BrickColor=BrickColor.new("Bright red")e.Character.HumanoidRootPart.Material="Plastic"e.Character.HumanoidRootPart.CanCollide=false end)end)end end;game:GetService("StarterGui"):SetCore("SendNotification",{["Title"]="Hitbox Expander",["Text"]="Loaded"})end
end)

AddScript("Mega Troll GUI", "ameicaa", "Natural Disaster Survival", function()
	LoadURL("https://raw.githubusercontent.com/daximul/u9yh45/main/m/s/nds.lua")
end)

return ScriptsHolder

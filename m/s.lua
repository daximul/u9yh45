local ScriptsHolder = {}

local AddScript = function(ScriptName, Devs, GameItWorksOn, ScriptFunction)
	ScriptsHolder[#ScriptsHolder + 1] = {
		["Name"] = tostring(ScriptName),
		["Dev"] = tostring(Devs),
		["ID"] = tostring(GameItWorksOn),
		["Func"] = ScriptFunction
	}
end

local LoadURL = function(link)
	return loadstring(game:HttpGetAsync((tostring(link))))();
end

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

return ScriptsHolder

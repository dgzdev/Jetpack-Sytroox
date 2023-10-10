local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local VolatileModules = {}
local ModuleManager = {}

local Events = ReplicatedStorage:WaitForChild("Events")

local Modules = script:GetChildren()

function ModuleManager.OnProfileReceive(Profile)
	for _, Module in pairs(VolatileModules) do
		if Module.OnProfileReceive ~= nil then
			Module.OnProfileReceive(Profile)
		end
	end
end
Events.PROFILE_EVENT.OnClientEvent:Connect(ModuleManager.OnProfileReceive)

local function EnableModule(Module: Script)
	if Module:IsA("ModuleScript") == false then
		return
	end
	local Value = require(Module)
	VolatileModules[#VolatileModules + 1] = Value
end

for _, Module in ipairs(Modules) do
	EnableModule(Module)
end

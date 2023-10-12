local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local VolatileModules: { [number]: Module } = {}
local ModuleManager = {}

local Events = ReplicatedStorage:WaitForChild("Events")
local Profiles = require(ReplicatedStorage.Modules.Profiles)

local Modules: { [number]: ModuleScript } = script:GetChildren()

ModuleManager.OnProfileReceive = function(Profile: Profiles.Profile): Profiles.Profile
	for _, Module in pairs(VolatileModules) do
		if Module.OnProfileReceive ~= nil then
			Module:OnProfileReceive(Profile)
		end
	end
	return Profile
end
Events.PROFILE_EVENT.OnClientEvent:Connect(ModuleManager.OnProfileReceive)

ModuleManager.EnableModule = function(self, Module: ModuleScript)
	if Module:IsA("ModuleScript") == false then
		return
	end
	local Value = require(Module)
	VolatileModules[#VolatileModules + 1] = Value
end

for _, Module in ipairs(Modules) do
	ModuleManager:EnableModule(Module)
end

export type Module = {
	OnProfileReceive: (self: Module, Profile: Profiles.Profile) -> any,
}

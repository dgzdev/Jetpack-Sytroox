local ServerStorage = game:GetService("ServerStorage")

local Modules = script:GetChildren()

local Events = require(ServerStorage.Storage.Events)
local ProfileData = require(ServerStorage.Storage.ProfileData)

local VolatileModules = {}
local ModuleManager = {}

function ModuleManager.OnProfileReceive(Player: Player, Profile: ProfileData.Profile)
	for _, Module in pairs(VolatileModules) do
		if Module.OnProfileReceive ~= nil then
			Module.OnProfileReceive(Player, Profile)
		end
	end
end
Events.PROFILE_READY.Event:Connect(ModuleManager.OnProfileReceive)

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

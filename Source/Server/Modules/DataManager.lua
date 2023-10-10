local DataManager = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Storage = ServerStorage.Storage
local ProfileData = require(Storage.ProfileData)

local Events = ReplicatedStorage.Events

function DataManager:ReconcileProfile(Player: Player, Profile: ProfileData.Profile)
	for Index, Value in pairs(ProfileData) do
		if Profile[Index] == nil and (Index ~= "INVENTORY") then
			Profile[Index] = Value
			print(`[DATA]: Reconciled {Player.Name} Profile Index: {Index}`)
		end
	end
end

function DataManager.OnProfileReceive(Player: Player, Profile: ProfileData.Profile)
	-- * == Reconcile Profile Data == --
	DataManager:ReconcileProfile(Player, Profile)
	Events.PROFILE_EVENT:FireClient(Player, Profile)
end

return DataManager

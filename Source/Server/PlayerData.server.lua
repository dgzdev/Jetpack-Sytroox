local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local MODULE_FOLDER = ReplicatedStorage.Modules

local ProfileService = require(MODULE_FOLDER.ProfileService)
local ProfileData = require(ServerStorage.Storage.ProfileData)
local ProfileStore = ProfileService.GetProfileStore("PLAYER_DATA", ProfileData)

local PlayerManager = {}

local Profiles = require(MODULE_FOLDER.Profiles)

function PlayerManager.OnPlayerAdded(Player: Player)
	local Profile = ProfileStore:LoadProfileAsync(`Player_{Player.UserId}`, "ForceLoad")
	if Profile ~= nil then
		Profile:AddUserId(Player.UserId) -- GDPR compliance
		Profile:Reconcile() -- Fill in missing variables from ProfileTemplate (optional)
		Profile:ListenToRelease(function()
			Profiles[Player] = nil
			-- The Profile could've been loaded on another Roblox server:
			Player:Kick("The Profile could've been loaded on another Roblox server")
		end)
		if Player:IsDescendantOf(Players) == true then
			Profiles[Player] = Profile
			-- A Profile has been successfully loaded:
		else
			-- Player left before the Profile loaded:
			Profile:Release()
		end
	else
		-- The Profile couldn't be loaded possibly due to other
		--   Roblox servers trying to load this Profile at the same time:
		Player:Kick(
			"The Profile couldn't be loaded possibly due to other\nRoblox servers trying to load this Profile at the same time:"
		)
	end
end
function PlayerManager.OnPlayerRemoving(Player: Player) end

Players.PlayerAdded:Connect(PlayerManager.OnPlayerAdded)
Players.PlayerRemoving:Connect(PlayerManager.OnPlayerRemoving)

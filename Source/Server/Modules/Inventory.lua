local HttpService = game:GetService("HttpService")
local ServerStorage = game:GetService("ServerStorage")

local Storage = ServerStorage.Storage
local ProfileData = require(Storage.ProfileData)

local InventoryService = {}
local VolatileProfiles: { [Player]: ProfileData.Profile } = {}

function InventoryService.OnProfileReceive(Player: Player, Profile: ProfileData.Profile)
	local Inventory = Profile.INVENTORY

	VolatileProfiles[Player] = Profile

	warn(`[INVENTORY]: Loaded {Player.Name} Inventory Data.`)
end

function InventoryService:NewItem(Player: Player, ItemData: ProfileData.Item): string
	local ITEM_ID = tostring(HttpService:GenerateGUID(false))

	local Profile = VolatileProfiles[Player]
	Profile.INVENTORY[ITEM_ID] = ItemData

	return ITEM_ID
end

function InventoryService:ModifyItem(Player: Player, ItemIdentifier: string, ItemData: ProfileData.Item): Result
	local Profile = VolatileProfiles[Player]

	if not Profile.INVENTORY[ItemIdentifier] then
		return "FAILED"
	end

	Profile.INVENTORY[ItemIdentifier] = ItemData
	return "SUCCESS"
end

function InventoryService:RemoveItem(Player: Player, Item: string): Result
	local Profile = VolatileProfiles[Player]
	Profile.INVENTORY[Item] = nil

	return "SUCCESS"
end

export type Result = "SUCCESS" | "FAILED"
return InventoryService

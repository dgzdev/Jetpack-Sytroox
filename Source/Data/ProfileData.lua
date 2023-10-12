local PLAYER_PROFILE: Profile = {
	CHECKPOINT_LEVEL = 0,
	COINS = 0,
	INVENTORY = {
		["INITIAL"] = {
			itemId = 0,
			itemInfo = {},
			type = "JETPACK",
		},
	},
}

export type Profile = {
	CHECKPOINT_LEVEL: number,
	COINS: number,
	INVENTORY: {
		[string]: Item,
	},
}
export type Item = {
	itemId: number,
	itemInfo: {
		[string]: any,
	},
	type: "JETPACK",
}
return PLAYER_PROFILE

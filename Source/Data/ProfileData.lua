local PLAYER_PROFILE: Profile = {
	CHECKPOINT_LEVEL = 0,
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
	INVENTORY: {
		[string]: {
			itemId: number,
			itemInfo: {
				[string]: any,
			},
			type: "JETPACK",
		},
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

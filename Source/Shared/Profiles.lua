export type Profile = {
	CHECKPOINT_LEVEL: number,
	COINS: number,
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
return {}

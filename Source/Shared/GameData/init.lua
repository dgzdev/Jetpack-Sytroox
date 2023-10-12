local Data: GameData = {
	JETPACK_DATA = require(script:WaitForChild("Jetpacks")),
	ITEM_SHOPS = require(script:WaitForChild("Shops")),
}

export type GameData = {
	JETPACK_DATA: {
		[string]: JetpackData,
	},
	ITEM_SHOPS: {
		[string]: ItemShop,
	},
}
export type ItemShop = {
	name: string,
	items: { [number]: ShopItem },
	description: string | nil,
}
export type ShopItem = {
	name: string,
	description: string | nil,
	price: number | "FREE",
	image: string | nil,
	type: "JETPACK" | nil,
	attributes: {
		[string]: JetpackAttributes,
	},
}
export type JetpackData = {
	name: string,
	description: string,
	image: string | nil,
	type: "JETPACK" | nil,
	attributes: {
		[string]: JetpackAttributes,
	},
}
export type JetpackAttributes = {
	FlightPower: number,
	[string]: any,
}
return Data

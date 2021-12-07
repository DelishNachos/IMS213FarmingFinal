event_inherited();

sprBase = sprCharBaseMaleDark;
sprTorso = sprCharTorsoMaleLeatherChest;
sprLegs = sprCharLegsMaleArmorMetal;
sprHair = sprCharHairMalePartedBlack;
sprFeet = sprCharFeetMaleShoesBrown;

portraitIndex = 3;
voice = sndVoice4;
speakerName = "Shopkeep";
text = [
	"What do you want?", 
	[
		"I want to buy something",
		"I want to sell something",
		"Uhh...Nevermind"
	], 
	"What do you want to purchase?",
	[
		"Buy Tomatoes Seeds",
		"Buy Potatoes Seeds",
		"Buy Carrots Seeds",
		"Buy Artichokes Seeds",
		"Buy Chillis Seeds", 
		"Buy Gourds Seeds",
		"Buy Corn Seeds"
	],
	[
		"Buy 1 Seed.",
		"Buy 2 Seeds.",
		"Buy 3 Seeds.",
		"Buy 4 Seeds.",
		"Buy 5 Seeds.",
		"Buy 10 Seeds.",
		"Buy 20 Seeds."
	],
	"What do you want to sell?",
	[
		"Sell Tomatoes",
		"Sell Potatoes",
		"Sell Carrots",
		"Sell Artichokes",
		"Sell Chillis", 
		"Sell Gourds",
		"Sell Corn"
	],
	[
		"Sell 1 crop.",
		"Sell 2 crop.",
		"Sell 3 crop.",
		"Sell 4 crop.",
		"Sell 5 crop.",
		"Sell 10 crop.",
		"Sell 20 crop."
	],
	"Thank you for shopping here!"
];
speakers = [id, objPlayer, id, objPlayer, objPlayer, id, objPlayer, objPlayer, id];
nextLine = [0, [2, 5, -1], 0, [0,0,0,0,0,0,0], [8,8,8,8,8,8,8], 0, [0,0,0,0,0,0,0], [8,8,8,8,8,8,8], -1];
scripts = [
	-1,
	[
		-1,
		-1,
		-1
	],
	-1,
	[
		-1,
		-1,
		-1,
		-1,
		-1,
		-1,
		-1
	],
	[
		-1,
		-1,
		-1,
		-1,
		-1,
		-1,
		-1
	],
	-1,
	[ 
		[store_variable, 0],
		[store_variable, 1],
		[store_variable, 2],
		[store_variable, 3],
		[store_variable, 4],
		[store_variable, 5],
		[store_variable, 6]
	],
	[
		[selling_crop, global.storedVariable, 1],
		[selling_crop, global.storedVariable, 2],
		[selling_crop, global.storedVariable, 3],
		[selling_crop, global.storedVariable, 4],
		[selling_crop, global.storedVariable, 5],
		[selling_crop, global.storedVariable, 10],
		[selling_crop, global.storedVariable, 20]
	],
	-1
];
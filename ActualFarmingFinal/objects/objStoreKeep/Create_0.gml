event_inherited();

sprBase = sprCharBaseMaleDark;
sprTorso = sprCharTorsoMaleLeatherChest;
sprLegs = sprCharLegsMaleArmorMetal;
sprHair = sprCharHairMalePartedBlack;
sprFeet = sprCharFeetMaleShoesBrown;

variableStored = -1;
variableStored2 = -1;
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
		[store_variable, 0, id],
		[store_variable, 1, id],
		[store_variable, 2, id],
		[store_variable, 3, id],
		[store_variable, 4, id],
		[store_variable, 5, id],
		[store_variable, 6, id]
	],
	[
		[run_user_event, id, 0, 1],
		[run_user_event, id, 0, 2],
		[run_user_event, id, 0, 3],
		[run_user_event, id, 0, 4],
		[run_user_event, id, 0, 5],
		[run_user_event, id, 0, 10],
		[run_user_event, id, 0, 20]
	],
	-1
];
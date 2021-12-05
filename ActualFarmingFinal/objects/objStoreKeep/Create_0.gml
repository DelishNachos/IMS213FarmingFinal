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
	"What do you want to sell?",
	[
		"Sell Tomatoes",
		"Sell Potatoes",
		"Sell Carrots",
		"Sell Artichokes",
		"Sell Chillis", 
		"Sell Gourds",
		"Sell Corn"
	]
];
speakers = [id, objPlayer, id, objPlayer, id, objPlayer];
nextLine = [0, [2, 3, -1], 0, [-1,-1,-1,-1,-1,-1,-1], 0, [-1,-1,-1,-1,-1,-1,-1]];
scripts = [
	-1,
	-1,
	-1,
	-1,
	-1,
	-1
];
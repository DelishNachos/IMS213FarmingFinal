event_inherited();

sprBase = sprCharBaseMaleDark;
sprTorso = sprCharTorsoMaleShirtMaroon;
sprLegs = sprCharLegsMalePantsRed;
sprHair = sprCharHairMalePartedBlack;
sprFeet = sprCharFeetMaleShoesBrown;

portraitIndex = 3;
voice = sndVoice4;
speakerName = "Patrick";
text = [
	"Who are you?", 
	[
		"I'm the Player. I'm kind of a big deal.",
		"Does anyone really know who they are?"
	], 
	"Okay...",
	"Well I'm Patrick. Nice to meet you!"
];
speakers = [id, objPlayer, id, id];
nextLine = [0, [2, 3], -1, -1];
scripts = [
	-1,
	[
		-1,
		-1
	],
	-1,
	-1
];
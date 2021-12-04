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
		"I'm the Player. I'm kind of a big deal. This is a test line to test the wrapping of the choices text",
		"Does anyone really know who they are"
	], 
	"Okay...",
	"Well I'm Patrick. Nice to meet you!"
];
speakers = [id, objPlayer, id, id];
nextLine = [0, [2, 3], -1, -1];
scripts = [
	[change_variable, id, "sprTorso", -1],
	[
		[change_variable, id, "sprFeet", -1],
		[change_variable, id, "sprTorso", sprCharTorsoMaleShirtMaroon],
	],
	-1,
	-1
];
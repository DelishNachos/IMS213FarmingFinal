randomize();
room_goto_next();

global.storedVariable = -1;

debug = false;

blackAlpha = 0;

spawnRoom = -1;
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
doTransition = false;

enum dir{
	right = 0,
	up = 90,
	left = 180,
	down = 270
}

global.gameWidth = 750;
global.gameHeight = 420;

display_set_gui_size(global.gameWidth, global.gameHeight);
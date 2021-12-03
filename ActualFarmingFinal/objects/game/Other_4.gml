roomWidth = room_width;
roomHeight = room_height;

if(spawnRoom == -1) exit;
objPlayer.x = spawnX;
objPlayer.y = spawnY;
objPlayer.facing = spawnPlayerFacing;

with(objPlayer){
	switch(facing){
		case dir.left: yFrame = 9; break;
		case dir.right: yFrame = 11; break;
		case dir.up: yFrame = 8; break;
		case dir.down: yFrame = 10; break;
		case -1: xFrame = 0; break;
	}
}
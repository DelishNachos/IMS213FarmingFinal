var animLength = 9;
var frameSize = 64;
var animSpeed = 12;

switch(facing){
	case dir.left: yFrame = 9; break;
	case dir.right: yFrame = 11; break;
	case dir.up: yFrame = 8; break;
	case dir.down: yFrame = 10; break;
	case -1: xFrame = 0; break;
}

var xx = x-xOffset;
var yy = y-yOffset;

if(xFrame + (animSpeed/60) < animLength) { xFrame += animSpeed / 60; }
else {xFrame = 0;}

if(sprShadow !=1) draw_sprite(sprShadow, 0, x, y);
if(sprBase != -1)draw_sprite_part(sprBase, 0, floor(xFrame) * frameSize, yFrame * frameSize, frameSize, frameSize, xx, yy);
if(sprFeet != -1)draw_sprite_part(sprFeet, 0, floor(xFrame) * frameSize, yFrame * frameSize, frameSize, frameSize, xx, yy);
if(sprLegs != -1)draw_sprite_part(sprLegs, 0, floor(xFrame) * frameSize, yFrame * frameSize, frameSize, frameSize, xx, yy);
if(sprTorso != -1) draw_sprite_part(sprTorso, 0, floor(xFrame) * frameSize, yFrame * frameSize, frameSize, frameSize, xx, yy);
if(sprHair != -1) draw_sprite_part(sprHair, 0, floor(xFrame) * frameSize, yFrame * frameSize, frameSize, frameSize, xx, yy);




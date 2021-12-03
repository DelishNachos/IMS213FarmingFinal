var animLength = 9;
var frameSize = 64;
var animSpeed = 12;

if (moveX < 0) yFrame = 9;
else if (moveX > 0) yFrame = 11;
else if (moveY < 0) yFrame = 8;
else if (moveY > 0) yFrame = 10;
else xFrame = 0;

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




wSpd = 1;
nSpd = 2;
rSpd = 3;

spd = wSpd;

xFrame = 1;
yFrame = 8;

xOffset = sprite_get_xoffset(mask_index);
yOffset = sprite_get_yoffset(mask_index);

sprBase = -1;
sprTorso = -1;
sprLegs = -1;
sprHair = -1;
sprFeet = -1;
sprShadow = sprCharShadow;

moveX = 0;
moveY = 0;

alarm[1] = 1 * room_speed;
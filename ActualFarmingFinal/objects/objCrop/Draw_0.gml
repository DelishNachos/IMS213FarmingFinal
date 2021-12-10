// @description 
draw_sprite_part(
	sprCrops, 0, growthStage*frameWidth, 
	cropType*frameHeight, 32, 64, xx,yy
);

if(sparkle >= 0){
	draw_sprite(sprSparkle, sparkle, x+2, y-10);
	sparkle += .1;
	if(sparkle >= sprite_get_number(sprSparkle)){
		sparkle = -1;
		alarm[1] = random_range(4,5) * room_speed;
	}
}
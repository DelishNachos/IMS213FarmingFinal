if(doTransition){
	if(room != spawnRoom) {
		blackAlpha += .1;
		if(blackAlpha >= 1) { room_goto(spawnRoom); }
	} else {
		blackAlpha -= .1;
		if(blackAlpha <= 0) { doTransition = false; }
	}
	
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0, 0, global.gameWidth, global.gameHeight, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
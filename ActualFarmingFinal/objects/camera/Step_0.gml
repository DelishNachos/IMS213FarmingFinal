moveCam = keyboard_check(ord("C"));

if(moveCam){
	inputLeft = keyboard_check(vk_left);
	inputRight = keyboard_check(vk_right);
	inputUp = keyboard_check(vk_up);
	inputDown = keyboard_check(vk_down);
	
	x += (inputRight - inputLeft)*6;
	y += (inputDown - inputUp)*6;
}else{
	x = clamp(x, following.x-hBorder, following.x+hBorder);
	y = clamp(y, following.y-vBorder, following.y+vBorder);
}
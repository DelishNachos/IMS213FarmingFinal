moveCam = keyboard_check(ord("C"));

if(moveCam){
	inputLeft = keyboard_check(ord("A"));
	inputRight = keyboard_check(ord("D"));
	inputUp = keyboard_check(ord("W"));
	inputDown = keyboard_check(ord("S"));
	
	x += (inputRight - inputLeft)*6;
	y += (inputDown - inputUp)*6;
}else{
	x = clamp(x, following.x-hBorder, following.x+hBorder);
	y = clamp(y, following.y-vBorder, following.y+vBorder);
}
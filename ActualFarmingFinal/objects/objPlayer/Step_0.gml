inputLeft = keyboard_check(vk_left);
inputRight = keyboard_check(vk_right);
inputUp = keyboard_check(vk_up);
inputDown = keyboard_check(vk_down);
inputWalk = keyboard_check(vk_control);
inputRun = keyboard_check(vk_shift);
inputInteract = keyboard_check_pressed(ord("E"));

if (inputWalk or inputRun) {
	spd = abs((inputWalk*wSpd) - (inputRun*rSpd));
} else{
	spd = nSpd;	
}

moveX = 0;
moveY = 0;

moveX = (inputRight - inputLeft) * spd;
if(moveX == 0) {moveY = (inputDown - inputUp) * spd;}

if(moveX != 0) {
	switch(sign(moveX)){
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else if(moveY != 0) {
	switch(sign(moveY)){
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
} else facing = -1;

if(moveX != 0) {
	var collisionH = instance_place(x+moveX, y, objCollision)
	if(collisionH != noone and collisionH.collideable){
		repeat(abs(moveX)){
			if(!place_meeting(x+sign(moveX), y, objCollision)) {x += sign(moveX); }
			else {break;}
		}
		moveX = 0;
	}
}

else if(moveY != 0){
	var collisionV = instance_place(x, y+moveY, objCollision)
	if(collisionV != noone and collisionV.collideable){
		repeat(abs(moveY)){
			if(!place_meeting(x, y+sign(moveY), objCollision)) {y += sign(moveY);}
			else {break;}
		}
		moveY = 0;
	}
}

var inst = instance_place(x, y, objTransition);
if(inst != noone and facing == inst.playerFacingBefore) {
	with(game){
		if(!doTransition){
			spawnRoom = inst.targetRoom;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spawnPlayerFacing = inst.playerFacingAfter;
			doTransition = true;
		}
	}
}

//Textbox
if(inputInteract){
	
	if(activeTextbox == noone){
	
		var inst = collision_rectangle(x - radius, y - radius, x + radius, y + radius, objParentNPC, false, false);	

		if(inst != noone){
			with(inst){
				var tbox = create_textbox(text, speakers);
				canMove = false;
				moveX = 0; moveY = 0;
			}
			activeTextbox = tbox;
		}
	} else{
		if(!instance_exists(activeTextbox)){
			activeTextbox = noone;	
		}
	}
}

x += moveX;
y += moveY;
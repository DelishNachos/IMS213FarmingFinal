if(!canMove) exit;


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

x += moveX;
y += moveY;
if(dropMove){
	x = lerp(x, goalX, 0.1);	
	y = lerp(x, goalY, 0.1);
	if((abs(x-goalX) < 1) and (abs(y-goalY))) {dropMove = false;}
} else{
	if(!keyboard_check(ord("O"))) exit;
	
	var px = objPlayer.x;
	var py = objPlayer.y;
	var r = 32;
	
	if(point_in_rectangle(px, py, x - r, y - r, x+r, y+r)){
		
		r = 2;
		if(!point_in_rectangle(px, py, x - r, y - r, x+r, y+r)){
			x = lerp(x, px, 0.1);	
			y = lerp(x, py, 0.1);
		}else{
			var in = itemNum;
			
			with(inventory){
				var dsInv = ds_inventory;
				var pickedUp = false;
				
				var yy = 0; repeat(invSlots){
					if(dsInv[# 0, yy] == in){
						dsInv[# 1, yy] += 1;
						pickedUp = true;
						break;
					} else{
						yy++;	
					}
				}
				
				
				if(!pickedUp){
					var yy = 0; repeat(invSlots){
						if(dsInv[# 0, yy] == item.none){
							dsInv[# 0, yy] = in;
							dsInv[# 1, yy] += 1;
							pickedUp = true;
							break;
						} else{
							yy++;	
						}
					}
				}			
			}
			
			if(pickedUp){
					instance_destroy();
					show_debug_message("Picked up an item.");
				}
		}
	}
}
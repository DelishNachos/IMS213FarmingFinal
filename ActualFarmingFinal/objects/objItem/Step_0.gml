if(dropMove){
	x = lerp(x, goalX, 0.1);	
	y = lerp(y, goalY, 0.1);
	if( abs(x-goalX) < 1 and abs(y-goalY) < 1) {dropMove = false;}
} else{
	if(!keyboard_check(ord("O"))) exit;
	
	var px = objPlayer.x;
	var py = objPlayer.y;
	var r = 32;
	
	if(point_in_rectangle(px, py, x - r, y - r, x+r, y+r)){
		
		r = 2;
		if(!point_in_rectangle(px, py, x - r, y - r, x+r, y+r)){
			x = lerp(x, px, 0.1);	
			y = lerp(y, py, 0.1);
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
				
				#region Create Notification
				
				if(!instance_exists(objNotification)) { instance_create_layer(0,0,"Instances", objNotification); }
				var in = itemNum;
				with(objNotification){
					if(!ds_exists(ds_notifications, ds_type_grid)){
						ds_notifications = ds_grid_create(2, 1);
						var notGrid = ds_notifications;
						notGrid[# 0, 0] = 1;
						notGrid[# 1, 0] = inventory.ds_items_info[# 0, in];
					} else{
						event_perform(ev_other, ev_user0);
						
						var notGrid = ds_notifications;
						var gridHeight = ds_grid_height(notGrid);
						var name = inventory.ds_items_info[# 0, in];
						var inGrid = false;
						
						var yy = 0; repeat (gridHeight){
							if(name == notGrid[# 1, yy]){
								notGrid[# 0, yy] += 1;
								inGrid = true;
								break;
							}	
							yy++;
						}
						
						if(!inGrid){
							ds_grid_resize(notGrid, 2, gridHeight + 1);
							notGrid[# 0, gridHeight] = 1;
							notGrid[# 1, gridHeight] = inventory.ds_items_info[# 0, in];
						}
					}
				}
				
				#endregion
				
				instance_destroy();
				show_debug_message("Picked up an item.");
			}
		}
	}
}
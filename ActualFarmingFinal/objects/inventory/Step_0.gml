#region manual hotbar
	ds_hotbar[# 0, 0] = ds_inventory[# 0, 0];
	ds_hotbar[# 1, 0] = ds_inventory[# 1, 0];
	
	ds_hotbar[# 0, 1] = ds_inventory[# 0, 1];
	ds_hotbar[# 1, 1] = ds_inventory[# 1, 1];
	
	ds_hotbar[# 0, 2] = ds_inventory[# 0, 2];
	ds_hotbar[# 1, 2] = ds_inventory[# 1, 2];
	
	ds_hotbar[# 0, 3] = ds_inventory[# 0, 3];
	ds_hotbar[# 1, 3] = ds_inventory[# 1, 3];
	
	ds_hotbar[# 0, 4] = ds_inventory[# 0, 4];
	ds_hotbar[# 1, 4] = ds_inventory[# 1, 4];
	
	ds_hotbar[# 0, 5] = ds_inventory[# 0, 5];
	ds_hotbar[# 1, 5] = ds_inventory[# 1, 5];
	
	ds_hotbar[# 0, 6] = ds_inventory[# 0, 6];
	ds_hotbar[# 1, 6] = ds_inventory[# 1, 6];
	
	ds_hotbar[# 0, 7] = ds_inventory[# 0, 7];
	ds_hotbar[# 1, 7] = ds_inventory[# 1, 7];
#endregion

#region hotbar

if(keyboard_check_pressed(ord("1"))) { hotSelectedSlot = 0; }
else if (keyboard_check_pressed(ord("2"))){ hotSelectedSlot = 1; }
else if (keyboard_check_pressed(ord("3"))){ hotSelectedSlot = 2; }
else if (keyboard_check_pressed(ord("4"))){ hotSelectedSlot = 3; }
else if (keyboard_check_pressed(ord("5"))){ hotSelectedSlot = 4; }
else if (keyboard_check_pressed(ord("6"))){ hotSelectedSlot = 5; }
else if (keyboard_check_pressed(ord("7"))){ hotSelectedSlot = 6; }
else if (keyboard_check_pressed(ord("8"))){ hotSelectedSlot = 7; }

if(mouse_wheel_down()){
	if(hotSelectedSlot == 7){
		hotSelectedSlot = 0;	
	}else{
		hotSelectedSlot++;	
	}
}
if(mouse_wheel_up()){
	if(hotSelectedSlot == 0){
		hotSelectedSlot = 7	
	}else{
		hotSelectedSlot--;	
	}
}

#endregion

#region inventory
if(keyboard_check_pressed(ord("I"))) { showInv = !showInv; }
if(!showInv) exit;

	#region Mouse Slot
mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);

var cellXBuff = (cellSize + xBuffer) * scale;
var cellYBuff = (cellSize + yBuffer) * scale;

var iMouseX = mouseX - slotsX;
var iMouseY = mouseY - slotsY;

var nx = iMouseX div cellXBuff;
var ny = iMouseY div cellYBuff;

var mouseInInv = true;
if(nx >= 0 and nx < invSlotsWidth and ny >= 0 and ny < invSlotsHeight){
	var sx = iMouseX - (nx*cellXBuff);
	var sy = iMouseY - (ny*cellXBuff);
	
	if((sx < cellSize * scale) and (sy < cellSize*scale)){
		mSlotX = nx;
		mSlotY = ny;
	}
} else { mouseInInv = false; }

selectedSlot = min(invSlots - 1, mSlotX + (mSlotY * invSlotsWidth));
	#endregion

var invGrid = ds_inventory;
var ssItem = invGrid[# 0, selectedSlot];
var createNot = false;

if(pickupSlot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(!mouseInInv){
			createNot = true;
			
			var pitem = invGrid[# 0, pickupSlot];
			var in = pitem;
			invGrid[# 1, pickupSlot] -= 1;
			
			if(invGrid[# 1, pickupSlot] == 0){
				invGrid[# 0, pickupSlot] = item.none;
				pickupSlot = -1;
			}
		
			var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
			with(inst){
				itemNum = pitem;
				xFrame = itemNum mod (sprWidth/cellSize);
				yFrame = itemNum div (sprWidth/cellSize);
			}
		}
			else if(ssItem == item.none){
			invGrid[# 0, selectedSlot] = invGrid[# 0, pickupSlot];
			invGrid[# 1, selectedSlot] = invGrid[# 1, pickupSlot];
			
			invGrid[# 0, pickupSlot] = item.none;
			invGrid[# 1, pickupSlot] = 0;
			
			pickupSlot = -1;
		} else if (ssItem == invGrid[# 0, pickupSlot]){
			if(selectedSlot != pickupSlot){
				invGrid[# 1, selectedSlot] += invGrid[# 1, pickupSlot];		
				invGrid[# 0, pickupSlot] = item.none;
				invGrid[# 1, pickupSlot] = 0;
			}
			
			pickupSlot = -1;
		} else{
			var ssItemNum = invGrid[# 1, selectedSlot];
			invGrid[# 0, selectedSlot] = invGrid[# 0, pickupSlot];
			invGrid[# 1, selectedSlot] = invGrid[# 1, pickupSlot];
			
			invGrid[# 0, pickupSlot] = ssItem;
			invGrid[# 1, pickupSlot] = ssItemNum;
		}
	}
}
else if(ssItem != item.none){
	if(mouse_check_button_pressed(mb_middle)){
		createNot = true;
		var in = invGrid[# 0, selectedSlot];
		
		invGrid[# 1, selectedSlot] -= 1;
		if(invGrid[# 1, selectedSlot] == 0) {invGrid[# 0, selectedSlot] = item.none;}
		
		var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
		with(inst){
			itemNum = ssItem;
			xFrame = itemNum mod (sprWidth/cellSize);
			yFrame = itemNum div (sprWidth/cellSize);
		}
		show_debug_message("Dropped an item");
	}
	
	if(mouse_check_button_pressed(mb_right)){
		pickupSlot = selectedSlot;
	}
}

if(createNot){
	#region Create Notification
				
if(!instance_exists(objNotification)) { instance_create_layer(0,0,"Instances", objNotification); }

with(objNotification){
	if(!ds_exists(ds_notifications, ds_type_grid)){
		ds_notifications = ds_grid_create(2, 1);
		var notGrid = ds_notifications;
		notGrid[# 0, 0] = -1;
		notGrid[# 1, 0] = inventory.ds_items_info[# 0, in];
	} else{
		event_perform(ev_other, ev_user0);
						
		var notGrid = ds_notifications;
		var gridHeight = ds_grid_height(notGrid);
		var name = inventory.ds_items_info[# 0, in];
		var inGrid = false;
						
		var yy = 0; repeat (gridHeight){
			if(name == notGrid[# 1, yy]){
				notGrid[# 0, yy] -= 1;
				inGrid = true;
				break;
			}	
			yy++;
		}
						
		if(!inGrid){
			ds_grid_resize(notGrid, 2, gridHeight + 1);
			notGrid[# 0, gridHeight] = -1;
			notGrid[# 1, gridHeight] = inventory.ds_items_info[# 0, in];
		}
	}
}
				
	#endregion
}

#endregion

#region Money Calculator
	var playGrid = ds_player_info;
	var bronze = 0;
	var silver = 0;
	var gold = 0;
	
	if(playGrid[# 1, 2] >= 100){
		bronze = playGrid[# 1, 2] mod 100;
		silver = playGrid[# 1, 2] div 100;
		playGrid[# 1, 2] = bronze;
		playGrid[# 1, 1] += silver
	}
	if(playGrid[# 1, 1] >= 100){
		silver = playGrid[# 1, 1] mod 100;
		gold = playGrid[# 1, 1] div 100;
		playGrid[# 1, 1] = silver;
		playGrid[# 1, 0] += gold;
	}
#endregion
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

if(nx >= 0 and nx < invSlotsWidth and ny >= 0 and ny < invSlotsHeight){
	var sx = iMouseX - (nx*cellXBuff);
	var sy = iMouseY - (ny*cellXBuff);
	
	if((sx < cellSize * scale) and (sy < cellSize*scale)){
		mSlotX = nx;
		mSlotY = ny;
	}
}

selectedSlot = min(invSlots - 1, mSlotX + (mSlotY * invSlotsWidth));
#endregion

var invGrid = ds_inventory;
var ssItem = invGrid[# 0, selectedSlot];

if(pickupSlot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(ssItem == item.none){
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
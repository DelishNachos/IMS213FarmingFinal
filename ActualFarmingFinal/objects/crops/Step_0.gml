/// @description 
if(room != rm1){ planting = false; exit; }
#region Planting
var hotGrid = inventory.ds_hotbar;
var ss = inventory.hotSelectedSlot;
var cs = cellSize;

var currentItem = hotGrid[# 0, ss];

if((currentItem > 16 and currentItem  < 24) or currentItem == 0){

	if(keyboard_check_pressed(ord("P"))){ planting = !planting } 

	if(planting){	
		mx = mouse_x;
		my = mouse_y;
		var gx = (mx div cs);
		var gy = (my div cs);
		
		if(currentItem == 0){
			emptyHand = true;	
		} else{
			emptyHand = false;
			selectCrop = currentItem - 17;
		}
	
		/*if(mouse_wheel_up()) selectCrop += 1; 
		if(mouse_wheel_down()) selectCrop -= 1; 
	
		if(selectCrop > sprite_get_number(sprCropsPicked)-1) { selectCrop = 0; }
		else if (selectCrop < 0) { selectCrop = sprite_get_number(sprCropsPicked)-1; }*/
	
		if(mouse_check_button_pressed(mb_left)){
			if(emptyHand){
				harvest_crop(mx, my);
			} else if(ds_crops_instances[# gx, gy] == 0){
				instance_create_crop(mx, my, selectCrop);
				hotGrid[# 1, ss] -= 1;
				if(hotGrid[# 1, ss] == 0) { hotGrid[# 0, ss] = item.none; }
				with(inventory){
					ds_inventory[# 0, ss] = hotGrid[# 0, ss]
					ds_inventory[# 1, ss] = hotGrid[# 1, ss]
				}
			}
		}
	}	
	
} else { planting = false; }
#endregion

if(instance_exists(objCrop) and keyboard_check_pressed(ord("G"))){
	with(objCrop){
		if(growthStage < maxGrowthStage){
			daysOld +=1;
			
			var firstGrowth = 0;
			if(daysOld > 0) {firstGrowth = 1;}
			
			growthStage = firstGrowth + (daysOld div growthStageDuration);
		} else {
			growthStage = maxGrowthStage;
			fullyGrown = true;
			alarm[1] = 1;
		}
	}
}
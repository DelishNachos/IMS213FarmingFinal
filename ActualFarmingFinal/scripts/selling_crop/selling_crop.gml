function selling_crop(_cropType, amt){
	show_debug_message("Running the script");
	show_debug_message(amt);
	show_debug_message(_cropType);
	var foundItem = false;
	
	var invGrid = inventory.ds_inventory;
	var playGrid = inventory.ds_player_info;
	var cropGrid = crops.ds_crops_types;
	
	var bronze = 0;
	var silver = 0;
	
	var yy = 0; repeat(ds_grid_height(invGrid)){
		if(invGrid[# 0, yy] == _cropType + 1){
			show_debug_message("Found Item");
			foundItem = true;
			if(invGrid[# 1, yy] >= amt){
				show_debug_message("Have enough items");
				var currentNumber = invGrid[# 1, yy];
				var subNumber = currentNumber - amt
				if(subNumber <= 0) { 
					invGrid[# 1, yy] = 0; 
					invGrid[# 0, yy] = item.none;
				} 
				else { invGrid[# 1, yy] -= amt; }
				break;
			}
		}
		yy++;
	}
	
	if(foundItem){
		var value = cropGrid[# 1, _cropType] * amt;
		if((playGrid[# 1, 2] + value) < 100){
			playGrid[# 1, 2] += value;	
		}
		else {
			silver = value div 100;
			bronze = value mod 100;
			playGrid[# 1, 2] += bronze;
			playGrid[# 1, 1] += silver;
		}
			
		//playGrid[# 1, 2] += value;
	}
	
}
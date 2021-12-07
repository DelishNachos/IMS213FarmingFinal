function selling_crop(_cropType, amt){
	show_debug_message("Running the script");
	
	var foundItem = false;
	
	var invGrid = inventory.ds_inventory;
	var playGrid = inventory.ds_player_info;
	var cropGrid = crops.ds_crops_types;
	
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
					invGrid[# 1, yy] = item.none;
				} 
				else { invGrid[# 1, yy] -= amt; }
				break;
			}
		}
	}
	
	if(foundItem){
		var value = cropGrid[# 1, _cropType] * amt;
		playGrid[# 1, 2] += value;
	}
	
}
if(room == rm1){
	var instNum = instance_number(objCrop);
	if(instNum == 0) { ds_grid_clear(ds_crops_data, -1); }
	else {
		ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), instNum);
		
		var gw = ds_grid_width(ds_crops_instances);
		var gh = ds_grid_height(ds_crops_instances);
		var slot = 0;
		
		var xx = 0; repeat (gw){
			var yy = 0; repeat (gh){
				var inst = ds_crops_instances[# xx, yy];
				
				if(inst != 0){
					ds_crops_data[# 0, slot] = xx;
					ds_crops_data[# 1, slot] = yy;
					ds_crops_data[# 2, slot] = inst.cropType;
					ds_crops_data[# 3, slot] = inst.daysOld;
					
					slot += 1;
				}			
				yy += 1;	
			}
			xx += 1;
		}
	}
	
	ds_grid_destroy(ds_crops_instances);
}
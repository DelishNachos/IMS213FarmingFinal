///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type
function instance_create_crop(argument0, argument1, argument2) {

	var cs = crops.cellSize;
	var gx = argument0 div cs;
	var gy = argument1 div cs;
	var iGrid = crops.ds_crops_instances;
	var cell = iGrid[# gx, gy];
	
	if(cell == 0) {
		var xx = gx * cs;
		var yy = gy * cs;
		
		var layID = layer_get_id("T_soil");
		var mapID = layer_tilemap_get_id(layID);
		var data = tilemap_get_at_pixel(mapID, argument0, argument1);
		
		if(data == 0) {
			show_debug_message("there is no soil here.");
			return false;
		} else {
			show_debug_message("there is soil here.");
		}
	
		//Create the instance
		var inst = instance_create_layer(argument0, argument1, "Instances", objCrop);
		iGrid[# gx, gy] = inst;

		//Give the crop its characteristics
		with(inst){
			cropType = argument2;
			growthStageDuration = crops.ds_crops_types[# 0, cropType];
		}

		return inst;	
	} else{
		show_debug_message("There is already something there");
		return false;
	}


}

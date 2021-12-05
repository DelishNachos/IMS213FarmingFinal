///@arg x
///@arg y
///@arg crop_type
function harvest_crop(_x, _y){

	var cs = crops.cellSize;
	var gx = _x div cs;
	var gy = _y div cs;
	var iGrid = crops.ds_crops_instances;
	var cell = iGrid[# gx, gy];
	var cGrid = crops.ds_crops_data;
	/*var cropX = -1;
	var cropY = -1;*/
	
	if(cell != 0) {
		var xx = gx * cs;
		var yy = gy * cs;
		
		var layID = layer_get_id("tSoil");
		var mapID = layer_tilemap_get_id(layID);
		var data = tilemap_get_at_pixel(mapID, _x, _y);
		
		if(data == 0) {
			//show_debug_message("there is no soil here.");
			return false;
		} else {
			//show_debug_message("there is soil here.");
		}
	
		var inst = collision_rectangle(xx, yy, xx+cs, yy+cs, objCrop, false, false);
		var ct = inst.cropType;
		show_debug_message("This is a " + string(ct));
		
		if(inst.fullyGrown == false){
			return false;	
		}
		
		instance_destroy(inst);
		var iinst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
		with(iinst){
			itemNum = ct+1;
			xFrame = itemNum mod (sprWidth/cellSize);
			yFrame = itemNum div (sprWidth/cellSize);
		}
		
		iGrid[# gx, gy] = 0;
	}	
	
	return false;
}
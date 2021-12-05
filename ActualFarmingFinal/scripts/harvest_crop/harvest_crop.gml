///@arg x
///@arg y
///@arg crop_type
function harvest_crop(_x, _y, _cropType){

	var cs = crops.cellSize;
	var gx = _x div cs;
	var gy = _y div cs;
	var iGrid = crops.ds_crops_instances;
	var cell = iGrid[# gx, gy];
	
	if(cell == 0) {
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
		
		if(iGrid[# gx, gy] == ){
			return false;
		}
		
		
}
/// @description 
if(!planting) exit;

var cs = cellSize;
var xx = (mx div cs);
var yy = (my div cs);

xx = xx*cs;
yy = yy*cs;

var c = c_red;

var layID = layer_get_id("TSoil");
var mapID = layer_tilemap_get_id(layID);
var data = tilemap_get_at_pixel(mapID, mx, my);

if(data != 0) {c = c_lime;}

draw_rectangle_color(xx, yy, xx+cs, yy+cs, c,c,c,c, true);

//Draw the crop to be planted
draw_sprite(sprCropsPicked, selectCrop, xx + (cs/2), yy + (cs/2));
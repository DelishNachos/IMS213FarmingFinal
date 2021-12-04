var notGrid = ds_notifications;
var gridHeight = ds_grid_height(notGrid);
var c = c_white;

var yy = 0; repeat(gridHeight){
	var notSign = "";
	if(notGrid[# 0, yy] > 0){ notSign = "+"; }
	
	draw_text_color(
		100, (guiHeight/2) + (yy * strHeight) - (gridHeight*strHeight),
		notSign + string(notGrid[# 0, yy]) + " " + string(notGrid[# 1, yy]),
		c, c, c, c, notAlpha
	);
	
	yy++;	
}


if(fadeAway) notAlpha -= .1;
if(notAlpha <= 0) instance_destroy();
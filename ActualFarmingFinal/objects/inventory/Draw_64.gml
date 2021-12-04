if(!showInv) exit;

draw_sprite_part_ext(
	sprInvUI, 0, cellSize, 0, invWidth, invHeight,
	invUIX, invUIY, scale, scale, c_white, 1
);

var infoGrid = ds_player_info;

draw_set_font(fntTitle);
var c = c_black;
draw_text_color(infoX, infoY, infoGrid[# 0, 3] + ": " + infoGrid[# 1, 3], c,c,c,c, 1);

draw_set_font(fntNums);
var yy = 0; repeat(3){
	draw_text_color(infoX + (192 * scale) + ((15+18) * scale*yy), infoY, string(infoGrid[# 1, yy]), c,c,c,c,1);
	yy++;
}


var ii, ix, iy, xx, yy, sx, sy, iItem, invGrid;
ii = 0; ix = 0; iy = 0; invGrid = ds_inventory
repeat(invSlots){
	xx = slotsX + ((cellSize + xBuffer) * ix * scale);
	yy = slotsY + ((cellSize + yBuffer) * iy * scale);
	
	iItem = invGrid[# 0, ii];
	sx = (iItem mod sprInvItemsColumns) * cellSize;
	sy = (iItem div sprInvItemsColumns) * cellSize;
	
	draw_sprite_part_ext(sprInvUI, 0, 0, 0, cellSize, cellSize, xx, yy, scale, scale, c_white, 1);
	switch(ii){
		case selectedSlot: 
			if(iItem > 0) draw_sprite_part_ext(sprInvItems, 0, sx, sy, cellSize, cellSize, xx, yy, scale, scale, c_white, 1);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(sprInvUI, 0, 0, 0, cellSize, cellSize, xx, yy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
		break;
		
		case pickupSlot:
			if(iItem > 0) draw_sprite_part_ext(sprInvItems, 0, sx, sy, cellSize, cellSize, xx, yy, scale, scale, c_white, .2);
			
		break;
		
		default: if(iItem > 0) draw_sprite_part_ext(sprInvItems, 0, sx, sy, cellSize, cellSize, xx, yy, scale, scale, c_white, 1);
		break;
	}
	
	
	if (iItem > 0){
		var number = invGrid[# 1, ii];
		draw_text_color(xx, yy, string(number), c, c, c, c, 1);
	}
	
	ii++;
	ix = ii mod invSlotsWidth;
	iy = ii div invSlotsWidth;
}


var iInfoGrid = ds_items_info, description = ""; 
iItem = invGrid[# 0, selectedSlot];

if(iItem > 0){
	draw_set_font(fntRegText);
	description = iInfoGrid[# 0, iItem] + ". " + iInfoGrid[# 1, iItem];
	c = c_black;
	draw_text_ext_color(descX, descY, description, string_height("M"), invWidth * scale - (xBuffer*2),c,c,c,c, 1); 
}


if(pickupSlot != -1){
	iItem = invGrid[# 0, pickupSlot];
	sx = (iItem mod sprInvItemsColumns) * cellSize;
	sy = (iItem div sprInvItemsColumns) * cellSize;	
	
	draw_sprite_part_ext(sprInvItems, 0, sx, sy, cellSize, cellSize, mouseX, mouseY, scale, scale, c_white, 1);
	var iNum = invGrid[# 1, pickupSlot];
	draw_text_color(mouseX + (cellSize * scale * .5), mouseY, string(iNum), c, c, c, c, 1);
}
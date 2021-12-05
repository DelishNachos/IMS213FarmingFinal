draw_sprite_ext(sprHotUI, 0, hotUIX, hotUIY, scale, scale, 0, c_white, 1);

var hi, hix, hiy, xxx, yyy, hsx, hsy, hitem, hotGrid;
hi = 0; hix = 0; hiy = 0; hotGrid = ds_hotbar;
repeat(hotSlots){
	//x y location for slot
	xxx = hotSlotsX + ((cellSize+xBuffer) * hix * scale);
	yyy = hotSlotsY + ((cellSize+yBuffer) * hiy * scale);
	
	//Item
	hitem = hotGrid[# 0, hi];
	hsx = (hitem mod sprInvItemsColumns) * cellSize;
	hsy = (hitem div sprInvItemsColumns) * cellSize;
	
	//draw slot and item
	draw_sprite_part_ext(sprInvUI, 0, 0, 0, cellSize, cellSize, xxx, yyy, scale, scale, c_white, 1);
	switch(hi){
		case hotSelectedSlot: 
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(sprInvUI, 0, 0, 0, cellSize, cellSize, xxx, yyy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
			if(hitem > 0) draw_sprite_part_ext( sprInvItems, 0, hsx, hsy, cellSize, cellSize, xxx, yyy, scale, scale, c_white, 1);
			
		
		default: if(hitem > 0) draw_sprite_part_ext( sprInvItems, 0, hsx, hsy, cellSize, cellSize, xxx, yyy, scale, scale, c_white, 1); break;
	}
	
	if(hitem > 0) draw_sprite_part_ext( sprInvItems, 0, hsx, hsy, cellSize, cellSize, xxx, yyy, scale, scale, c_white, 1);
	
	//draw item number
	if(hitem > 0){
		var hNumber = hotGrid[# 1, hi];
		draw_set_font(fntNums);
		draw_text_color(xxx, yyy, string(hNumber), c_black, c_black, c_black, c_black, 1);
	}
	
	hi++;
	hix = hi mod hotSlotsWidth;
	hiy = hi div hotSlotsWidth;
}

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
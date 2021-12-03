depth = -1;
scale = 2;
showInv = true;

invSlots = 17;
invSlotsWidth = 8;
invSlotsHeight = 3;

selectedSlot = 0;
pickupSlot = -1;
mSlotX = 0;
mSlotY = 0;

xBuffer = 2;
yBuffer = 4;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

cellSize = 32;

invWidth = 288;
invHeight = 192;

sprInvUI = sprInventoryUI;
sprInvItems = sprInventoryItems;

sprInvItemsColumns = sprite_get_width(sprInvItems) / cellSize;
sprInvItemsRows = sprite_get_height(sprInvItems) / cellSize;

invUIX = (guiWidth * .5) - (invWidth * .5 * scale);
invUIY = (guiHeight * .5) - (invHeight * .5 * scale);

infoX = invUIX + (9 * scale);
infoY = invUIY + (7 * scale);

slotsX = infoX;
slotsY = invUIY + (40 * scale);


ds_player_info = ds_grid_create(2, 4);
var infoGrid = ds_player_info;
infoGrid[# 0, 0] = "Gold";
infoGrid[# 0, 1] = "Silver";
infoGrid[# 0, 2] = "Bronze";
infoGrid[# 0, 3] = "Name";

infoGrid[# 1, 0] = irandom_range(0, 99);
infoGrid[# 1, 1] = irandom_range(0, 99);
infoGrid[# 1, 2] = irandom_range(0, 99);
infoGrid[# 1, 3] = "Player";


ds_inventory = ds_grid_create(2, invSlots);
var dsInv = ds_inventory;

enum item{
	none		=0,
	tomato		=1,
	potato		=2,
	carrot		=3,
	artichoke	=4,
	chilli		=5,
	gourd		=6,
	corn		=7,
	wood		=8,
	stone		=9,
	bucket		=10,
	chair		=11,
	picture		=12,
	axe			=13,
	potion		=14,
	starfish	=15,
	mushroom	=16,
	height		=17,
}

var yy = 0; repeat(invSlots){
	dsInv[# 0, yy] = irandom_range(1, item.height-1); 
	dsInv[# 1, yy] = irandom_range(1, 10);
	yy++;
}
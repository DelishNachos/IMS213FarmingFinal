depth = -1;
scale = 1;
showInv = false;

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

invUIX = (guiWidth * .5) - (invWidth * .5 * scale);
invUIY = (guiHeight * .5) - (invHeight * .5 * scale);

infoX = invUIX + (9 * scale);
infoY = invUIY + (7 * scale);

slotsX = infoX;
slotsY = invUIY + (40 * scale);

descX = infoX;
descY = invUIY + (156 * scale);


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
	none				=0,
	tomato				=1,
	potato				=2,
	carrot				=3,
	artichoke			=4,
	chilli				=5,
	gourd				=6,
	corn				=7,
	wood				=8,
	stone				=9,
	bucket				=10,
	chair				=11,
	picture				=12,
	axe					=13,
	potion				=14,
	starfish			=15,
	mushroom			=16,
	tomatoSeeds			=17,
	potatoSeeds			=18,
	carrotSeeds			=19,
	artichokeSeeds		=20,
	chilliSeeds			=21,
	gourdSeeds			=22,
	cornSeeds			=23,
	height				=24,
}

#region Create Items Info Grid

ds_items_info = ds_grid_create(2, item.height);

var z = 0, i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Potato";
ds_items_info[# z, i++] = "Carrot";
ds_items_info[# z, i++] = "Artichoke";
ds_items_info[# z, i++] = "Chilli";
ds_items_info[# z, i++] = "Gourd";
ds_items_info[# z, i++] = "Corn";
ds_items_info[# z, i++] = "Wood";
ds_items_info[# z, i++] = "Stone";
ds_items_info[# z, i++] = "Bucket";
ds_items_info[# z, i++] = "Chair";
ds_items_info[# z, i++] = "Picture";
ds_items_info[# z, i++] = "Axe";
ds_items_info[# z, i++] = "Potion";
ds_items_info[# z, i++] = "Starfish";
ds_items_info[# z, i++] = "Mushroom";
ds_items_info[# z, i++] = "Tomato Seeds";
ds_items_info[# z, i++] = "Potato Seeds";
ds_items_info[# z, i++] = "Carrot Seeds";
ds_items_info[# z, i++] = "Artichoke Seeds";
ds_items_info[# z, i++] = "Chilli Seeds";
ds_items_info[# z, i++] = "Gourd Seeds";
ds_items_info[# z, i++] = "Corn Seeds";

z = 1; i = 0;
ds_items_info[# z, i++] = "Empty.";
ds_items_info[# z, i++] = "To-mah... may-to.";
ds_items_info[# z, i++] = "Pre-chips.";
ds_items_info[# z, i++] = "Keep away from rabbits.";
ds_items_info[# z, i++] = "The heartiest vegetable.";
ds_items_info[# z, i++] = "But oddly hot.";
ds_items_info[# z, i++] = "Or is it an eggplant?";
ds_items_info[# z, i++] = "Better popped.";
ds_items_info[# z, i++] = "Knock on it.";
ds_items_info[# z, i++] = "There's nothing written in it.";
ds_items_info[# z, i++] = "You could fit a bucket-full of water in here!";
ds_items_info[# z, i++] = "This chair is just right.";
ds_items_info[# z, i++] = "Davinki?";
ds_items_info[# z, i++] = "You've been Chopped.";
ds_items_info[# z, i++] = "The liquid looks... oozy.";
ds_items_info[# z, i++] = "Is this the Krusty Krab?";
ds_items_info[# z, i++] = "A fungus; not mush room for interpretation.";
ds_items_info[# z, i++] = "Seeds but for Tomatoes.";
ds_items_info[# z, i++] = "Seeds but for Potatoes.";
ds_items_info[# z, i++] = "Seeds but for Carrots.";
ds_items_info[# z, i++] = "Seeds but for Artichokes.";
ds_items_info[# z, i++] = "Seeds but for Chilli.";
ds_items_info[# z, i++] = "Seeds but for Gourds.";
ds_items_info[# z, i++] = "Seeds but for Corn.";

#endregion

var yy = 0; repeat(invSlots){
	dsInv[# 0, yy] = irandom_range(1, item.height-1); 
	dsInv[# 1, yy] = irandom_range(1, 10);
	yy++;
}
depth = -1;
scale = 2;
showInv = true;

#region Main Inv Variables
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

cellSize = 32;

invWidth = 288;
invHeight = 192;

sprInvUI = sprInventoryUI;

invUIX = (guiWidth * .5) - (invWidth * .5 * scale);
invUIY = (guiHeight * .5) - (invHeight * .5 * scale);
#endregion
#region player Info
ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Bronze";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0, 99);
ds_player_info[# 1, 1] = irandom_range(0, 99);
ds_player_info[# 1, 2] = irandom_range(0, 99);
ds_player_info[# 1, 3] = "Player";

infoX = invUIX + (9 * scale);
infoY = invUIY + (9 * scale);

#endregion
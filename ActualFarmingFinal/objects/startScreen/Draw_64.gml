draw_set_font(fntTitle);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(guiWidth / 2, 200, "There are a few features that I wanted to add but didn't have time");
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text((guiWidth / 2) - 120, guiHeight / 2, "WASD - Move")
draw_text((guiWidth / 2) - 120, (guiHeight / 2) + (textHeight * 1),"P - Enter planting mode");
draw_text((guiWidth / 2) - 120, (guiHeight / 2) + (textHeight * 2),"E - Interact");
draw_text((guiWidth / 2) - 120, (guiHeight / 2) + (textHeight * 3),"G - grow the plants by a day");
draw_text((guiWidth / 2) - 120, (guiHeight / 2) + (textHeight * 4),"Tab - Open Inventory");
draw_text((guiWidth / 2) - 120, (guiHeight / 2) + (textHeight * 5),"1-9 - Hotbar Slots");
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(guiWidth / 2, guiHeight - 200, "Press Enter to Continue");
draw_set_halign(fa_left);
draw_set_valign(fa_top);
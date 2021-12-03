if(keyboard_check_pressed(ord("I"))) { showInv = !showInv; }

if(!showInv) exit;

mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);

var cellXBuff = (cellSize + xBuffer) * scale;
var cellYBuff = (cellSize + yBuffer) * scale;

var iMouseX = mouseX - slotsX;
var iMouseY = mouseY - slotsY;

var nx = iMouseX div cellXBuff;
var ny = iMouseY div cellYBuff;

mSlotX = nx;
mSlotY = ny;
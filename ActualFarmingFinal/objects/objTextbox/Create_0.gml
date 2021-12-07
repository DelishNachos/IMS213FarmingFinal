box = sprTextbox;
frame = sprPortraitFrame
portrait = sprPortraits;
namebox = sprNamebox;

boxWidth = sprite_get_width(box);
boxHeight = sprite_get_height(box);
portWidth = sprite_get_width(portrait);
portHeight = sprite_get_height(portrait);
nameboxWidth = sprite_get_width(namebox);
nameboxHeight = sprite_get_height(namebox);

portX = (global.gameWidth - boxWidth - portWidth) * .5;
portY = (global.gameHeight * .98) - portHeight;
boxX = portX + portWidth;
boxY = portY;
nameboxX = portX;
nameboxY = boxY - nameboxHeight;

xBuffer = 12;
yBuffer = 8;
textX = boxX + xBuffer;
textY = boxY + yBuffer;
nameTextX = nameboxX + (nameboxWidth / 2);
nameTextY = nameboxY + (nameboxHeight / 2);
textMaxWidth = boxWidth - (2*xBuffer);

portraitIndex = 0;
counter = 0;
pause = false;

text[0] = ""
page = 0;
speakerName = "";
voice = sndVoice1;


interactKey = mb_left;
altInteractKey = ord("E");

textCol = c_black;
nameTextCol = c_black;
font = fntRegText;

draw_set_font(font)
textHeight = string_height("M");

choice = 0;
choiceCol = c_white;


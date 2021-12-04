//draw box
draw_sprite(box, 0, boxX, boxY);

//draw portrait back
draw_sprite(frame, 0, portX, portY);

//draw portrait
draw_sprite(portrait, portraitIndex, portX, portY);

//draw portrait frame
draw_sprite(frame, 1, portX, portY);

//draw namebox
draw_sprite(namebox, 0, nameboxX, nameboxY);


draw_set_font(font);
//draw name
var c = nameTextCol;
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_text_color(nameTextX, nameTextY, name, c,c,c,c, 1);
draw_set_halign(fa_left); draw_set_valign(fa_top);

//draw text
if(counter < string_length(text[page])){
	counter++;
}
var subString = string_copy(text[page], 1, counter);

c = textCol;
draw_text_ext_color(textX, textY, subString, textHeight, textMaxWidth, c,c,c,c, 1);
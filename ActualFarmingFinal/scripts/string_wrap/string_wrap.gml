// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_wrap(str, maxWidth){
	var strLength = string_length(str);
	var lastSpace = 1;
	
	var count = 1;
	var substr;
	
	repeat(strLength){
		substr = string_copy(str, 1, count);
		if(string_char_at(str, count) == " ") lastSpace = count;
		
		if(string_width(substr) > maxWidth){
			str = string_delete(str, lastSpace, 1);
			str = string_insert("\n", str, lastSpace);
		}
			
		count++;
	}
	
	return str;
}
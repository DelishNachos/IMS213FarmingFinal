function create_textbox(text, speakers){
	var tbox = instance_create_layer(0,0, "Text", objTextbox);
	
	with(tbox){
		var len = array_length(text);
		var i = 0; repeat(len){
			names[i] = speakers[i].na;
			
			i++;	
		}
	}
	
	return tbox
}
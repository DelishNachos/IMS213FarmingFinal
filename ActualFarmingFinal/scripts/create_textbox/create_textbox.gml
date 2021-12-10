function create_textbox(_text, _speakers, _nextLine, _scripts){
	var tbox = instance_create_layer(0,0, "Text", objTextbox);
	
	with(tbox){
		text = _text;
		nextLine = _nextLine;
		scripts = _scripts;
		var len = array_length(_text);
		var i = 0; repeat(len){
			names[i] = _speakers[i].speakerName;
			portraits[i] = _speakers[i].portraitIndex;
			voices[i] = _speakers[i].voice;
			i++;	
		}
		event_perform(ev_other, ev_user1);
	}
	
	return tbox;
	//return len
}
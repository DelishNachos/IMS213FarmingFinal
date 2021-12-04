if(mouse_check_button_pressed(interactKey) or keyboard_check_pressed(altInteractKey)){
	
	if(!choiceDialogue and counter < strLength){ counter = strLength; }
	else if(page < array_length(text) - 1){
		event_perform(ev_other, ev_user2);
		
		var line = nextLine[page];
		if(choiceDialogue) line = line[choice];
		
		if(line == 0) page++;
		else if(line == -1) { instance_destroy(); exit; }
		else page = line;
		
		event_perform(ev_other, ev_user1);
	}  else { instance_destroy(); }
}

if(choiceDialogue){
	choice += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	if(choice > textArrayLength-1) choice = 0;
	if(choice < 0) choice = textArrayLength - 1;
}
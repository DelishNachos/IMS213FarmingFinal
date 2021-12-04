if(mouse_check_button_pressed(interactKey)){
	if(counter < strLength){ counter = strLength; }
	else if(page < array_length(text) - 1){
		page++	
		event_perform(ev_other, ev_user1);
	}  else { instance_destroy(); }
}
if(mouse_check_button_pressed(interactKey)){
	if(page < array_length(text) - 1){
		page++	
	}  else { instance_destroy(); }
}
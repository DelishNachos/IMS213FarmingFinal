if(keyboard_check_pressed(ord("T"))) {timePause = !timePause;}
if(timePause) exit;

seconds += timeIncrement;
minutes = seconds/60;
hours = minutes/60;

darkness = hours / 24;

if(hours >= 24) {
	seconds = 0;
	day++;
	with(crops){event_perform(ev_other, ev_user1);}
	if(day > 30){
		day = 1;
		season++;
		if(season > 4){
			season = 1;
			year++;
		}
	}
}
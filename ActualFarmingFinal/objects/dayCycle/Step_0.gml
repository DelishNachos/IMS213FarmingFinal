if(keyboard_check_pressed(ord("T"))) {timePause = !timePause;}
if(timePause) exit;

seconds += timeIncrement;
minutes = seconds/60;
hours = minutes/60;

if(drawDaylight){
	#region Phases and Variables
	var darks, colors, pstart, pend;
	
	if(hours > phase.sunrise and hours <= phase.daytime) {			//sunrise
		darks = [maxDarkness, .2];
		colors = [merge_color(c_black,c_navy,.3), c_orange];
		pstart = phase.sunrise;
		pend = phase.daytime;
	} else if (hours > phase.daytime and hours <= phase.sunset) {	//Day
		darks = [.2, 0, 0, 0, .2];
		colors = [c_orange, c_orange, c_white, c_orange, c_orange];
		pstart = phase.daytime;
		pend = phase.sunset;
	} else if (hours > phase.sunset and hours <= phase.nighttime) { //Sunset
		darks = [.2, maxDarkness];
		colors = [c_orange, c_navy, merge_color(c_black,c_navy, .3)];
		pstart = phase.sunset;
		pend = phase.nighttime;
	}else{															//Night
		darks = [maxDarkness];
		colors = [merge_color(c_black, c_navy, .3)];
		pstart = phase.nighttime;
		pend = phase.sunrise;
	}
	#endregion
	
	#region Alter Darjkness and Color Depending on Time
	
	if (pstart == phase.nighttime) {lightColor = colors[0];}
	else{
		var cc = ((hours - pstart) / (pend - pstart)) * (array_length(colors) - 1);
		var c1 = colors[floor(cc)];
		var c2 = colors[ceil(cc)];
	
		lightColor = merge_color(c1, c2, cc-floor(cc));
	}
	
	
	if (pstart == phase.nighttime) {darkness = darks[0];}
	else{
		var dd = ((hours - pstart) / (pend - pstart)) * (array_length(darks) - 1);
		var d1 = darks[floor(dd)];
		var d2 = darks[ceil(dd)];
	
		darkness = merge_number(d1, d2, dd-floor(dd));
	}
	
	#endregion
}

#region cycle check
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
#endregion
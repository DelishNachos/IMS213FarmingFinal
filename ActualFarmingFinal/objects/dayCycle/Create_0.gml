seconds = 0;
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;

timeIncrement = 100;
timePause = true;

maxDarkness = .7;
darkness = 0;
lightColor = c_black;
drawDaylight = false;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

enum phase {
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22,
}
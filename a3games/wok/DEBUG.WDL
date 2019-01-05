/////////////////////////////////////////////////////////
// Debug panel - to display fps*10, nexus and error skill
/////////////////////////////////////////////////////////
SKILL   fps     { VAL 1; }
///////////////////////////////////////////////
FONT    standard_font,<msgfont.pcx>,5,18;
PANEL debug_panel {
	POS_X           0;
	POS_Y           4;
	DIGITS  20,20,3,standard_font,160,fps;   // frames per second * 10
        FLAGS   REFRESH;
}
///////////////////////////////////////////////
ACTION update_dbpanel {
	RULE    fps = 0.9*fps + 0.1*TIME_FAC;
}

ACTION set_debug {
	SET     EACH_TICK.10,update_dbpanel;
	SET     PANELS.7,debug_panel;
}














































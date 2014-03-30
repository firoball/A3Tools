/////////////////////////////////////////////////////////
// Debug panel - to display fps*10, nexus and error skill
/////////////////////////////////////////////////////////
SKILL	fps	{ VAL 1; }
///////////////////////////////////////////////
#FONT	standard_font,<panfont.bbm>,8,10;
SKILL debug_val { }

PANEL debug_panel {
	POS_X		0;
	POS_Y		2;
	DIGITS	2,0,4,standard_font,160,fps;
	DIGITS	30,0,2,standard_font,1,ACTIVE_NEXUS;
	DIGITS	60,0,4,standard_font,1,MAX_DIST;
	DIGITS	90,0,2,standard_font,1,ERROR;

	# Zeitmessung
#	DIGITS	115,2,2,standard_font,1, TIME_VERTICES;
# 	DIGITS	135,2,2,standard_font,1, TIME_CLIPPING;
#	DIGITS	115,2,2,standard_font,1, REMOTE_0;
# 	DIGITS	135,2,2,standard_font,1, REMOTE_1;
# 	DIGITS	160,2,3,standard_font,1, TIME_SLICES;
#	DIGITS	190,2,3,standard_font,1, TIME_DRAW;
#	DIGITS	220,2,3,standard_font,1, TIME_FBUFFER;
#	DIGITS	250,2,2,standard_font,1, TIME_TARGETS;
#	DIGITS	275,2,2,standard_font,1,CD_TRACK;
#	DIGITS	275,2,2,standard_font,1, TIME_ACTIONS;

#	DIGITS	310,2,4,standard_font,1,HERE.CLIP_DIST;
#	DIGITS	350,2,4,standard_font,1,MAX_DIST;
#	DIGITS	390,2,1,standard_font,1,CLIPPING;

#	DIGITS	320,2,1,standard_font,1,VESA_MODE;

	FLAGS	REFRESH;
}

STRING	debug_labels_1,
	"fps nx dist er";
#	"fps nx mdist  vx cl slc drw buf ob ac  clp  max  m";

TEXT	debug_text {
	POS_X		0;
	POS_Y		2;
	FONT		standard_font;
	STRING	debug_labels_1;
}
///////////////////////////////////////////////
ACTION set_debug {
	SET	debug_panel.VISIBLE,1;
	SET	debug_text.VISIBLE,1;
	RULE	debug_panel.POS_Y = SCREEN_HGT - 11;
	RULE	debug_text.POS_Y = SCREEN_HGT - 22;
	WHILE (1) {	// forever
		RULE	fps = 0.9*fps + 0.1*TIME_FAC;
		WAIT	1;
	}
}

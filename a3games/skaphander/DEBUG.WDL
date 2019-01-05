/////////////////////////////////////////////////////////
// Debug panel - to display fps*10, nexus and error skill
/////////////////////////////////////////////////////////
SKILL	fps	{ VAL 1; }
///////////////////////////////////////////////
#FONT	standard_font,<panfont.bbm>,8,10;
SKILL debug_val { }

PANEL debug_panel {
	POS_X		0;
	POS_Y		12;
	DIGITS	2,2,3,debug_font,160,fps;
	DIGITS	30,2,2,debug_font,1,ACTIVE_NEXUS;
	DIGITS	60,2,4,debug_font,1,MAX_DIST;	#SPANS;	#VISIBLES;	#SEGMENTS;	#PLAYER_ANGLE;
	DIGITS	90,2,2,debug_font,1,ERROR;

#	DIGITS	115,2,1,debug_font,1,slot_no;
# 	DIGITS	135,2,1,debug_font,1,slot;
 	DIGITS	160,2,4,debug_font,1,CD_TRACK;	//HERE.SKILL5;
# Zeitmessung
#	DIGITS	115,2,2,debug_font,1, TIME_VERTICES;
# 	DIGITS	135,2,2,debug_font,1, TIME_CLIPPING;
#  	DIGITS	160,2,3,debug_font,1, TIME_SLICES;
#	DIGITS	190,2,3,debug_font,1, TIME_DRAW;
#	DIGITS	220,2,3,debug_font,1, TIME_FBUFFER;
#	DIGITS	250,2,2,debug_font,1, TIME_TARGETS;
#	DIGITS	275,2,2,debug_font,1, TIME_ACTIONS;

#	DIGITS	310,2,4,debug_font,1,HERE.CLIP_DIST;
#	DIGITS	350,2,4,debug_font,1,MAX_DIST;
#	DIGITS	390,2,1,debug_font,1,CLIPPING;

#	DIGITS	320,2,1,debug_font,1,VESA_MODE;

#	DIGITS	340,2,4,debug_font,10,CDAUDIO_VOL;
#	DIGITS	390,2,4,debug_font,1,my_val;
#	DIGITS	340,2,4,debug_font,1,showproducts_txt.INDEX;
#	DIGITS	340,2,4,debug_font,1,SIZE_Y;
#	DIGITS	390,2,4,debug_font,1,LINES;

	FLAGS	REFRESH;
}
STRING	debug_labels_1,
	"fps nx mdist  vx cl slc drw buf ob ac  vbe  jx   jy";
#	"fps nx mdist  vx cl slc drw buf ob ac  clp  max  m";

TEXT	debug_text_1 {
	POS_X		0;
	POS_Y		2;
	FONT		debug_font;
	STRING	debug_labels_1;
}
///////////////////////////////////////////////
ACTION update_dbpanel {
	RULE	fps = 0.9*fps + 0.1*TIME_FAC;
}

ACTION set_debug {
	SET	EACH_TICK.10,update_dbpanel;
	SET	PANELS.10,debug_panel;
	SET	MESSAGES.10,debug_text_1;
}

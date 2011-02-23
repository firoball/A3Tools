//////////OVERLAYS//////////

OVLY display2_ovl, <display.pcx>,0,0,320,10;#,310,0,10,74;
OVERLAY display2_ovr {
	POS_X 0;#310;
	POS_Y 326;
	FLAGS ABSPOS;
	OVLYS display2_ovl;}

OVLY spellbook_ovl, <char.pcx>,0,0,90,248;
OVERLAY spellbook_ovr {
	POS_X 0;
	POS_Y 78;
	FLAGS ABSPOS;
	OVLYS spellbook_ovl;}

OVLY character_ovl, <char.pcx>,0,0,45,248;
OVERLAY character_ovr {
	POS_X 0;
	POS_Y 78;
	FLAGS ABSPOS;
	OVLYS character_ovl;}

OVLY inventory_ovl, <inv.pcx>,0,0,30,248;
OVERLAY inventory_ovr {
	POS_X 0;
	POS_Y 78;
	FLAGS ABSPOS;
	OVLYS inventory_ovl;}

OVLY mapborder_ovl, <mapbordr.pcx>,0,0,140,310;
OVERLAY mapborder_ovr {
	POS_X 90;
	POS_Y 17;
	FLAGS ABSPOS;
	OVLYS mapborder_ovl;}

OVLY sign_ovl, <signovr.pcx>;
OVERLAY sign_ovr {
	POS_X 90;
	POS_Y 82;
	FLAGS ABSPOS;
	OVLYS sign_ovl;}

OVLY menu_ovl, <menu.pcx>,0,0,234,52;#280;
OVERLAY menu_ovr {
	POS_X 43;
	POS_Y 27;
	FLAGS ABSPOS;
	OVLYS menu_ovl;}

OVLY options_ovl, <options.pcx>,0,0,130,296;
OVERLAY options_ovr {
	POS_X 95;
	POS_Y 12;
	FLAGS ABSPOS;
	OVLYS options_ovl;}

OVLY slots_ovl, <slots.pcx>,0,0,130,296;
OVERLAY slots_ovr {
	POS_X 95;
	POS_Y 12;
	FLAGS ABSPOS;
	OVLYS slots_ovl;}

OVLY opt_switch_ovl, <optswtch.pcx>,0,0,7,12;
OVERLAY opt_switch_ovr1 {
	POS_X 121;
	POS_Y 136;
	FLAGS ABSPOS;
	OVLYS opt_switch_ovl;}

OVERLAY opt_switch_ovr2 {
	POS_X 121;
	POS_Y 208;
	FLAGS ABSPOS;
	OVLYS opt_switch_ovl;}

OVERLAY opt_switch_ovr3 {
	POS_X 121;
	POS_Y 280;
	FLAGS ABSPOS;
	OVLYS opt_switch_ovl;}

OVLY menuborder_ovl, <menubrdr.pcx>,0,0,140,36;
OVERLAY menuborder_ovr {
	POS_X 90;
        POS_Y 88;
	FLAGS ABSPOS;
	OVLYS menuborder_ovl;}

//////////Waffen-Overlays//////////
SYNONYM weapon_ovr {TYPE OVERLAY;}

OVLY axe0_ovl, <axe.pcx>,0,0,160,210;
OVLY axe1_ovl, <axe.pcx>,160,0,160,210;
OVLY axe2_ovl, <axe.pcx>,0,210,160,210;
OVLY axe3_ovl, <axe.pcx>,160,210,160,210;
OVLY axe5_ovl, <axe.pcx>,160,210,160,157;
OVLY axe6_ovl, <axe.pcx>,160,210,160,105;
OVLY axe7_ovl, <axe.pcx>,0,0,160,105;
OVLY axe8_ovl, <axe.pcx>,0,0,160,157;

OVLY club0_ovl, <club.pcx>,0,0,160,215;
OVLY club1_ovl, <club.pcx>,160,0,160,215;
OVLY club2_ovl, <club.pcx>,0,215,150,215;
OVLY club3_ovl, <club.pcx>,150,215,150,215;
OVLY club4_ovl, <club.pcx>,300,280,160,150;
OVLY club5_ovl, <club.pcx>,300,280,160,113;
OVLY club6_ovl, <club.pcx>,300,280,160,75;
OVLY club7_ovl, <club.pcx>,0,0,160,105;
OVLY club8_ovl, <club.pcx>,0,0,160,157;

OVLY sword0_ovl, <sword.pcx>,0,0,160,215;
OVLY sword1_ovl, <sword.pcx>,160,0,160,215;
OVLY sword2_ovl, <sword.pcx>,0,215,160,215;
OVLY sword3_ovl, <sword.pcx>,160,215,160,215;
OVLY sword4_ovl, <sword.pcx>,320,215,160,215;
OVLY sword5_ovl, <sword.pcx>,320,215,160,161;
OVLY sword6_ovl, <sword.pcx>,320,215,160,107;
OVLY sword7_ovl, <sword.pcx>,0,0,160,105;
OVLY sword8_ovl, <sword.pcx>,0,0,160,157;

OVERLAY axe0_ovr {
	POS_X 160;
	POS_Y 121;
	FLAGS ABSPOS;
	OVLYS axe0_ovl;}

OVERLAY axe1_ovr {
	POS_X 160;#50;
	POS_Y 121;#126;
	FLAGS ABSPOS;
	OVLYS axe1_ovl;}

OVERLAY axe2_ovr {
	POS_X 160;#50;
	POS_Y 121;#126;
	FLAGS ABSPOS;
	OVLYS axe2_ovl;}

OVERLAY axe3_ovr {
	POS_X 160;#50;
	POS_Y 121;#126;
	FLAGS ABSPOS;
	OVLYS axe3_ovl;}

OVERLAY axe5_ovr {
	POS_X 160;
	POS_Y 174;
	FLAGS ABSPOS;
	OVLYS axe5_ovl;}

OVERLAY axe6_ovr {
	POS_X 160;
	POS_Y 226;
	FLAGS ABSPOS;
	OVLYS axe6_ovl;}

OVERLAY axe7_ovr {
	POS_X 160;
	POS_Y 226;
	FLAGS ABSPOS;
	OVLYS axe7_ovl;}

OVERLAY axe8_ovr {
	POS_X 160;
	POS_Y 174;
	FLAGS ABSPOS;
	OVLYS axe8_ovl;}

OVERLAY club0_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS club0_ovl;}

OVERLAY club1_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS club1_ovl;}

OVERLAY club2_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS club2_ovl;}

OVERLAY club3_ovr {
	POS_X 150;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS club3_ovl;}

OVERLAY club4_ovr {
	POS_X 140;
	POS_Y 181;
	FLAGS ABSPOS;
	OVLYS club4_ovl;}

OVERLAY club5_ovr {
	POS_X 140;
	POS_Y 218;
	FLAGS ABSPOS;
	OVLYS club5_ovl;}

OVERLAY club6_ovr {
	POS_X 140;
	POS_Y 256;
	FLAGS ABSPOS;
	OVLYS club6_ovl;}

OVERLAY club7_ovr {
	POS_X 160;
	POS_Y 224;
	FLAGS ABSPOS;
	OVLYS club7_ovl;}

OVERLAY club8_ovr {
	POS_X 160;
	POS_Y 170;
	FLAGS ABSPOS;
	OVLYS club8_ovl;}

OVERLAY sword0_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS sword0_ovl;}

OVERLAY sword1_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS sword1_ovl;}

OVERLAY sword2_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS sword2_ovl;}

OVERLAY sword3_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS sword3_ovl;}

OVERLAY sword4_ovr {
	POS_X 160;
	POS_Y 116;
	FLAGS ABSPOS;
	OVLYS sword4_ovl;}

OVERLAY sword5_ovr {
	POS_X 160;
	POS_Y 170;
	FLAGS ABSPOS;
	OVLYS sword5_ovl;}

OVERLAY sword6_ovr {
	POS_X 160;
	POS_Y 224;
	FLAGS ABSPOS;
	OVLYS sword6_ovl;}

OVERLAY sword7_ovr {
	POS_X 160;
	POS_Y 224;
	FLAGS ABSPOS;
	OVLYS sword7_ovl;}

OVERLAY sword8_ovr {
	POS_X 160;
	POS_Y 170;
	FLAGS ABSPOS;
	OVLYS sword8_ovl;}

OVLY staff0_ovl, <staff.pcx>,0,0,160,100;
OVLY staff1_ovl, <staff.pcx>,0,0,160,150;
OVLY staff2_ovl, <staff.pcx>,0,0,160,200;

OVERLAY staff0_ovr {
	POS_X 160;#50;
	POS_Y 221;#126;
	FLAGS ABSPOS;
	OVLYS staff0_ovl;}

OVERLAY staff1_ovr {
	POS_X 140;
	POS_Y 176;
	FLAGS ABSPOS;
	OVLYS staff1_ovl;}

OVERLAY staff2_ovr {
	POS_X 120;
	POS_Y 126;
	FLAGS ABSPOS;
	OVLYS staff2_ovl;}
//////////
//////////PANELS//////////

BMAP display_map, <display.pcx>,0,0,320,74;
PANEL display_pan {
	POS_X 0;
	POS_Y 326;
	DIGITS  15,34,3,display_font,1,HP;
	DIGITS  261,34,3,display_font,1,MP;
	DIGITS  108,58,2,inv_font,1,q_amount;
	DIGITS  203,58,2,inv_font,1,ac;
	PAN_MAP display_map;}

BMAP char_map <char.pcx>,45,0,45,248;
PANEL char_pan {
	POS_X 45;
	POS_Y 78;
	FLAGS REFRESH;
	PAN_MAP char_map;
	DIGITS 30,42,2,small_font,1,lvl;
	DIGITS 30,78,2,small_font,1,str;
	DIGITS 30,96,2,small_font,1,con;
	DIGITS 30,114,2,small_font,1,int;
	DIGITS 30,132,2,small_font,1,spd;
	DIGITS 30,168,2,small_font,1,armor;
	DIGITS 30,186,2,small_font,1,dmg;
	DIGITS 15,204,5,small_font,1,nextlvl;}

PANEL pts_left_pan {
	POS_X 45;
	POS_Y 282;
	FLAGS REFRESH;
	DIGITS 35,18,1,small_font,1,pts_left;}

BMAP candle1_map, <spellsym.pcx>,0,0,20,60;
BMAP candle2_map, <spellsym.pcx>,20,0,20,60;
BMAP candle3_map, <spellsym.pcx>,40,0,20,60;

TEXTURE candle_tex {
        CYCLES 4;
        BMAPS candle1_map,candle2_map,candle3_map,candle2_map;
        DELAY 2,2,2,2;
	SCALE_XY 16,24;
	FLAGS CLIP;}

PANEL night_pan {
        POS_X 0;
        POS_Y 20;
        FLAGS REFRESH,TRANSPARENT;
        PICTURE 0,0,candle_tex,1;
        }

BMAP dragon1_map, <dragon.pcx>,0,0,60,120;
BMAP dragon2_map, <dragon.pcx>,60,0,60,120;
BMAP dragon3_map, <dragon.pcx>,120,0,60,120;
BMAP dragon4_map, <dragon.pcx>,180,0,60,120;
BMAP dragon5_map, <dragon.pcx>,0,120,60,120;
BMAP dragon6_map, <dragon.pcx>,60,120,60,120;

TEXTURE mad_dragon {
	CYCLES 4;
	BMAPS dragon1_map,dragon2_map,dragon3_map,dragon4_map;
	DELAY 4,4,4,4;
}

TEXTURE mad_dragon2 {
	CYCLES 5;
	BMAPS dragon5_map,dragon6_map,dragon5_map,dragon6_map,dragon5_map;
	DELAY 4,3,4,3,4;
	FLAGS ONESHOT;
}

BMAP logo_map, <logo.pcx>,0,0,320,400;
PANEL logo_pan {
	POS_X 0;
	POS_Y 0;
	FLAGS REFRESH;
	PAN_MAP logo_map;}

BMAP title_map, <title.pcx>,0,0,320,400;
PANEL title_pan {
	POS_X 0;
	POS_Y 0;
	FLAGS REFRESH;
	PAN_MAP title_map;}

PANEL dragon_pan {
	POS_X 300;
	POS_Y 280;
	FLAGS REFRESH,TRANSPARENT;
	PICTURE 0,0,mad_dragon,1;}

PANEL dragon2_pan {
	POS_X 130;
	POS_Y 280;
	FLAGS REFRESH,TRANSPARENT;
	PICTURE 0,0,mad_dragon2,1;}

ACTION run_baby_run {
	SUB dragon_pan.POS_X,2;
	IF_EQUAL dragon_pan.POS_X,134;
		SET EACH_TICK.5, dragon_king;
	IF_ABOVE dragon_pan.POS_X,-50;
		END;
	SET dragon_pan.POS_X,318;
	WAITT 80;
}

ACTION dragon_king {
	SET PANELS.11,dragon2_pan;
	SET dragon_pan.POS_X,124;
	WAITT 18;
	SET PANELS.11,dragon_pan;
	SET EACH_TICK.5,run_baby_run;
}
























































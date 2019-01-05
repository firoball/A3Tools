//////////THE DARK FOREST (Regionen und spezielle Aktionen)//////////
SOUND gate_snd, <gate.wav>;
SOUND door_snd, <door.wav>;

ACTION enter_forest {//Wird bei jedem Levelwechsel gestartet
	SET AMBIENT,0.2;
	SET PLAYER_LIGHT,1;
	WAIT 1;
	IF_EQUAL LAYERS.8,sign_ovr; BRANCH hide_sign;
	}

REGION border {
	EACH_TICK startlev;
	CLIP_DIST 0;
	FLOOR_HGT 40;
	CEIL_HGT 40;
	FLOOR_TEX stfloor1_tex;
	CEIL_TEX stfloor1_tex;}

REGION caveswitch_nische {
	FLOOR_HGT 8.5;
	CEIL_HGT 10.5;
	FLOOR_TEX stfloor1_tex;
	CEIL_TEX stfloor1_tex;
	FLAGS SAVE;}

REGION black_reg {
        FLOOR_TEX black_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT 0.1;
}

REGION forestway {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT 0;
}

REGION forestway2b {
        FLOOR_TEX stfloor15_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  -20;
        CEIL_HGT  -6;
        CLIP_DIST  200;
        AMBIENT -.2;
}

REGION forestway2 {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT 0;
	BELOW forestway2b;
}

REGION forest_tunnelwand {
        FLOOR_TEX stone8_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.1;
	BELOW forestway2b;
}

REGION foresthole {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	SKILL7 -19;
	SKILL8 -4;
	FLAGS SAVE;
}

REGION forestrand_noclip {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  0;
        AMBIENT -.1;
}

REGION forestway_ganzhell {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX waldlicht_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT  .2;
}

REGION forestrand_ganzhell {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX waldlicht_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT  .2;
}

REGION forestrand {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.1;
}

REGION forestrand_hell {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT .25;
}

REGION forestrand_flicker {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT 0;
	EACH_TICK flicker_cave;
}

REGION forest_tree {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX stfloor2_tex;
        FLOOR_HGT  0;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT -.3;
}

REGION forest_tree_CA {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX stfloor2_tex;
        FLOOR_HGT  0;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT -.1;
	FLAGS CEIL_ASCEND;
}

REGION forest_tree_CA_hell {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX stfloor2_tex;
        FLOOR_HGT  0;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT .3;
	FLAGS CEIL_ASCEND;
}
REGION baumstumpf {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX wood5b_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.3;
}

REGION baumstumpfrand {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT 0;
}

REGION baumstumpf_FACD {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX wood5b_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.3;
	FLAGS FLOOR_ASCEND,CEIL_DESCEND;
}

REGION baumstumpf2_b {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX wood5b_tex;
        FLOOR_HGT  0.5;
        CEIL_HGT  10.5;
        CLIP_DIST  200;
        AMBIENT -.15;
}

REGION baumstumpf2_FACD_b {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX wood5b_tex;
        FLOOR_HGT  0.5;
        CEIL_HGT  10.5;
        CLIP_DIST  200;
        AMBIENT -.15;
	FLAGS FLOOR_ASCEND,CEIL_DESCEND;}

REGION baumstumpf2 {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  11;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT 0;
	BELOW baumstumpf2_b;
}

REGION baumstumpf2_FD {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  11;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT 0;
	FLAGS FLOOR_DESCEND;
	BELOW baumstumpf2_FACD_b;
}

REGION baumstumpf3 {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX wood5h_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.3;
}

REGION baumstumpf3_FACD {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX wood5h_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.3;
	FLAGS FLOOR_ASCEND,CEIL_DESCEND;
}

REGION baumstumpf4_b {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX wood5h_tex;
        FLOOR_HGT  0.5;
        CEIL_HGT  10.5;
        CLIP_DIST  200;
        AMBIENT -.15;
}

REGION baumstumpf4_FACD_b {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX wood5h_tex;
        FLOOR_HGT  0.5;
        CEIL_HGT  10.5;
        CLIP_DIST  200;
        AMBIENT -.15;
	FLAGS FLOOR_ASCEND,CEIL_DESCEND;}

REGION baumstumpf4 {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  11;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT 0;
	BELOW baumstumpf4_b;
}

REGION baumstumpf4_FD {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  11;
        CEIL_HGT  25;
        CLIP_DIST  200;
        AMBIENT 0;
	FLAGS FLOOR_DESCEND;
	BELOW baumstumpf4_FACD_b;
}

REGION forestway_FCD {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        FLAGS FLOOR_DESCEND;#,CEIL_DESCEND;
}

REGION forestwand_FCD {
        FLOOR_TEX stone8_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -0.1;
	FLAGS FLOOR_DESCEND;#,CEIL_DESCEND;
}

REGION forestwand {
        FLOOR_TEX stone8_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMbIENT -0.1;
}


REGION forestwand2 {
        FLOOR_TEX stone8_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMbIENT 0;
}

REGION forestwand3 {
        FLOOR_TEX stone8_tex;
        CEIL_TEX stfloor2_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  10;
        CLIP_DIST  200;
	AMbIENT -.1;
	FLAGS CEIL_ASCEND;
}

REGION forestway_tunnel {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX wood5b_tex;
        FLOOR_HGT  -10;
        CEIL_HGT  -1.5;
        CLIP_DIST  200;
	AMBIENT -.15;
}

REGION forestway_FD_b {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX wood5b_tex;
        FLOOR_HGT  -10;
        CEIL_HGT  -1.5;
        CLIP_DIST  200;
        FLAGS CEIL_ASCEND;
	AMBIENT -.1;
}

REGION forestway_FD {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  3.5;
        CEIL_HGT  25;
        CLIP_DIST  200;
        FLAGS FLOOR_DESCEND;
	BELOW forestway_FD_b; 
}

REGION forestway_FD_nb {
        FLOOR_TEX wood5b_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  3.5;
        CEIL_HGT  25;
        CLIP_DIST  200;
        FLAGS FLOOR_DESCEND;
}

REGION forestwater_b {
	FLOOR_TEX stfloor13_tex;
	CEIL_TEX wasserunten_tex;
	FLOOR_HGT -13.5;
	CEIL_HGT -2.5;
	IF_ARISE regio_arise;
	CLIP_DIST 200;
	AMBIENT -0.3;
}

REGION forestwater {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX black_tex;
	FLOOR_HGT 4;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.1;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forestwater_noenter {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX black_tex;
	FLOOR_HGT 4;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.1;
}

REGION forestwater_load {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX black_tex;
	FLOOR_HGT 4;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.1;
	IF_ENTER set_forest3;
}

REGION forestwater1 {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX black_tex;
	FLOOR_HGT 4;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.45;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forestwater1_flicker {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX stfloor12_tex;
	FLOOR_HGT 4;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.25;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
	EACH_TICK flicker_cave_d;
}

REGION forestwater2 {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX wood5b_tex;
	FLOOR_HGT 4;
	CEIL_HGT 7;
	CLIP_DIST 200;
	AMBIENT -0.3;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forestbridge_b {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX wood5b_tex;
	FLOOR_HGT 4;
	CEIL_HGT 7;
	CLIP_DIST 200;
	AMBIENT -0.3;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forestbridge {
	FLOOR_TEX wood5b_tex;
	CEIL_TEX wood5b_tex;
	FLOOR_HGT 8;
	CEIL_HGT 23;
	BELOW forestbridge_b;
	CLIP_DIST 200;
	AMBIENT -0.3;
}

REGION forestbridge_hole {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX wood5b_tex;
	FLOOR_HGT 4;
	CEIL_HGT 23;
	CLIP_DIST 200;
	AMBIENT -0.3;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forestbridge_hole_CD {
	FLOOR_TEX wasseroben_tex;
	CEIL_TEX wood5b_tex;
	FLOOR_HGT 4;
	CEIL_HGT 9.5;
	FLAGS CEIL_DESCEND;
	CLIP_DIST 200;
	AMBIENT -0.3;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forestbridge_ramp {
	FLOOR_TEX wood5b_tex;
	CEIL_TEX black_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	FLAGS FLOOR_ASCEND;
	AMBIENT -0.1;
}

//////////Betreten von Wasser/Sumpfregionen//////////
ACTION water_enter_forest {
	RULE my_size = my_size -3;
	SET fric,0.5;
	}

ACTION water_leave_forest {
	RULE my_size = my_size +3;
	SET fric,0.2;
	}

//////////
REGION forestbridge_nb {
	FLOOR_TEX wood5b_tex;
	CEIL_TEX wood5b_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.3;
}

REGION forestcave {
	FLOOR_TEX stfloor10_tex;
	CEIL_TEX stfloor10_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.3;
}

REGION forestcavegrey {
	FLOOR_TEX stfloor12_tex;
	CEIL_TEX stfloor12_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.2;
}

REGION forestcavegrey_hell {
	FLOOR_TEX stfloor12_tex;
	CEIL_TEX sky3_dark_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT 0.2;
}

REGION forestcave_entrance {
	FLOOR_TEX stfloor10_tex;
	CEIL_TEX stfloor10_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.15;
}

REGION forestcave_flicker {
	FLOOR_TEX stfloor10_tex;
	CEIL_TEX stfloor10_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.3;
	EACH_TICK flicker_cave;
}

REGION forestcave_FA {
	FLOOR_TEX stfloor10_tex;
	CEIL_TEX stfloor10_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.3;
	FLAGS FLOOR_ASCEND;
}

REGION forestcave_FCD {
	FLOOR_TEX stfloor10_tex;
	CEIL_TEX stfloor10_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.3;
	FLAGS CEIL_DESCEND,FLOOR_DESCEND;
}

REGION forestcave_outside {
	FLOOR_TEX stfloor12_tex;
	CEIL_TEX black_tex;
	FLOOR_HGT -0.2;
	CEIL_HGT 25;
	CLIP_DIST 200;
	AMBIENT -0.1;
	FLAGS FLOOR_ASCEND;
}

REGION forest_tunnel {
        FLOOR_TEX stfloor15_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.2;
}

REGION forest_tunnel_flicker {
        FLOOR_TEX stfloor15_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.2;
        EACH_TICK flicker_cave_d;
}

REGION forest_balken {
        FLOOR_TEX stfloor15_tex;
        CEIL_TEX wood5h_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.2;
}

REGION forest_balken_b {
        FLOOR_TEX stfloor15_tex;
        CEIL_TEX wood5h_tex;
        FLOOR_HGT -20;
        CEIL_HGT -16;
        CLIP_DIST  200;
        AMBIENT -.2;
        FLAGS CEIL_ASCEND;
}

REGION forest_balken_FA {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX black_tex;
        BELOW forest_balken_b;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
        AMBIENT -.2;
        FLAGS FLOOR_ASCEND;
}

REGION forest_swamp {
        FLOOR_TEX acidoben_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forest_watercave {
        FLOOR_TEX stfloor7_tex;
        CEIL_TEX stfloor7_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.45;
}

REGION forest_waterentrance {
        FLOOR_TEX wasseroben_tex;
        CEIL_TEX stfloor12_tex;
        FLOOR_HGT  4;
        CEIL_HGT  14;
        CLIP_DIST  200;
	FLAGS CEIL_DESCEND;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
	AMBIENT -.2;
}

REGION forestwater3 {
        FLOOR_TEX wasseroben_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  4;
        CEIL_HGT  14;
        CLIP_DIST  200;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forest_waterborder {
        FLOOR_TEX stfloor12_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  4;
        CEIL_HGT  14;
        CLIP_DIST  200;
	AMBIENT .1;
}

REGION forest_waterborder_FD {
        FLOOR_TEX stfloor12_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  4;
        CEIL_HGT  14;
        CLIP_DIST  200;
	AMBIENT .1;
	FLAGS FLOOR_DESCEND;
}

REGION forest_swampceil {
        FLOOR_TEX acidoben_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

//////////Tueren//////////
WALL forest_doortex1 {
	TEXTURE wooddoor_tex;
	IF_HIT set_forest_door1_open;
	DIST 50;
	FLAGS SAVE,PORTCULLIS;
}

REGION forest_door1 {
        FLOOR_TEX woodflr_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  0;
        CEIL_HGT  0;
        CLIP_DIST  200;
	SKILL2 -0.5;
	SKILL7 11;
	FLAGS SAVE;
}

ACTION set_forest_door1_open {
	IF_NEQUAL use,1; END;
	SET_ALL MY.IF_HIT,NULL;
	SET_ALL MY.IF_FAR,set_forest_door1_close;
	PLAY_SOUND door_snd,0.8;
	SET forest_door1.EACH_TICK,slidedoor_open;//allgemeine Aktion in DOORS.WDL
}

ACTION set_forest_door1_close {
	SET_ALL MY.IF_HIT,set_forest_door1_open;
	SET_ALL MY.IF_FAR,NULL;
	PLAY_SOUND door_snd,0.2;
	SET forest_door1.EACH_TICK,slidedoor_close;;//allgemeine Aktion in DOORS.WDL

}
//////////
REGION forest_swamphut {
        FLOOR_TEX woodflr_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.1;
}

REGION forest_swamphut_flicker {
        FLOOR_TEX woodflr_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.1;
	EACH_TICK flicker_cave_d;
}

REGION forest_swampway_FA {
        FLOOR_TEX stfloor17_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	FLAGS FLOOR_ASCEND;
}

REGION forest_swamprand {
        FLOOR_TEX stfloor20_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  0;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT .15;
}

REGION forest_tunnelende_b {
        FLOOR_TEX stfloor15_tex;
        CEIL_TEX stone8_tex;
        FLOOR_HGT  -20;
        CEIL_HGT  -6;
        CLIP_DIST  200;
}

REGION forest_tunnelende {
        FLOOR_TEX stone8_tex;
        CEIL_TEX stfloor2_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	BELOW forest_tunnelende_b;
	FLAGS CEIL_ASCEND;
	AMBIENT -.1;
}

REGION forest_tunnelende2 {
        FLOOR_TEX stone8_tex;
        CEIL_TEX sky3_dark_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	BELOW forest_tunnelende_b;
	AMBIENT .1;
}

REGION forest_watertunnel {
        FLOOR_TEX wasseroben_tex;
        CEIL_TEX black_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.2;
	IF_ENTER water_enter_forest;
	IF_LEAVE water_leave_forest;
}

REGION forest_tomb {
        FLOOR_TEX stone8_tex;
        CEIL_TEX stone8_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.3;
	EACH_TICK flicker_cave_d;
}

REGION forest_sarg {
        FLOOR_TEX wood5h_tex;
        CEIL_TEX stone8_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.3;
}

REGION forest_switchreg {
        FLOOR_TEX stfloor1_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.1;
}

REGION forest_switchreg_FD {
        FLOOR_TEX stfloor1_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.1;
	FLAGS FLOOR_DESCEND;
}

WALL forestdoorswitch4 {
	TEXTURE woodflr_tex;
	IF_HIT set_forestdoor4_open;
	FLAGS SAVE,FENCE;
}

REGION forest_switchblack {
        FLOOR_TEX black_tex;
        CEIL_TEX woodflr_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  200;
	AMBIENT -.1;
}
//////////nochmal Tueren//////////
THING forestdoor3_l_gen {
	TEXTURE black_tex;
	FLAGS PASSABLE,INVISIBLE;
}

THING forestdoor3_r_gen {
	TEXTURE black_tex;
	FLAGS PASSABLE,INVISIBLE;
}

REGION forest_door3l {
        FLOOR_TEX black_tex;
        CEIL_TEX woodceil_tex;
        FLOOR_HGT  12;
        CEIL_HGT  12;
        CLIP_DIST  0;
	SKILL3 -1.57;
	SKILL4 0;
	GENIUS forestdoor3_l_gen;
}

REGION forest_door3r {
        FLOOR_TEX black_tex;
        CEIL_TEX woodceil_tex;
        FLOOR_HGT  -4;
        CEIL_HGT  12;
        CLIP_DIST  0;
	SKILL4 0;
	SKILL3 1.57;
	GENIUS forestdoor3_r_gen;
}

WALL forestdoortex3 {
	TEXTURE wooddoor2_tex;
	IF_HIT set_forestdoor3_open;
	FLAGS SAVE,PORTCULLIS;
}

ACTION set_forestdoor3_open {
	IF_EQUAL forestdoortex3.FLAG1,1;
		GOTO open;
	IF_EQUAL use,400;
		SKIP 5;
	IF_NEQUAL use,1; END;
	SET newstring,1;
	SET info_str,keydoor_str;
	END;
	CALL drop_item;
	SET forestdoortex3.FLAG1,1;
	END;
open:
	IF_NEQUAL use,1; END;
	SET_ALL forestdoortex3.IF_HIT,NULL;
	PLAY_SOUND door_snd,0.8;
	SET forest_door3l.EACH_TICK,swing_open;//allgemeine Aktion in DOORS.WDL
	SET forest_door3r.EACH_TICK,swing_open;
}

REGION forest_door4 {
	FLOOR_TEX wood5h_tex;
	CEIL_TEX wood5h_tex;
	FLOOR_HGT 11;
	CEIL_HGT 21;
	SKILL8 11;
	SKILL7 0;
	AMBIENT -.3;
	FLAGS SAVE;
}

REGION forest_door4_FACD {
	FLOOR_TEX wood5h_tex;
	CEIL_TEX wood5h_tex;
	FLOOR_HGT 11;
	CEIL_HGT 21;
	SKILL8 11;
	SKILL7 0;
	FLAGS FLOOR_ASCEND,CEIL_DESCEND;
	AMBIENT -.3;
	FLAGS SAVE;
}

ACTION set_forestdoor4_open {
	IF_NEQUAL use,1; END;
	SET_ALL MY.IF_HIT,NULL;
	ADD caveswitch_nische.CEIL_HGT,2;
	CALL show_camera5;
	ADD forestdoorswitch4.X1,2.75;
	ADD forestdoorswitch4.X2,2.75;
	PLAY_SOUND door_snd,0.8;
	SET forest_door4.EACH_TICK,set_forestdoor4a_open;
	SET_ALL forest_door4_FACD.EACH_TICK,elevator_down;//allgemeine Aktion in LIFTS.WDL

}

ACTION set_forestdoor4a_open {
	IF_ABOVE forest_door4.FLOOR_HGT,1; SKIP 1;
	CALL stop_camera;
	CALL elevator_down;
}

//////////Schild mit Information//////////
STRING forestsign1_str, "\n\nDestroy the Winged\nDeath and the way\nwill be clear";
WALL forestsign {
	FLAGS TRANSPARENT,FENCE;
	TEXTURE sign_tex;
	IF_HIT read_forestsign;
}

ACTION read_forestsign {
	IF_NEQUAL use,1; END;
	SET sign_txt.STRING,forestsign1_str;
	CALL show_sign;
}
//////////Gargoyle-Statue//////////
STRING winged_death_str, "hmmmm```";
THING winged_death {
	FLAGS SAVE,FRAGILE;
	TEXTURE gargy_anim_tex;
	IF_HIT set_foresthole;
	HEIGHT -0.1;}

//////////Der Weg ist jetzt frei.../////////
ACTION set_foresthole {
	IF_NEQUAL use,0; END;
	CALL set_play;
	SET foresthole.EACH_TICK,lift_down;
	WAIT 1;
	SET newstring,1;
	SET info_str, winged_death_str;
	SET foresthole.AMBIENT,-.1;
	SET foresthole.IF_ENTER, set_forest2;
	SET foresthole.IF_LEAVE, reset_forest2;
}

ACTION reset_forest2 {SET IF_SPACE,use_item; SET IF_RIGHT,use_item;}
ACTION set_forest2 {
	SET IF_SPACE,NULL; SET IF_RIGHT,NULL;
	WAITT 5;
	IF_NEQUAL HERE,foresthole; END;
	SET levelnr,2;
	CALL changelev;
}

ACTION set_forest3 {
	CALL water_enter_forest;
	WAITT 2;
	SET levelnr,3;
	CALL changelev;
}
//////////Schon wieder Tueren//////////
WALL forestdoortex1 {
	TEXTURE texdoor_tex;
	FLAGS FENCE,TRANSPARENT,SAVE,FLAG6;
	IF_HIT set_forestdoor1_open;
	OFFSET_X 147;
	SKILL2 -0.5;
	SKILL7 16;
}

STRING forestdoor2_str, "this door is opened elsewhere";
WALL forestdoortex2 {
	TEXTURE gitter_big_tex;
	FLAGS TRANSPARENT,SAVE,PORTCULLIS;
	IF_HIT forestdoor2_msg;
	SKILL2 -0.5;
	SKILL7 24;
}

ACTION forestdoor2_msg {
	IF_NEQUAL use,1; END;
	SET newstring,1;
	SET info_str, forestdoor2_str;
}

WALL forestdoorswitch2 {
	TEXTURE switch1_off_tex;
	FLAGS SAVE,PORTCULLIS;
	IF_HIT set_forestdoor2_open;
	IF_NEAR set_forestdoorswitch2;
	DIST 20;
}

ACTION set_forestdoorswitch2 {
	IF_BELOW levelnr,3; END;
	SET MY.TEXTURE,switch1_on_tex;
	SET MY.IF_HIT,NULL;
}
 
ACTION set_forestdoor1_open {
	IF_EQUAL levelnr,3; GOTO open;
	IF_EQUAL forestdoortex1.FLAG1,1;
		GOTO open;
	IF_EQUAL use,350;
		SKIP 5;
	IF_NEQUAL use,1; END;
	SET newstring,1;
	SET info_str,keydoor_str;
	END;
	CALL drop_item;
	SET forestdoortex1.FLAG1,1;
	END;
open:
	IF_NEQUAL use,1; END;
	PLAY_SOUND gate_snd,0.8;
	SET forestdoortex1.EACH_TICK,texdoor_open;}//allgemeine Aktion in DOORS.WDL

ACTION set_forestdoor2_open {
	IF_NEQUAL use,1; END;
	SET MY.TEXTURE,switch1_on_tex;
	SET MY.IF_HIT,NULL;
	SET forestdoortex2.IF_HIT,NULL;
	PLAY_SOUND gate_snd,0.8;
	SET forestdoortex2.EACH_TICK,texdoor_open;}//allgemeine Aktion in DOORS.WDL

//////////Levelaufstieg//////////
SOUND yeah_snd, <yeah.wav>;
STRING levelup_str "GAINED A LEVEL!";
ACTION train {
	IF_NEQUAL nextlvl,0;
		END;
	SET newstring,1;
	SET info_str,levelup_str;
	PLAY_SOUND yeah_snd,1;
	RULE exp=exp*2;
	RULE points=0;
	ADD lvl,1;
	RULE str+=INT(RANDOM(2)+1);
	RULE spd+=INT(RANDOM(2)+1);
	RULE int+=INT(RANDOM(2)+1);
	RULE con+=INT(RANDOM(2)+1);
	RULE new_HP=(RANDOM+0.1)*8+con/5;
	RULE new_MP=(RANDOM+0.1)*5+int/4;
	ADD HP.MAX,new_HP; ADD HP,new_HP;
	ADD MP.MAX,new_MP; ADD MP,new_MP;
}









































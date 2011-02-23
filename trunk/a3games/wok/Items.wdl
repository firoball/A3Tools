//////////items//////////
SOUND broken_snd, <broken.wav>;

STRING mana05_str,"5 MANA RECOVERED";
STRING mana10_str,"10 MANA RECOVERED";
STRING mana20_str,"20 MANA RECOVERED";
STRING life05_str,"5 LIFE RECOVERED";
STRING life10_str,"10 LIFE RECOVERED";
STRING life20_str,"20 LIFE RECOVERED";
STRING exp05_str,"5 EXPERIENCE POINTS";
STRING exp10_str,"10 EXPERIENCE POINTS";
STRING exp20_str,"20 EXPERIENCE POINTS";
STRING nightscroll_str,"NIGHT VISION POWER";

BMAP stern1_map, <stern.pcx>,0,0,64,64;
BMAP stern2_map, <stern.pcx>,64,0,64,64;
BMAP stern3_map, <stern.pcx>,128,0,64,64;
BMAP stern4_map, <stern.pcx>,192,0,64,64;
BMAP herz1_map, <herz.pcx>,0,0,76,64;
BMAP herz2_map, <herz.pcx>,76,0,76,64;
BMAP herz3_map, <herz.pcx>,152,0,76,64;
BMAP herz4_map, <herz.pcx>,228,0,76,64;
BMAP blitz1_map, <blitz.pcx>,0,0,40,64;
BMAP blitz2_map, <blitz.pcx>,40,0,40,64;
BMAP blitz3_map, <blitz.pcx>,80,0,40,64;
BMAP blitz4_map, <blitz.pcx>,120,0,40,64;
BMAP blitz5_map, <blitz.pcx>,160,0,40,64;
BMAP blitz6_map, <blitz.pcx>,200,0,40,64;
BMAP blitz7_map, <blitz.pcx>,240,0,40,64;

//////////
TEXTURE stern05_tex {
        SCALE_XY 45,45;
        CYCLES 4;
        BMAPS stern1_map,stern2_map,stern3_map,stern4_map;
        DELAY 2,2,2,2;}

TEXTURE stern10_tex {
        SCALE_XY 35,35;
        CYCLES 4;
        BMAPS stern1_map,stern2_map,stern3_map,stern4_map;
        DELAY 2,2,2,2;}

TEXTURE stern20_tex {
        SCALE_XY 25,25;
        CYCLES 4;
        BMAPS stern1_map,stern2_map,stern3_map,stern4_map;
        DELAY 2,2,2,2;}

TEXTURE herz05_tex {
        SCALE_XY 45,45;
        CYCLES 4;
        BMAPS herz1_map,herz2_map,herz3_map,herz4_map;
        DELAY 2,2,2,2;}

TEXTURE herz10_tex {
        SCALE_XY 35,35;
        CYCLES 4;
        BMAPS herz1_map,herz2_map,herz3_map,herz4_map;
        DELAY 2,2,2,2;}

TEXTURE herz20_tex {
        SCALE_XY 25,25;
        CYCLES 4;
        BMAPS herz1_map,herz2_map,herz3_map,herz4_map;
        DELAY 2,2,2,2;}

TEXTURE blitz05_tex {
        SCALE_XY 45,45;
        CYCLES 8;
        BMAPS blitz4_map,blitz1_map,blitz2_map,blitz3_map,blitz4_map,blitz5_map,blitz6_map,blitz7_map;
        DELAY 2,2,2,2,2,2,2,2;}

TEXTURE blitz10_tex {
        SCALE_XY 35,35;
        CYCLES 8;
        BMAPS blitz4_map,blitz1_map,blitz2_map,blitz3_map,blitz4_map,blitz5_map,blitz6_map,blitz7_map;
        DELAY 2,2,2,2,2,2,2,2;}

TEXTURE blitz20_tex {
        SCALE_XY 25,25;
        CYCLES 8;
        BMAPS blitz4_map,blitz1_map,blitz2_map,blitz3_map,blitz4_map,blitz5_map,blitz6_map,blitz7_map;
        DELAY 2,2,2,2,2,2,2,2;}

//////////
THING exp05 {
	DIST 5;
	TEXTURE stern05_tex;
	IF_NEAR take_exp05;
	FLAGS PASSABLE;
}
        
THING exp10 {
	DIST 5;
	TEXTURE stern10_tex;
	IF_NEAR take_exp10;
	FLAGS PASSABLE;
}

THING exp20 {
	DIST 5;
	TEXTURE stern20_tex;
	IF_NEAR take_exp20;
	FLAGS PASSABLE;
}

THING life05 {
        DIST 5;
        TEXTURE herz05_tex;
        IF_NEAR take_life05;
        FLAGS PASSABLE; 
}

THING life10 {
        DIST 5;
        TEXTURE herz10_tex;
        IF_NEAR take_life10;
        FLAGS PASSABLE; 
        }

THING life20 {
        DIST 5;
        TEXTURE herz20_tex;
        IF_NEAR take_life20;
        FLAGS PASSABLE; 
}

THING mana05 {
        DIST 5;
        TEXTURE blitz05_tex;
        IF_NEAR take_mana05;
        FLAGS PASSABLE;
}

THING mana10 {
        DIST 5;
        TEXTURE blitz10_tex;
        IF_NEAR take_mana10;
        FLAGS PASSABLE;
}

THING mana20 {
        DIST 5;
        TEXTURE blitz20_tex;
        IF_NEAR take_mana20;
        FLAGS PASSABLE;
}

THING nightscroll {
        DIST 5;
        TEXTURE scroll_tex;
        IF_NEAR take_nightscroll;
        FLAGS PASSABLE;
}
//////////Special Actions//////////
ACTION take_life05 {
        RULE MY.SKILL8=HP.MAX-0.5;
        IF_ABOVE HP,MY.SKILL8;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD HP,5;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,life05_str;
}

ACTION take_life10 {
        RULE MY.SKILL8=HP.MAX-0.5;
        IF_ABOVE HP,MY.SKILL8;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD HP,10;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,life10_str;
}

ACTION take_life20 {
        RULE MY.SKILL8=HP.MAX-0.5;
        IF_ABOVE HP,MY.SKILL8;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD HP,20;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,life20_str;
}

ACTION take_mana05 {
        RULE MY.SKILL8=MP.MAX-0.5;
        IF_ABOVE MP,MY.SKILL8;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD MP,5;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,mana05_str;
}

ACTION take_mana10 {
        RULE MY.SKILL8=MP.MAX-0.5;
        IF_ABOVE MP,MY.SKILL8;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD MP,10;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,mana10_str;
}

ACTION take_mana20 {
        RULE MY.SKILL8=MP.MAX-0.5;
        IF_ABOVE MP,MY.SKILL8;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD MP,20;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,mana20_str;
}

ACTION take_exp05 {
        IF_EQUAL nextlvl,0;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD points,5;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,exp05_str;
}

ACTION take_exp10 {
        IF_EQUAL nextlvl,0;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD points,10;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,exp10_str;
}

ACTION take_exp20 {
        IF_EQUAL nextlvl,0;
                END; 
	PLAY_SOUND collect_snd,0.3;
        ADD points,20;
        SET MY.INVISIBLE,1;
        SET newstring,1;
        SET info_str,exp20_str;
}

ACTION take_nightscroll {
        SET MY.INVISIBLE,1;
	PLAY_SOUND collect_snd,0.3;
        IF (nightvision==1) {ADD MP,15; END;}
        SET nightvision,1;
        SET newstring,1;
        SET info_str,nightscroll_str;
}
THING tree1 {
	TEXTURE tree1_tex;
	}

THING tree2 {
	TEXTURE tree2_tex;
	}

THING tree3 {
	TEXTURE tree3_tex;
	}

THING tree4 {
	TEXTURE tree4_tex;
	}

THING greystone {
	FLAGS PASSABLE;
	TEXTURE greystone_tex;
	HEIGHT -.1;
	}

THING brownstone {
	FLAGS PASSABLE;
	TEXTURE brownstone_tex;
	HEIGHT -.1;
	}

THING tiny_greystone {
	FLAGS PASSABLE;
	TEXTURE greystone_tiny_tex;
	HEIGHT -.1;
	}

THING tiny_brownstone {
	FLAGS PASSABLE;
	TEXTURE brownstone_tiny_tex;
	HEIGHT -.1;
	}

THING big_greystone {
	TEXTURE greystone_big_tex;
	HEIGHT -.1;
	}

THING big_brownstone {
	TEXTURE brownstone_big_tex;
	HEIGHT -.1;
	}

THING schilf {
	TEXTURE schilf_tex;
	FLAGS PASSABLE;
	MAP_COLOR 0;	
	}

THING torch {
	TEXTURE torch_tex;
	FLAGS PASSABLE;
	MAP_COLOR 0;
	HEIGHT 4;}

THING torch_8 {
	TEXTURE torch_tex;
	FLAGS PASSABLE;
	HEIGHT 8;}

THING slime {
	TEXTURE slime_tex;
	FLAGS PASSABLE,CANDELABER;
	MAP_COLOR 0;	
	}

THING stalag1 {
	TEXTURE stalag1_tex;
	HEIGHT -0.1;
	}

THING stalag1_klein {
	TEXTURE stalag1_klein_tex;
	HEIGHT -0.1;
	}

THING stalag2 {
	TEXTURE stalag2_tex;
	HEIGHT 0.1;
	FLAGS CANDELABER;
	}

THING stalag2_klein {
	TEXTURE stalag2_klein_tex;
	HEIGHT 0.1;
	FLAGS CANDELABER;
	}

THING cloud15 {
	TEXTURE cloud_tex;
	HEIGHT 1.5;
	FLAGS PASSABLE;
	}

THING cloud05 {
	TEXTURE cloud_tex;
	HEIGHT .5;
	FLAGS PASSABLE;
	}

THING cloud0 {
	TEXTURE cloud_tex;
	HEIGHT -.1;
	FLAGS PASSABLE;
	}

THING grass {
	TEXTURE grass_tex;
	FLAGS PASSABLE;}

THING busch {
	TEXTURE busch_tex;
	HEIGHT -0.1;}

THING pilz {
	FLAGS PASSABLE;
	TEXTURE pilz_tex;
}

THING gargy_dead {
	TEXTURE gargy_dead_tex;
	FLAGS PASSABLE;
	HEIGHT -0.1;}

THING cobweb {
	TEXTURE web_tex;
	FLAGS PASSABLE,CANDELABER;
}

THING gargy_anim {
	FLAGS SAVE,FRAGILE;
	TEXTURE gargy_anim_tex;
	IF_HIT, set_play;
	HEIGHT -0.1;}

ACTION set_play {
	IF_NEQUAL use,0;END;
	PLAY_SOUND broken_snd,1,MY;
	SET MY.PLAY,1;
	SET MY.IF_HIT,NULL;
	SET MY.PASSABLE,1;
} 

THING heal_pot {
TEXTURE redflask_tex;
SKILL3,250;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING mana_pot {
TEXTURE blueflask_tex;
SKILL3,300;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING int_pot {
TEXTURE yellowflask_tex;
SKILL3,600;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING str_pot {
TEXTURE orangeflask_tex;
SKILL3,450;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING con_pot {
TEXTURE greenflask_tex;
SKILL3,550;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING spd_pot {
TEXTURE brownflask_tex;
SKILL3,500;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING plate_armor {
TEXTURE plate_armor_tex;
SKILL3,15050;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING rustykey {
	TEXTURE brownkey_tex;
	DIST 5;
	SKILL2 1;
	SKILL3 400;
	IF_NEAR collect_item;}

THING ironkey {
	TEXTURE ironkey_tex;
	DIST 5;
	SKILL2 1;
	SKILL3 350;
	IF_NEAR collect_item;}

THING candle {
	HEIGHT -0.1;
	TEXTURE candle_tex;}

THING axe {
TEXTURE axe_tex;
SKILL3,10050;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING sword {
TEXTURE sword_tex;
SKILL3,10100;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

THING club {
TEXTURE club_tex;
SKILL3,10150;
DIST 5;
IF_NEAR collect_item;
FLAGS PASSABLE,SAVE;
}

//////////Ambient-Sounds//////////
SOUND eagleowl_snd, <eagleowl.wav>;
SOUND frog_snd, <frogs.wav>;
SOUND cricket_snd, <cricket.wav>;
SOUND drip_snd, <drip.wav>;

TEXTURE frog_tex {
RANDOM 1;
CYCLES 2;
BMAPS white_map,white_map;
DELAY 26,4;
SOUND frog_snd;
SVOL 1;SCYCLES 0,1;
}

TEXTURE eagleowl_tex {
RANDOM 1;
CYCLES 2;
BMAPS white_map,white_map;
DELAY 56,6;
SOUND eagleowl_snd;
SVOL 1;SCYCLES 0,1;
}

TEXTURE cricket_tex {
BMAPS white_map;
SOUND cricket_snd;
SVOL 0.3; SDIST 60; FLAGS SLOOP;
}

TEXTURE drip_tex {
RANDOM 1;
CYCLES 2;
BMAPS white_map,white_map;
DELAY 46,4;
SOUND drip_snd;
SVOL 0.7;SCYCLES 0,1; SDIST 50;
}

THING amb_frog {TEXTURE frog_tex; FLAGS PASSABLE;}
THING amb_eagleowl {TEXTURE eagleowl_tex; FLAGS PASSABLE;}
THING amb_cricket {TEXTURE cricket_tex; FLAGS PASSABLE;}
THING amb_drip {TEXTURE drip_tex; FLAGS PASSABLE;}
































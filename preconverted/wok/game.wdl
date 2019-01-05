BMAP display_map <display.pcx>,0,0,320,74;
BMAP char_map <char.pcx>,45,0,45,248;
BMAP candle1_map <spellsym.pcx>,0,0,20,60;
BMAP candle2_map <spellsym.pcx>,20,0,20,60;
BMAP candle3_map <spellsym.pcx>,40,0,20,60;
TEXTURE candle_tex {CYCLES 4;BMAPS candle1_map,candle2_map,candle3_map,candle2_map;DELAY 2,2,2,2;SCALE_XY 16,24;FLAGS CLIP;}
BMAP dragon1_map <dragon.pcx>,0,0,60,120;
BMAP dragon2_map <dragon.pcx>,60,0,60,120;
BMAP dragon3_map <dragon.pcx>,120,0,60,120;
BMAP dragon4_map <dragon.pcx>,180,0,60,120;
BMAP dragon5_map <dragon.pcx>,0,120,60,120;
BMAP dragon6_map <dragon.pcx>,60,120,60,120;
TEXTURE mad_dragon {CYCLES 4;BMAPS dragon1_map,dragon2_map,dragon3_map,dragon4_map;DELAY 4,4,4,4;}
TEXTURE mad_dragon2 {CYCLES 5;BMAPS dragon5_map,dragon6_map,dragon5_map,dragon6_map,dragon5_map;DELAY 4,3,4,3,4;FLAGS ONESHOT;}
BMAP logo_map <logo.pcx>,0,0,320,400;
BMAP title_map <title.pcx>,0,0,320,400;
PALETTE pal_blue {PALFILE <bluepal.pcx>;}
PALETTE pal_green {PALFILE <greenpal.pcx>;}
PALETTE pal_red {PALFILE <redpal.pcx>;}
PALETTE nebel_pal {PALFILE <whitepal.pcx>;RANGE 16,32;RANGE 48,32;RANGE 80,32;RANGE 112,32;RANGE 144,32;RANGE 176,32;RANGE 208,32;RANGE 240,15;} 
BMAP stone1_map <stonetex.pcx>,0,0,128,128;
BMAP stone8_map <stonetex.pcx>,128,256,128,128;
BMAP tree_map <tree.pcx>;
BMAP shining_map <shining.pcx>;
BMAP sky3_dark_map <sky3dark.pcx>;
BMAP gitter_map <gitter.pcx>,0,0,128,128;
BMAP flatgr_map <stontex3.pcx>,256,64,64,64;
BMAP flatbr_map <stontex3.pcx>,256,0,64,64;
BMAP flat1_map <stontex3.pcx>,128,0,64,64;
BMAP flat2_map <stontex3.pcx>,192,0,64,64;
BMAP flat3_map <stontex3.pcx>,128,64,64,64;
BMAP flat4_map <stontex3.pcx>,192,64,64,64;
BMAP stfloor1_map <floortex.pcx>,0,0,64,64;
BMAP stfloor2_map <floortex.pcx>,64,0,64,64;
BMAP stfloor3_map <floortex.pcx>,128,0,64,64;
BMAP stfloor4_map <floortex.pcx>,192,0,64,64;
BMAP stfloor5_map <floortex.pcx>,256,0,64,64;
BMAP stfloor6_map <floortex.pcx>,320,0,64,64;
BMAP stfloor7_map <floortex.pcx>,0,64,64,64;
BMAP stfloor8_map <floortex.pcx>,64,64,64,64;
BMAP stfloor9_map <floortex.pcx>,128,64,64,64;
BMAP stfloor10_map <floortex.pcx>,192,64,64,64;
BMAP stfloor11_map <floortex.pcx>,256,64,64,64;
BMAP stfloor12_map <floortex.pcx>,320,64,64,64;
BMAP stfloor13_map <stontex2.pcx>,0,0,64,64;
BMAP stfloor14_map <stontex2.pcx>,64,0,64,64;
BMAP stfloor15_map <stontex2.pcx>,128,0,64,64;
BMAP stfloor16_map <stontex2.pcx>,192,0,64,64;
BMAP stfloor17_map <stontex2.pcx>,0,64,64,64;
BMAP stfloor18_map <stontex2.pcx>,64,64,64,64;
BMAP stfloor19_map <stontex2.pcx>,128,64,64,64;
BMAP stfloor20_map <stontex2.pcx>,192,64,64,64;
BMAP woodflr_map <woodtex.pcx>,128,192,64,64;
BMAP woodceil_map <woodtex.pcx>,192,192,64,64;
BMAP jaildoor_map <jaildoor.pcx>,0,0,158,128;
BMAP ironkey_map <keys.pcx>,0,0,64,32;
BMAP brownkey_map <keys.pcx>,0,32,64,32;
BMAP wood1_map <woodtex.pcx>,0,0,128,128;
BMAP wood2_map <woodtex.pcx>,256,128,128,128;
BMAP wood3_map <woodtex.pcx>,0,256,128,128;
BMAP wood5h_map <woodtex.pcx>,128,128,64,64;
BMAP wood5b_map <woodtex.pcx>,192,128,64,64;
BMAP cave1_map <stontex3.pcx>,320,0,128,128;
BMAP cave2_map <stontex3.pcx>,448,0,128,128;
BMAP cave4_map <stontex3.pcx>,576,0,128,128;
BMAP green1_map <16colors.pcx>,0,0,64,64;
BMAP green2_map <16colors.pcx>,0,64,64,64;
BMAP white_map <16colors.pcx>,448,0,64,64;
BMAP black_map <16colors.pcx>,448,64,64,64;
BMAP wasser1o_map <wasser.pcx>,0,0,64,64;
BMAP wasser2o_map <wasser.pcx>,64,0,64,64;
BMAP wasser3o_map <wasser.pcx>,128,0,64,64;
BMAP wasser4o_map <wasser.pcx>,192,0,64,64;
BMAP wasser5o_map <wasser.pcx>,0,64,64,64;
BMAP wasser6o_map <wasser.pcx>,64,64,64,64;
BMAP wasser7o_map <wasser.pcx>,128,64,64,64;
BMAP wasser8o_map <wasser.pcx>,192,64,64,64;
BMAP wasser9o_map <wasser.pcx>,0,128,64,64;
BMAP wasser10o_map <wasser.pcx>,64,128,64,64;
BMAP wasser1u_map <wasser.pcx>,256,0,64,64;
BMAP wasser2u_map <wasser.pcx>,320,0,64,64;
BMAP wasser3u_map <wasser.pcx>,384,0,64,64;
BMAP wasser4u_map <wasser.pcx>,448,0,64,64;
BMAP wasser5u_map <wasser.pcx>,256,64,64,64;
BMAP wasser6u_map <wasser.pcx>,320,64,64,64;
BMAP wasser7u_map <wasser.pcx>,384,64,64,64;
BMAP wasser8u_map <wasser.pcx>,448,64,64,64;
BMAP wasser9u_map <wasser.pcx>,256,128,64,64;
BMAP wasser10u_map <wasser.pcx>,320,128,64,64;
BMAP wasserfall1_map <wasser.pcx>,192,128,16,64;
BMAP wasserfall2_map <wasser.pcx>,208,128,16,64;
BMAP wasserfall3_map <wasser.pcx>,224,128,16,64;
BMAP wasserfall4_map <wasser.pcx>,240,128,16,64;
BMAP acid1o_map <acid.pcx>,0,0,64,64;
BMAP acid2o_map <acid.pcx>,64,0,64,64;
BMAP acid3o_map <acid.pcx>,128,0,64,64;
BMAP acid4o_map <acid.pcx>,192,0,64,64;
BMAP acid5o_map <acid.pcx>,0,64,64,64;
BMAP acid6o_map <acid.pcx>,64,64,64,64;
BMAP acid7o_map <acid.pcx>,128,64,64,64;
BMAP acid8o_map <acid.pcx>,192,64,64,64;
BMAP acid9o_map <acid.pcx>,0,128,64,64;
BMAP acid10o_map <acid.pcx>,64,128,64,64;
BMAP acid1u_map <acid.pcx>,256,0,64,64;
BMAP acid2u_map <acid.pcx>,320,0,64,64;
BMAP acid3u_map <acid.pcx>,384,0,64,64;
BMAP acid4u_map <acid.pcx>,448,0,64,64;
BMAP acid5u_map <acid.pcx>,256,64,64,64;
BMAP acid6u_map <acid.pcx>,320,64,64,64;
BMAP acid7u_map <acid.pcx>,384,64,64,64;
BMAP acid8u_map <acid.pcx>,448,64,64,64;
BMAP acid9u_map <acid.pcx>,256,128,64,64;
BMAP acid10u_map <acid.pcx>,320,128,64,64;
BMAP tree1_map <tree1.pcx>,0,0,128,128;
BMAP tree2_map <tree2.pcx>;
BMAP tree3_map <tree3.pcx>,0,0,163,200;
BMAP tree4_map <tree4.pcx>,0,0,158,128;
BMAP busch_map <busch.pcx>;
BMAP pilz_map <pilz.pcx>,0,0,64,68;
BMAP waldrand_map <waldrand.pcx>;
BMAP wald_map <waldwand.pcx>;
BMAP waldlicht_map <waldoben.pcx>;
BMAP greystone_map <caveitem.pcx>,128,0,50,32;
BMAP brownstone_map <caveitem.pcx>,128,32,50,32;
BMAP gargoyle_map <gargoyle.pcx>;
BMAP slime_map <caveitem.pcx>,104,0,24,64;
BMAP schilf_map <schilf.pcx>,0,0,128,128;
BMAP stalag1_map <caveitem.pcx>,0,0,32,64;
BMAP stalag2_map <caveitem.pcx>,32,0,32,64;
BMAP cloud1_map <items.pcx>,0,0,57,29;
BMAP cloud2_map <items.pcx>,1,0,57,30;
BMAP cloud3_map <items.pcx>,2,0,57,31;
BMAP cloud4_map <items.pcx>,3,0,57,32;
BMAP cloud5_map <items.pcx>,4,0,57,31;
BMAP cloud6_map <items.pcx>,5,0,57,30;
BMAP cloud7_map <items.pcx>,7,0,57,29;
BMAP torch1_map <caveitem.pcx>,64,0,10,64;
BMAP torch2_map <caveitem.pcx>,74,0,10,64;
BMAP torch3_map <caveitem.pcx>,84,0,10,64;
BMAP torch4_map <caveitem.pcx>,94,0,10,64;
BMAP switch1_off_map <switches.pcx>,0,0,32,32;
BMAP switch1_on_map <switches.pcx>,32,0,32,32;
BMAP switch2_off_map <switches.pcx>,0,32,32,32;
BMAP switch2_on_map <switches.pcx>,32,32,32,32;
BMAP treewall_map <treetex.pcx>;
BMAP woodwin_map <window.pcx>;
BMAP wooddoor_map <wooddoor.pcx>;
BMAP web_map <cobweb.pcx>;
BMAP gargoyle2_map <gargoyl2.pcx>;
BMAP gargoyle3_map <gargoyl3.pcx>;
BMAP gargoyle4_map <gargoyl4.pcx>;
BMAP gargoyle5_map <gargoyl5.pcx>;
BMAP sign_map <sign.pcx>;
BMAP yellowflask_map <flask.pcx>,0,0,45,64;
BMAP orangeflask_map <flask.pcx>,45,0,45,64;
BMAP redflask_map <flask.pcx>,90,0,45,64;
BMAP blueflask_map <flask.pcx>,135,0,45,64;
BMAP greenflask_map <flask.pcx>,180,0,45,64;
BMAP brownflask_map <flask.pcx>,225,0,45,64;
BMAP greyflask_map <flask.pcx>,270,0,45,64;
BMAP plate_armor_map <armor.pcx>;
BMAP scroll_map <scroll.pcx>;
BMAP club_map <weapons.pcx>,0,0,89,42;
BMAP axe_map <weapons.pcx>,0,42,88,49;
BMAP sword_map <weapons.pcx>,0,91,89,24;
BMAP walltex4_kl_map <woodtex.pcx>,192,0,64,128;
BMAP walltex4_map <woodtex.pcx>,256,0,128,128;
TEXTURE grass_tex {BMAPS schilf_map;SCALE_XY 60,60;}
TEXTURE tree1_tex {SCALE_XY 8,8;BMAPS tree1_map;}
TEXTURE tree2_tex {SCALE_XY 12,12;BMAPS tree2_map;}
TEXTURE tree3_tex {SCALE_XY 10,10;BMAPS tree3_map;}
TEXTURE tree4_tex {SCALE_XY 8,8;BMAPS tree4_map;}
TEXTURE busch_tex {FLAGS CLIP;SCALE_XY 16,16;BMAPS busch_map;}
TEXTURE pilz_tex {AMBIENT -0.05;SCALE_XY 30,30;BMAPS pilz_map;}
TEXTURE greystone_tex {FLAGS CLIP;SCALE_XY 20,20;BMAPS greystone_map;}
TEXTURE greystone_big_tex {FLAGS CLIP;SCALE_XY 10,10;BMAPS greystone_map;}
TEXTURE greystone_tiny_tex {FLAGS CLIP;SCALE_XY 30,30;BMAPS greystone_map;}
TEXTURE brownstone_tex {FLAGS CLIP;SCALE_XY 20,20;BMAPS brownstone_map;}
TEXTURE brownstone_tiny_tex {FLAGS CLIP;SCALE_XY 30,30;BMAPS brownstone_map;}
TEXTURE brownstone_big_tex {FLAGS CLIP;SCALE_XY 10,10;BMAPS brownstone_map;}
TEXTURE gargoyle_tex {FLAGS CLIP;SCALE_XY 30,25;BMAPS gargoyle_map;}
TEXTURE slime_tex {AMBIENT 0.3;SCALE_XY 25,25;BMAPS slime_map;}
TEXTURE schilf_tex {SCALE_XY 30,30;BMAPS schilf_map;}
TEXTURE stalag1_tex {SCALE_XY 10,5;FLAGS CLIP;BMAPS stalag1_map;}
TEXTURE stalag2_tex {SCALE_XY 10,5;FLAGS CLIP;BMAPS stalag2_map;}
TEXTURE cloud_tex {AMBIENT 0.3;SCALE_XY 10,20;FLAGS CLIP,DIAPHANOUS;CYCLES 12;BMAPS cloud1_map,cloud2_map,cloud3_map,cloud4_map,cloud5_map,cloud6_map,cloud7_map,cloud6_map,cloud5_map,cloud4_map,cloud3_map,cloud2_map;DELAY 6,6,6,6,6,6,6,6,6,6,6,6;}
TEXTURE stalag1_klein_tex {SCALE_XY 20,10;FLAGS CLIP;BMAPS stalag1_map;}
TEXTURE stalag2_klein_tex {SCALE_XY 20,10;FLAGS CLIP;BMAPS stalag2_map;}
TEXTURE torch_tex {AMBIENT 0.2;SCALE_XY 13,13;CYCLES 6;RANDOM 0.5;BMAPS torch1_map,torch2_map,torch3_map,torch4_map,torch3_map,torch2_map;DELAY 1,2,1,2,1,2;}
TEXTURE ironkey_tex {SCALE_XY 32,32;AMBIENT -.2;BMAPS ironkey_map;}
TEXTURE brownkey_tex {SCALE_XY 32,32;AMBIENT -.2;BMAPS brownkey_map;}
TEXTURE wasserfall_tex {SOUND wfall_snd;SDIST 20;ALBEDO 0.1;CYCLES 4;BMAPS wasserfall1_map,wasserfall2_map,wasserfall3_map,wasserfall4_map;SCALE_XY 16,16;DELAY 1,1,1,1;}
TEXTURE wasseroben_tex {SOUND wstep_snd;SDIST 30;CYCLES 10;BMAPS wasser1o_map,wasser2o_map,wasser3o_map,wasser4o_map,wasser5o_map,wasser6o_map,wasser7o_map,wasser8o_map,wasser9o_map,wasser10o_map;SCALE_XY 16,16;DELAY 2,2,2,2,2,2,2,2,2,2;}
TEXTURE wasserunten_tex {CYCLES 10;BMAPS wasser1u_map,wasser2u_map,wasser3u_map,wasser4u_map,wasser5u_map,wasser6u_map,wasser7u_map,wasser8u_map,wasser9u_map,wasser10u_map;SCALE_XY 16,16;DELAY 2,2,2,2,2,2,2,2,2,2;}
TEXTURE acidoben_tex {SOUND wstep_snd;SDIST 30;CYCLES 10;BMAPS acid1o_map,acid2o_map,acid3o_map,acid4o_map,acid5o_map,acid6o_map,acid7o_map,acid8o_map,acid9o_map,acid10o_map;SCALE_XY 16,16;DELAY 2,2,2,2,2,2,2,2,2,2;}
TEXTURE acidunten_tex {CYCLES 10;BMAPS acid1u_map,acid2u_map,acid3u_map,acid4u_map,acid5u_map,acid6u_map,acid7u_map,acid8u_map,acid9u_map,acid10u_map;SCALE_XY 16,16;DELAY 2,2,2,2,2,2,2,2,2,2;}
TEXTURE swamp_tex {ALBEDO 0.1;CYCLES 10;BMAPS acid1o_map,acid2o_map,acid3o_map,acid4o_map,acid5o_map,acid6o_map,acid7o_map,acid8o_map,acid9o_map,acid10o_map;SCALE_XY 16,16;DELAY 2,2,2,2,2,2,2,2,2,2;}
TEXTURE wood1_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS wood1_map;}
TEXTURE wood2_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS wood2_map;}
TEXTURE wood1_long_tex {ALBEDO 0.1;SCALE_XY 10,20;BMAPS wood1_map;}
TEXTURE wood2_long_tex {ALBEDO 0.1;SCALE_XY 20,10;BMAPS wood2_map;}
TEXTURE wood1_broad_tex {ALBEDO 0.1;SCALE_XY 20,10;BMAPS wood1_map;}
TEXTURE wood2_broad_tex {ALBEDO 0.1;SCALE_XY 10,20;BMAPS wood2_map;}
TEXTURE wood3_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS wood3_map;}
TEXTURE wood5b_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS wood5b_map;}
TEXTURE wood5h_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS wood5h_map;}
TEXTURE woodflr_tex {AMBIENT 0.1;ALBEDO 0.1;SCALE_XY 16,16;BMAPS woodflr_map;}
TEXTURE woodceil_tex {AMBIENT 0.45;ALBEDO 0.1;SCALE_XY 16,16;BMAPS woodceil_map;}
TEXTURE texdoor_tex {ALBEDO 0.1;SCALE_XY 13,13;BMAPS jaildoor_map;}
TEXTURE texdoor2_tex {ALBEDO 0.1;SCALE_XY 10,10.7;BMAPS jaildoor_map;}
TEXTURE stone1_tex {ALBEDO 0.1;SCALE_XY 8,8;BMAPS stone1_map;}
TEXTURE stone8_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stone8_map;}
TEXTURE tree_tex {ALBEDO 0.1;SCALE_XY 10.24,10.24;BMAPS tree_map;}
TEXTURE shining_tex {AMBIENT 0.6;SCALE_XY 7.85,7.85;BMAPS shining_map;}
TEXTURE sky3_dark_tex {SIDES 6;BMAPS sky3_dark_map,sky3_dark_map,sky3_dark_map,sky3_dark_map,sky3_dark_map,sky3_dark_map;FLAGS SKY;}
TEXTURE waldrand_tex {SIDES 12;BMAPS waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map,waldrand_map;FLAGS SKY;}
TEXTURE wald_tex {SCALE_XY 8,8;BMAPS wald_map;}
TEXTURE waldlicht_tex {SCALE_XY 4,4;BMAPS waldlicht_map;}
TEXTURE stfloor1_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor1_map;}
TEXTURE stfloor2_tex {ALBEDO 0.1;scale_xy 16,16;bmaps stfloor2_map;}
TEXTURE stfloor3_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor3_map;}
TEXTURE stfloor4_tex {ALBEDO 0.1;scale_xy 16,16;bmaps stfloor4_map;}
TEXTURE stfloor5_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor5_map;}
TEXTURE stfloor6_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor6_map;}
TEXTURE stfloor7_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor7_map;}
TEXTURE stfloor8_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor8_map;}
TEXTURE stfloor9_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor9_map;}
TEXTURE stfloor10_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor10_map;}
TEXTURE stfloor11_tex {SCALE_XY 16,16;BMAPS stfloor11_map;}
TEXTURE stfloor12_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor12_map;}
TEXTURE stfloor12_hell_tex {AMBIENT 0.1;ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor12_map;}
TEXTURE stfloor13_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor13_map;}
TEXTURE stfloor14_tex {ALBEDO 0.1;scale_xy 16,16;bmaps stfloor14_map;}
TEXTURE stfloor15_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor15_map;}
TEXTURE stfloor16_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor16_map;}
TEXTURE stfloor17_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor17_map;}
TEXTURE stfloor18_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor18_map;}
TEXTURE stfloor19_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor19_map;}
TEXTURE stfloor20_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS stfloor20_map;}
TEXTURE cave1_tex {AMBIENT -0.1;ALBEDO 0.1;SCALE_XY 9.142,9.142;BMAPS cave1_map;}
TEXTURE cave2_tex {ALBEDO 0.1;SCALE_XY 9.142,9.142;BMAPS cave2_map;}
TEXTURE cave4_tex {ALBEDO 0.1;SCALE_XY 8,8;BMAPS cave4_map;}
TEXTURE cave4_klein_tex {ALBEDO 0.1;SCALE_XY 11.6,11.6;BMAPS cave4_map;}
TEXTURE white_tex {ALBEDO 0.1;BMAPS white_map;}
TEXTURE black_tex {ALBEDO 0.1;BMAPS black_map;}
TEXTURE switch1_off_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS switch1_off_map;}
TEXTURE switch1_on_tex {ALBEDO 0.1; SCALE_XY 16,16;BMAPS switch1_on_map;}
TEXTURE switch2_off_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS switch2_off_map;}
TEXTURE switch2_on_tex {ALBEDO 0.1;SCALE_XY 16,16;BMAPS switch2_on_map;}
TEXTURE treewall_tex {SCALE_XY 8,8;BMAPS treewall_map;}
TEXTURE woodwin_tex {SCALE_XY 12.8,12.8;BMAPS woodwin_map;}
TEXTURE wooddoor_tex {SCALE_XY 9.1,12.8;BMAPS wooddoor_map;}
TEXTURE wooddoor2_tex {SCALE_XY 11.13,10.6;BMAPS wooddoor_map;}
TEXTURE web_tex {SCALE_XY 8,8;BMAPS web_map;FLAGS DIAPHANOUS;AMBIENT .1;}
TEXTURE gargy_anim_tex {SCALE_XY 30,25;FLAGS ONESHOT,CLIP;CYCLES 5;BMAPS gargoyle_map,gargoyle2_map,gargoyle3_map,gargoyle4_map,gargoyle5_map;DELAY 1,1,1,1,1;}
TEXTURE gargy_dead_tex {SCALE_XY 30,25;FLAGS CLIP;BMAPS gargoyle5_map;}
TEXTURE sign_tex {SCALE_XY 10.66,10.66;BMAPS sign_map;}
TEXTURE gitter_big_tex {ALBEDO 0.1;SCALE_XY 11.6,11.6;BMAPS gitter_map;}
TEXTURE wasserfall_dia_tex {SOUND wfall_snd;SDIST 30;FLAGS DIAPHANOUS;ALBEDO 0.1;CYCLES 4;BMAPS wasserfall1_map,wasserfall2_map,wasserfall3_map,wasserfall4_map;SCALE_XY 16,16;DELAY 1,1,1,1;}
TEXTURE yellowflask_tex {SCALE_XY 32,32;BMAPS yellowflask_map;}
TEXTURE orangeflask_tex {SCALE_XY 32,32;BMAPS orangeflask_map;}
TEXTURE redflask_tex {SCALE_XY 32,32;BMAPS redflask_map;}
TEXTURE blueflask_tex {SCALE_XY 32,32;BMAPS blueflask_map;}
TEXTURE greenflask_tex {SCALE_XY 32,32;BMAPS greenflask_map;}
TEXTURE brownflask_tex {SCALE_XY 32,32;BMAPS brownflask_map;}
TEXTURE greyflask_tex {SCALE_XY 32,32;BMAPS greyflask_map;}
TEXTURE plate_armor_tex {SCALE_XY 18,18;BMAPS plate_armor_map;}
TEXTURE sword_tex {SCALE_XY 29,29;BMAPS sword_map;}
TEXTURE club_tex {SCALE_XY 29,29;BMAPS club_map;}
TEXTURE axe_tex {SCALE_XY 29,29;BMAPS axe_map;}
TEXTURE scroll_tex {SCALE_XY 35,35;BMAPS scroll_map;}
TEXTURE walltex4_kl_tex {AMBIENT .2;SCALE_XY 10,10;BMAPS walltex4_kl_map;}
TEXTURE walltex4_tex {AMBIENT .2;SCALE_XY 10,10;BMAPS walltex4_map;}
WALL dummywand {TEXTURE black_tex;MAP_COLOR 0;FLAGS INVISIBLE,PASSABLE;}
WALL dummywand_im {TEXTURE white_tex; MAP_COLOR 0;FLAGS IMPASSABLE,TRANSPARENT,CURTAIN;}
WALL stone8_im {TEXTURE stone8_tex;MAP_COLOR 0;FLAGS IMPASSABLE;}
WALL black {TEXTURE black_tex;}
WALL stone1 {TEXTURE stone1_tex;}
WALL stone8 {TEXTURE stone8_tex;}
WALL stone1_im {FLAGS IMPASSABLE;TEXTURE stone1_tex;}
WALL tree_curtain {TEXTURE tree_tex;FLAGS CURTAIN;}
WALL tree {TEXTURE tree_tex;}
WALL tree_port {TEXTURE tree_tex;FLAGS PORTCULLIS,CURTAIN;}
WALL tree_port1 {TEXTURE tree_tex;FLAGS PORTCULLIS;POSITION 1;}
WALL wald_exit {FLAGS PORTCULLIS;TEXTURE shining_tex;}
WALL stwall1 {TEXTURE stfloor1_tex;}
WALL stwall2 {TEXTURE stfloor2_tex;}
WALL stwall3 {TEXTURE stfloor3_tex;}
WALL stwall4 {FLAGS PORTCULLIS;POSITION 1;TEXTURE stfloor4_tex;}
WALL stwall5 {TEXTURE stfloor5_tex;}
WALL stwall6 {TEXTURE stfloor6_tex;}
WALL stwall7 {TEXTURE stfloor7_tex;}
WALL stwall8 {TEXTURE stfloor8_tex;}
WALL stwall9 {TEXTURE stfloor9_tex;}
WALL stwall10 {TEXTURE stfloor10_tex;}
WALL stwall12 {TEXTURE stfloor12_tex;}
WALL stwall12_hell_im {FLAGS IMPASSABLE;TEXTURE stfloor12_hell_tex;}
WALL stwall12_im {FLAGS IMPASSABLE;TEXTURE stfloor12_tex;}
WALL stwall12_hell {TEXTURE stfloor12_hell_tex;}
WALL stwall13 {POSITION 1;FLAGS PORTCULLIS;TEXTURE stfloor13_tex;}
WALL stwall14 {TEXTURE stfloor14_tex;}
WALL stwall15 {FLAGS PORTCULLIS;TEXTURE stfloor15_tex;}
WALL stwall16 {TEXTURE stfloor16_tex;}
WALL stwall17 {TEXTURE stfloor17_tex;}
WALL stwall18 {TEXTURE stfloor18_tex;}
WALL stwall19 {TEXTURE stfloor19_tex;}
WALL stwall20 {FLAGS PORTCULLIS;POSITION 1;TEXTURE stfloor20_tex;}
WALL wood1 {TEXTURE wood1_tex;FLAGS PORTCULLIS;}
WALL wood2 {TEXTURE wood2_tex;FLAGS PORTCULLIS;}
WALL wood3 {TEXTURE wood3_tex;FLAGS PORTCULLIS;}
WALL wood5_hoch {TEXTURE wood5h_tex;FLAGS PORTCULLIS;POSITION 1;}
WALL wood5_breit {TEXTURE wood5b_tex;}
WALL wood2_long {TEXTURE wood2_long_tex;FLAGS PORTCULLIS;}
WALL wood1_long {TEXTURE wood1_long_tex;FLAGS PORTCULLIS;}
WALL wood2_broad {TEXTURE wood2_broad_tex;FLAGS PORTCULLIS;}
WALL wood1_broad {TEXTURE wood1_broad_tex;FLAGS PORTCULLIS;}
WALL woodfloor {TEXTURE woodflr_tex;}
WALL cave4 {TEXTURE cave4_tex;}
WALL cave4_klein {FLAGS PORTCULLIS;TEXTURE cave4_klein_tex;}
WALL waldrand {MAP_COLOR 0;OFFSET_Y,-15;FLAGS FAR;TEXTURE waldrand_tex;}
WALL waldrand_curtain {MAP_COLOR 0;OFFSET_Y,-15;FLAGS FAR,CURTAIN;TEXTURE waldrand_tex;}
WALL wald {FLAGS TRANSPARENT,FENCE,IMPASSABLE;TEXTURE wald_tex;}
WALL wasserfall {TEXTURE wasserfall_tex;EACH_TICK move_wasserfall;}
WALL cloud {TEXTURE cloud_tex;FLAGS PASSABLE,FENCE,TRANSPARENT;}
WALL treewall {TEXTURE treewall_tex;FLAGS PORTCULLIS;}
WALL woodwin {TEXTURE woodwin_tex;FLAGS PORTCULLIS,TRANSPARENT;}
WALL sky3_dark {TEXTURE sky3_dark_tex;MAP_COLOR 0;FLAGS PORTCULLIS;}
WALL cave1 {FLAGS PORTCULLIS;TEXTURE cave1_tex;}
WALL cave2 {FLAGS PORTCULLIS;TEXTURE cave2_tex;}
WALL stone8_far {TEXTURE stone8_tex;FLAGS FAR;}
WALL wasserfall_dia {TEXTURE wasserfall_dia_tex;FLAGS PASSABLE,CURTAIN,TRANSPARENT;EACH_TICK move_wasserfall;}
WALL walltex4_klein {TEXTURE walltex4_kl_tex;}
WALL walltex4 {TEXTURE walltex4_tex;}
WALL contest {TEXTURE black_tex;IF_NEAR display_contest;}
BMAP ghostFT1_map <ghost.pcx>,0,0,192,165;
BMAP ghost1Q1_map <ghost.pcx>,200,0,192,165;
BMAP ghostSD1_map <ghost.pcx>,400,0,192,165;
BMAP ghost3Q1_map <ghost.pcx>,600,0,192,165;
BMAP ghostBK1_map <ghost.pcx>,800,0,192,165;
BMAP ghostFT2_map <ghost.pcx>,0,170,192,165;
BMAP ghost1Q2_map <ghost.pcx>,200,170,192,165;
BMAP ghostSD2_map <ghost.pcx>,400,170,192,165;
BMAP ghost3Q2_map <ghost.pcx>,600,170,192,165;
BMAP ghostBK2_map <ghost.pcx>,800,170,192,165;
BMAP ghostFTA_map <ghost.pcx>,0,680,192,165;
BMAP ghost1QA_map <ghost.pcx>,200,680,192,165;
BMAP ghostSDA_map <ghost.pcx>,400,680,192,165;
BMAP ghost3QA_map <ghost.pcx>,600,680,192,165;
BMAP ghostBKA_map <ghost.pcx>,800,680,192,165;
BMAP ghostD1_map <ghost.pcx>,0,340,250,165;
BMAP ghostD2_map <ghost.pcx>,250,340,250,165;
BMAP ghostD3_map <ghost.pcx>,500,340,250,165;
BMAP ghostD4_map <ghost.pcx>,0,510,250,165;
BMAP ghostD5_map <ghost.pcx>,250,510,250,165;
BMAP ghostD6_map <ghost.pcx>,500,510,250,165;
BMAP ghosthit_map <ghost.pcx>,800,340,192,165;
TEXTURE ghost_tex {AMBIENT .2;SIDES 8;CYCLES 8;BMAPS ghostFT2_map,ghostFT2_map,ghostFT2_map,ghostFT2_map,ghostFT1_map,ghostFT1_map,ghostFT1_map,ghostFT1_map,ghost1Q2_map,ghost1Q2_map,ghost1Q2_map,ghost1Q2_map,ghost1Q1_map,ghost1Q1_map,ghost1Q1_map,ghost1Q1_map,ghostSD2_map,ghostSD2_map,ghostSD2_map,ghostSD2_map,ghostSD1_map,ghostSD1_map,ghostSD1_map,ghostSD1_map,ghost3Q2_map,ghost3Q2_map,ghost3Q2_map,ghost3Q2_map,ghost3Q1_map,ghost3Q1_map,ghost3Q1_map,ghost3Q1_map,ghostBK2_map,ghostBK2_map,ghostBK2_map,ghostBK2_map,ghostBK1_map,ghostBK1_map,ghostBK1_map,ghostBK1_map,ghost3Q2_map,ghost3Q2_map,ghost3Q2_map,ghost3Q2_map,ghost3Q1_map,ghost3Q1_map,ghost3Q1_map,ghost3Q1_map,ghostSD2_map,ghostSD2_map,ghostSD2_map,ghostSD2_map,ghostSD1_map,ghostSD1_map,ghostSD1_map,ghostSD1_map,ghost1Q2_map,ghost1Q2_map,ghost1Q2_map,ghost1Q2_map,ghost1Q1_map,ghost1Q1_map,ghost1Q1_map,ghost1Q1_map;MIRROR 0,1,1,1,0,0,0,0;OFFSET_Y 20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24,20,13,6,0,6,12,28,24;DELAY 3,3,3,7,2,2,2,2;SCALE_XY 34,30;}
TEXTURE ghost_flee_tex {AMBIENT .3;CYCLES 8;BMAPS ghosthit_map,ghosthit_map,ghosthit_map,ghosthit_map,ghosthit_map,ghosthit_map,ghosthit_map,ghosthit_map;OFFSET_Y 20,13,6,0,6,12,28,24;DELAY 2,2,2,2,2,2,2,2;SCALE_XY 34,30;FLAGS DIAPHANOUS;}
TEXTURE ghostdie_tex {AMBIENT .2;CYCLES 6;BMAPS ghostD1_map,ghostD2_map,ghostD3_map,ghostD4_map,ghostD5_map,ghostD6_map;DELAY 3,3,3,3,4,2;SCALE_XY 34,30;FLAGS ONESHOT,DIAPHANOUS;}
TEXTURE ghostatk_tex {AMBIENT .2;SIDES 8;CYCLES 4;BMAPS ghostFTA_map,ghostFTA_map,ghostFTA_map,ghostFTA_map,ghost1QA_map,ghost1QA_map,ghost1QA_map,ghost1QA_map,ghostSDA_map,ghostSDA_map,ghostSDA_map,ghostSDA_map,ghost3QA_map,ghost3QA_map,ghost3QA_map,ghost3QA_map,ghostBKA_map,ghostBKA_map,ghostBKA_map,ghostBKA_map,ghost3QA_map,ghost3QA_map,ghost3QA_map,ghost3QA_map,ghostSDA_map,ghostSDA_map,ghostSDA_map,ghostSDA_map,ghost1QA_map,ghost1QA_map,ghost1QA_map,ghost1QA_map;OFFSET_Y 0,10,0,-10,0,10,0,-10,0,10,0,-10,0,10,0,-10,0,10,0,-10,0,10,0,-10,0,10,0,-10,0,10,0,-10;DELAY 3,4,3,4;MIRROR 0,1,1,1,0,0,0,0;SCALE_XY 34,30;}
ACTOR ghost {TEXTURE ghost_tex;HEIGHT 2.5;IF_HIT ghost_hit;SKILL6 1;SKILL7 0;SKILL8 20;EACH_CYCLE update_screen;FLAGS CAREFULLY,FRAGILE;EACH_TICK ghost_AI;}
BMAP minoSD1_map <minotaur.pcx>,0,4,134,196;
BMAP minoSD2_map <minotaur.pcx>,0,206,143,194;
BMAP minoSD3_map <minotaur.pcx>,0,402,117,198;
BMAP minoSD4_map <minotaur.pcx>,0,603,122,197;
BMAP minoSD5_map <minotaur.pcx>,0,802,127,198;
BMAP minoSD6_map <minotaur.pcx>,0,1001,126,199;
BMAP minoSD7_map <minotaur.pcx>,0,1202,124,198;
BMAP minoSD8_map <minotaur.pcx>,0,1404,135,196;
BMAP minoFT1_map <minotaur.pcx>,145,7,90,193;
BMAP minoFT2_map <minotaur.pcx>,145,204,91,196;
BMAP minoFT3_map <minotaur.pcx>,145,404,78,196;
BMAP minoFT4_map <minotaur.pcx>,145,603,102,197;
BMAP minoFT5_map <minotaur.pcx>,145,803,87,197;
BMAP minoFT6_map <minotaur.pcx>,145,1000,84,200;
BMAP minoFT7_map <minotaur.pcx>,145,1203,87,197;
BMAP minoFT8_map <minotaur.pcx>,145,1402,83,198;
BMAP minoBK1_map <minotaur.pcx>,250,6,89,194;
BMAP minoBK2_map <minotaur.pcx>,250,202,89,198;
BMAP minoBK3_map <minotaur.pcx>,250,403,82,197;
BMAP minoBK4_map <minotaur.pcx>,250,600,100,200;
BMAP minoBK5_map <minotaur.pcx>,250,803,88,197;
BMAP minoBK6_map <minotaur.pcx>,250,1002,90,198;
BMAP minoBK7_map <minotaur.pcx>,250,1202,86,198;
BMAP minoBK8_map <minotaur.pcx>,250,1402,83,198;
BMAP mino3Q1_map <minotaur.pcx>,350,5,131,195;
BMAP mino3Q2_map <minotaur.pcx>,350,206,113,194;
BMAP mino3Q3_map <minotaur.pcx>,350,402,95,198;
BMAP mino3Q4_map <minotaur.pcx>,350,601,124,199;
BMAP mino3Q5_map <minotaur.pcx>,350,804,136,196;
BMAP mino3Q6_map <minotaur.pcx>,350,1003,119,197;
BMAP mino3Q7_map <minotaur.pcx>,350,1200,101,200;
BMAP mino3Q8_map <minotaur.pcx>,350,1405,109,195;
BMAP mino1Q1_map <minotaur.pcx>,500,4,123,196;
BMAP mino1Q2_map <minotaur.pcx>,500,207,133,193;
BMAP mino1Q3_map <minotaur.pcx>,500,405,140,195;
BMAP mino1Q4_map <minotaur.pcx>,500,601,131,199;
BMAP mino1Q5_map <minotaur.pcx>,500,803,102,197;
BMAP mino1Q6_map <minotaur.pcx>,500,1001,113,199;
BMAP mino1Q7_map <minotaur.pcx>,500,1201,123,199;
BMAP mino1Q8_map <minotaur.pcx>,500,1400,130,200;
BMAP minoDie1_map <minotaur.pcx>,650,1,104,199;
BMAP minoDie2_map <minotaur.pcx>,650,213,125,187;
BMAP minoDie3_map <minotaur.pcx>,650,418,140,182;
BMAP minoDie4_map <minotaur.pcx>,650,644,145,156;
BMAP minoDie5_map <minotaur.pcx>,650,941,134,59;
BMAP minoAtk1_map <minotaur.pcx>,800,5,80,195;
BMAP minoAtk2_map <minotaur.pcx>,800,205,82,195;
BMAP minoAtk3_map <minotaur.pcx>,800,406,98,194;
BMAP minoAtk4_map <minotaur.pcx>,800,605,74,195;
BMAP minoAtk5_map <minotaur.pcx>,800,810,72,190;
BMAP minoAtk6_map <minotaur.pcx>,800,1003,79,197;
TEXTURE mino_tex {SIDES 8;CYCLES 8;BMAPS minoFT1_map,minoFT2_map,minoFT3_map,minoFT4_map,minoFT5_map,minoFT6_map,minoFT7_map,minoFT8_map,mino1Q1_map,mino1Q2_map,mino1Q3_map,mino1Q4_map,mino1Q5_map,mino1Q6_map,mino1Q7_map,mino1Q8_map,minoSD1_map,minoSD2_map,minoSD3_map,minoSD4_map,minoSD5_map,minoSD6_map,minoSD7_map,minoSD8_map,mino3Q1_map,mino3Q2_map,mino3Q3_map,mino3Q4_map,mino3Q5_map,mino3Q6_map,mino3Q7_map,mino3Q8_map,minoBK1_map,minoBK2_map,minoBK3_map,minoBK4_map,minoBK5_map,minoBK6_map,minoBK7_map,minoBK8_map,mino3Q1_map,mino3Q2_map,mino3Q3_map,mino3Q4_map,mino3Q5_map,mino3Q6_map,mino3Q7_map,mino3Q8_map,minoSD1_map,minoSD2_map,minoSD3_map,minoSD4_map,minoSD5_map,minoSD6_map,minoSD7_map,minoSD8_map,mino1Q1_map,mino1Q2_map,mino1Q3_map,mino1Q4_map,mino1Q5_map,mino1Q6_map,mino1Q7_map,mino1Q8_map;MIRROR 0,1,1,1,0,0,0,0;DELAY 2,2,2,2,2,2,2,2;SCALE_XY 26,26;}
TEXTURE minoDie_tex {CYCLES 5;BMAPS minoDie1_map,minoDie2_map,minoDie3_map,minoDie4_map,minoDie5_map;FLAGS ONESHOT;DELAY 3,3,3,3,4;SCALE_XY 26,26;}
TEXTURE minoAtk_tex {CYCLES 6;BMAPS minoAtk1_map,minoAtk2_map,minoAtk3_map,minoAtk4_map,minoAtk5_map,minoAtk6_map;FLAGS ONESHOT;DELAY 1,1,1,1,1,1;SCALE_XY 26,26;}
ACTOR minotaur {TEXTURE mino_tex;HEIGHT -.01;IF_HIT mino_hit;SKILL5 0;SKILL6 1.5;SKILL7 2;SKILL8 28;FLAGS CAREFULLY,FRAGILE;DIST 10;EACH_TICK mino_AI;}
BMAP inv_map <inv.pcx>,30,0,60,248;
BMAP stern1_map <stern.pcx>,0,0,64,64;
BMAP stern2_map <stern.pcx>,64,0,64,64;
BMAP stern3_map <stern.pcx>,128,0,64,64;
BMAP stern4_map <stern.pcx>,192,0,64,64;
BMAP herz1_map <herz.pcx>,0,0,76,64;
BMAP herz2_map <herz.pcx>,76,0,76,64;
BMAP herz3_map <herz.pcx>,152,0,76,64;
BMAP herz4_map <herz.pcx>,228,0,76,64;
BMAP blitz1_map <blitz.pcx>,0,0,40,64;
BMAP blitz2_map <blitz.pcx>,40,0,40,64;
BMAP blitz3_map <blitz.pcx>,80,0,40,64;
BMAP blitz4_map <blitz.pcx>,120,0,40,64;
BMAP blitz5_map <blitz.pcx>,160,0,40,64;
BMAP blitz6_map <blitz.pcx>,200,0,40,64;
BMAP blitz7_map <blitz.pcx>,240,0,40,64;
TEXTURE stern05_tex {SCALE_XY 45,45;CYCLES 4;BMAPS stern1_map,stern2_map,stern3_map,stern4_map;DELAY 2,2,2,2;}
TEXTURE stern10_tex {SCALE_XY 35,35;CYCLES 4;BMAPS stern1_map,stern2_map,stern3_map,stern4_map;DELAY 2,2,2,2;}
TEXTURE stern20_tex {SCALE_XY 25,25;CYCLES 4;BMAPS stern1_map,stern2_map,stern3_map,stern4_map;DELAY 2,2,2,2;}
TEXTURE herz05_tex {SCALE_XY 45,45;CYCLES 4;BMAPS herz1_map,herz2_map,herz3_map,herz4_map;DELAY 2,2,2,2;}
TEXTURE herz10_tex {SCALE_XY 35,35;CYCLES 4;BMAPS herz1_map,herz2_map,herz3_map,herz4_map;DELAY 2,2,2,2;}
TEXTURE herz20_tex {SCALE_XY 25,25;CYCLES 4;BMAPS herz1_map,herz2_map,herz3_map,herz4_map;DELAY 2,2,2,2;}
TEXTURE blitz05_tex {SCALE_XY 45,45;CYCLES 8;BMAPS blitz4_map,blitz1_map,blitz2_map,blitz3_map,blitz4_map,blitz5_map,blitz6_map,blitz7_map;DELAY 2,2,2,2,2,2,2,2;}
TEXTURE blitz10_tex {SCALE_XY 35,35;CYCLES 8;BMAPS blitz4_map,blitz1_map,blitz2_map,blitz3_map,blitz4_map,blitz5_map,blitz6_map,blitz7_map;DELAY 2,2,2,2,2,2,2,2;}
TEXTURE blitz20_tex {SCALE_XY 25,25;CYCLES 8;BMAPS blitz4_map,blitz1_map,blitz2_map,blitz3_map,blitz4_map,blitz5_map,blitz6_map,blitz7_map;DELAY 2,2,2,2,2,2,2,2;}
THING exp05 {DIST 5;TEXTURE stern05_tex;IF_NEAR take_exp05;FLAGS PASSABLE;}
THING exp10 {DIST 5;TEXTURE stern10_tex;IF_NEAR take_exp10;FLAGS PASSABLE;}
THING exp20 {DIST 5;TEXTURE stern20_tex;IF_NEAR take_exp20;FLAGS PASSABLE;}
THING life05 {DIST 5;TEXTURE herz05_tex;IF_NEAR take_life05;FLAGS PASSABLE;}
THING life10 {DIST 5;TEXTURE herz10_tex;IF_NEAR take_life10;FLAGS PASSABLE;}
THING life20 {DIST 5;TEXTURE herz20_tex;IF_NEAR take_life20;FLAGS PASSABLE;}
THING mana05 {DIST 5;TEXTURE blitz05_tex;IF_NEAR take_mana05;FLAGS PASSABLE;}
THING mana10 {DIST 5;TEXTURE blitz10_tex;IF_NEAR take_mana10;FLAGS PASSABLE;}
THING mana20 {DIST 5;TEXTURE blitz20_tex;IF_NEAR take_mana20;FLAGS PASSABLE;}
THING nightscroll {DIST 5;TEXTURE scroll_tex;IF_NEAR take_nightscroll;FLAGS PASSABLE;}
THING tree1 {TEXTURE tree1_tex;}
THING tree2 {TEXTURE tree2_tex;}
THING tree3 {TEXTURE tree3_tex;}
THING tree4 {TEXTURE tree4_tex;}
THING greystone {FLAGS PASSABLE;TEXTURE greystone_tex;HEIGHT -.1;}
THING brownstone {FLAGS PASSABLE;TEXTURE brownstone_tex;HEIGHT -.1;}
THING tiny_greystone {FLAGS PASSABLE;TEXTURE greystone_tiny_tex;HEIGHT -.1;}
THING tiny_brownstone {FLAGS PASSABLE;TEXTURE brownstone_tiny_tex;HEIGHT -.1;}
THING big_greystone {TEXTURE greystone_big_tex;HEIGHT -.1;}
THING big_brownstone {TEXTURE brownstone_big_tex;HEIGHT -.1;}
THING schilf {TEXTURE schilf_tex;FLAGS PASSABLE;MAP_COLOR 0;}
THING torch {TEXTURE torch_tex;FLAGS PASSABLE;MAP_COLOR 0;HEIGHT 4;}
THING torch_8 {TEXTURE torch_tex;FLAGS PASSABLE;HEIGHT 8;}
THING slime {TEXTURE slime_tex;FLAGS PASSABLE,CANDELABER;MAP_COLOR 0;}
THING stalag1 {TEXTURE stalag1_tex;HEIGHT -0.1;}
THING stalag1_klein {TEXTURE stalag1_klein_tex;HEIGHT -0.1;}
THING stalag2 {TEXTURE stalag2_tex;HEIGHT 0.1;FLAGS CANDELABER;}
THING stalag2_klein {TEXTURE stalag2_klein_tex;HEIGHT 0.1;FLAGS CANDELABER;}
THING cloud15 {TEXTURE cloud_tex;HEIGHT 1.5;FLAGS PASSABLE;}
THING cloud05 {TEXTURE cloud_tex;HEIGHT .5;FLAGS PASSABLE;}
THING cloud0 {TEXTURE cloud_tex;HEIGHT -.1;FLAGS PASSABLE;}
THING grass {TEXTURE grass_tex;FLAGS PASSABLE;}
THING busch {TEXTURE busch_tex;HEIGHT -0.1;}
THING pilz {FLAGS PASSABLE;TEXTURE pilz_tex;}
THING gargy_dead {TEXTURE gargy_dead_tex;FLAGS PASSABLE;HEIGHT -0.1;}
THING cobweb {TEXTURE web_tex;FLAGS PASSABLE,CANDELABER;}
THING gargy_anim {FLAGS SAVE,FRAGILE;TEXTURE gargy_anim_tex;IF_HIT,set_play;HEIGHT -0.1;}
THING heal_pot {TEXTURE redflask_tex;SKILL3,250;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING mana_pot {TEXTURE blueflask_tex;SKILL3,300;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING int_pot {TEXTURE yellowflask_tex;SKILL3,600;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING str_pot {TEXTURE orangeflask_tex;SKILL3,450;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING con_pot {TEXTURE greenflask_tex;SKILL3,550;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING spd_pot {TEXTURE brownflask_tex;SKILL3,500;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING plate_armor {TEXTURE plate_armor_tex;SKILL3,15050;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING rustykey {TEXTURE brownkey_tex;DIST 5;SKILL2 1;SKILL3 400;IF_NEAR collect_item;}
THING ironkey {TEXTURE ironkey_tex;DIST 5;SKILL2 1;SKILL3 350;IF_NEAR collect_item;}
THING candle {HEIGHT -0.1;TEXTURE candle_tex;}
THING axe {TEXTURE axe_tex;SKILL3,10050;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING sword {TEXTURE sword_tex;SKILL3,10100;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
THING club {TEXTURE club_tex;SKILL3,10150;DIST 5;IF_NEAR collect_item;FLAGS PASSABLE,SAVE;}
TEXTURE frog_tex {RANDOM 1;CYCLES 2;BMAPS white_map,white_map;DELAY 26,4;SOUND frog_snd;SVOL 1;SCYCLES 0,1;}
TEXTURE eagleowl_tex {RANDOM 1;CYCLES 2;BMAPS white_map,white_map;DELAY 56,6;SOUND eagleowl_snd;SVOL 1;SCYCLES 0,1;}
TEXTURE cricket_tex {BMAPS white_map;SOUND cricket_snd;SVOL 0.3;SDIST 60;FLAGS SLOOP;}
TEXTURE drip_tex {RANDOM 1;CYCLES 2;BMAPS white_map,white_map;DELAY 46,4;SOUND drip_snd;SVOL 0.7;SCYCLES 0,1;SDIST 50;}
THING amb_frog {TEXTURE frog_tex;FLAGS PASSABLE;}
THING amb_eagleowl {TEXTURE eagleowl_tex;FLAGS PASSABLE;}
THING amb_cricket {TEXTURE cricket_tex;FLAGS PASSABLE;}
THING amb_drip {TEXTURE drip_tex;FLAGS PASSABLE;}
REGION border {EACH_TICK startlev;CLIP_DIST 0;FLOOR_HGT 40;CEIL_HGT 40;FLOOR_TEX stfloor1_tex;CEIL_TEX stfloor1_tex;}
REGION caveswitch_nische {FLOOR_HGT 8.5;CEIL_HGT 10.5;FLOOR_TEX stfloor1_tex;CEIL_TEX stfloor1_tex;FLAGS SAVE;}
REGION black_reg {FLOOR_TEX black_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT 0.1;}
REGION forestway {FLOOR_TEX stfloor17_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT 0;}
REGION forestway2b {FLOOR_TEX stfloor15_tex;CEIL_TEX black_tex;FLOOR_HGT -20;CEIL_HGT -6;CLIP_DIST 200;AMBIENT -.2;}
REGION forestway2 {FLOOR_TEX stfloor17_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT 0;BELOW forestway2b;}
REGION forest_tunnelwand {FLOOR_TEX stone8_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;BELOW forestway2b;}
REGION foresthole {FLOOR_TEX stfloor17_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;SKILL7 -19;SKILL8 -4;FLAGS SAVE;}
REGION forestrand_noclip {FLOOR_TEX stfloor20_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 0;AMBIENT -.1;}
REGION forestway_ganzhell {FLOOR_TEX stfloor17_tex;CEIL_TEX waldlicht_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT .2;}
REGION forestrand_ganzhell {FLOOR_TEX stfloor20_tex;CEIL_TEX waldlicht_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT .2;}
REGION forestrand {FLOOR_TEX stfloor20_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;}
REGION forestrand_hell {FLOOR_TEX stfloor20_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT .25;}
REGION forestrand_flicker {FLOOR_TEX stfloor20_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT 0;EACH_TICK flicker_cave;}
REGION forest_tree {FLOOR_TEX stfloor20_tex;CEIL_TEX stfloor2_tex;FLOOR_HGT 0;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -.3;}
REGION forest_tree_CA {FLOOR_TEX stfloor20_tex;CEIL_TEX stfloor2_tex;FLOOR_HGT 0;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -.1;FLAGS CEIL_ASCEND;}
REGION forest_tree_CA_hell {FLOOR_TEX stfloor20_tex;CEIL_TEX stfloor2_tex;FLOOR_HGT 0;CEIL_HGT 25;CLIP_DIST 200;AMBIENT .3;FLAGS CEIL_ASCEND;}
REGION baumstumpf {FLOOR_TEX wood5b_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.3;}
REGION baumstumpfrand {FLOOR_TEX wood5b_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 25;CLIP_DIST 200;AMBIENT 0;}
REGION baumstumpf_FACD {FLOOR_TEX wood5b_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.3;FLAGS FLOOR_ASCEND,CEIL_DESCEND;}
REGION baumstumpf2_b {FLOOR_TEX wood5b_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 0.5;CEIL_HGT 10.5;CLIP_DIST 200;AMBIENT -.15;}
REGION baumstumpf2_FACD_b {FLOOR_TEX wood5b_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 0.5;CEIL_HGT 10.5;CLIP_DIST 200;AMBIENT -.15;FLAGS FLOOR_ASCEND,CEIL_DESCEND;}
REGION baumstumpf2 {FLOOR_TEX wood5b_tex;CEIL_TEX black_tex;FLOOR_HGT 11;CEIL_HGT 25;CLIP_DIST 200;AMBIENT 0;BELOW baumstumpf2_b;}
REGION baumstumpf2_FD {FLOOR_TEX wood5b_tex;CEIL_TEX black_tex;FLOOR_HGT 11;CEIL_HGT 25;CLIP_DIST 200;AMBIENT 0;FLAGS FLOOR_DESCEND;BELOW baumstumpf2_FACD_b;}
REGION baumstumpf3 {FLOOR_TEX wood5h_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.3;}
REGION baumstumpf3_FACD {FLOOR_TEX wood5h_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.3;FLAGS FLOOR_ASCEND,CEIL_DESCEND;}
REGION baumstumpf4_b {FLOOR_TEX wood5h_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 0.5;CEIL_HGT 10.5;CLIP_DIST 200;AMBIENT -.15;}
REGION baumstumpf4_FACD_b {FLOOR_TEX wood5h_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 0.5;CEIL_HGT 10.5;CLIP_DIST 200;AMBIENT -.15;FLAGS FLOOR_ASCEND,CEIL_DESCEND;}
REGION baumstumpf4 {FLOOR_TEX wood5h_tex;CEIL_TEX black_tex;FLOOR_HGT 11;CEIL_HGT 25;CLIP_DIST 200;AMBIENT 0;BELOW baumstumpf4_b;}
REGION baumstumpf4_FD {FLOOR_TEX wood5h_tex;CEIL_TEX black_tex;FLOOR_HGT 11;CEIL_HGT 25;CLIP_DIST 200;AMBIENT 0;FLAGS FLOOR_DESCEND;BELOW baumstumpf4_FACD_b;}
REGION forestway_FCD {FLOOR_TEX stfloor17_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;FLAGS FLOOR_DESCEND;}
REGION forestwand_FCD {FLOOR_TEX stone8_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -0.1;FLAGS FLOOR_DESCEND;}
REGION forestwand {FLOOR_TEX stone8_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMbIENT -0.1;}
REGION forestwand2 {FLOOR_TEX stone8_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMbIENT 0;}
REGION forestwand3 {FLOOR_TEX stone8_tex;CEIL_TEX stfloor2_tex;FLOOR_HGT -4;CEIL_HGT 10;CLIP_DIST 200;AMbIENT -.1;FLAGS CEIL_ASCEND;}
REGION forestway_tunnel {FLOOR_TEX stfloor17_tex;CEIL_TEX wood5b_tex;FLOOR_HGT -10;CEIL_HGT -1.5;CLIP_DIST 200;AMBIENT -.15;}
REGION forestway_FD_b {FLOOR_TEX stfloor17_tex;CEIL_TEX wood5b_tex;FLOOR_HGT -10;CEIL_HGT -1.5;CLIP_DIST 200;FLAGS CEIL_ASCEND;AMBIENT -.1;}
REGION forestway_FD {FLOOR_TEX wood5b_tex;CEIL_TEX black_tex;FLOOR_HGT 3.5;CEIL_HGT 25;CLIP_DIST 200;FLAGS FLOOR_DESCEND;BELOW forestway_FD_b;}
REGION forestway_FD_nb {FLOOR_TEX wood5b_tex;CEIL_TEX black_tex;FLOOR_HGT 3.5;CEIL_HGT 25;CLIP_DIST 200;FLAGS FLOOR_DESCEND;}
REGION forestwater_b {FLOOR_TEX stfloor13_tex;CEIL_TEX wasserunten_tex;FLOOR_HGT -13.5;CEIL_HGT -2.5;IF_ARISE regio_arise;CLIP_DIST 200;AMBIENT -0.3;}
REGION forestwater {FLOOR_TEX wasseroben_tex;CEIL_TEX black_tex;FLOOR_HGT 4;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.1;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forestwater_noenter {FLOOR_TEX wasseroben_tex;CEIL_TEX black_tex;FLOOR_HGT 4;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.1;}
REGION forestwater_load {FLOOR_TEX wasseroben_tex;CEIL_TEX black_tex;FLOOR_HGT 4;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.1;IF_ENTER set_forest3;}
REGION forestwater1 {FLOOR_TEX wasseroben_tex;CEIL_TEX black_tex;FLOOR_HGT 4;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.45;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forestwater1_flicker {FLOOR_TEX wasseroben_tex;CEIL_TEX stfloor12_tex;FLOOR_HGT 4;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.25;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;EACH_TICK flicker_cave_d;}
REGION forestwater2 {FLOOR_TEX wasseroben_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 4;CEIL_HGT 7;CLIP_DIST 200;AMBIENT -0.3;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forestbridge_b {FLOOR_TEX wasseroben_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 4;CEIL_HGT 7;CLIP_DIST 200;AMBIENT -0.3;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forestbridge {FLOOR_TEX wood5b_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 8;CEIL_HGT 23;BELOW forestbridge_b;CLIP_DIST 200;AMBIENT -0.3;}
REGION forestbridge_hole {FLOOR_TEX wasseroben_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 4;CEIL_HGT 23;CLIP_DIST 200;AMBIENT -0.3;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forestbridge_hole_CD {FLOOR_TEX wasseroben_tex;CEIL_TEX wood5b_tex;FLOOR_HGT 4;CEIL_HGT 9.5;FLAGS CEIL_DESCEND;CLIP_DIST 200;AMBIENT -0.3;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forestbridge_ramp {FLOOR_TEX wood5b_tex;CEIL_TEX black_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;FLAGS FLOOR_ASCEND;AMBIENT -0.1;}
REGION forestbridge_nb {FLOOR_TEX wood5b_tex;CEIL_TEX wood5b_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.3;}
REGION forestcave {FLOOR_TEX stfloor10_tex;CEIL_TEX stfloor10_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.3;}
REGION forestcavegrey {FLOOR_TEX stfloor12_tex;CEIL_TEX stfloor12_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.2;}
REGION forestcavegrey_hell {FLOOR_TEX stfloor12_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT 0.2;}
REGION forestcave_entrance {FLOOR_TEX stfloor10_tex;CEIL_TEX stfloor10_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.15;}
REGION forestcave_flicker {FLOOR_TEX stfloor10_tex;CEIL_TEX stfloor10_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.3;EACH_TICK flicker_cave;}
REGION forestcave_FA {FLOOR_TEX stfloor10_tex;CEIL_TEX stfloor10_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.3;FLAGS FLOOR_ASCEND;}
REGION forestcave_FCD {FLOOR_TEX stfloor10_tex;CEIL_TEX stfloor10_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.3;FLAGS CEIL_DESCEND,FLOOR_DESCEND;}
REGION forestcave_outside {FLOOR_TEX stfloor12_tex;CEIL_TEX black_tex;FLOOR_HGT -0.2;CEIL_HGT 25;CLIP_DIST 200;AMBIENT -0.1;FLAGS FLOOR_ASCEND;}
REGION forest_tunnel {FLOOR_TEX stfloor15_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.2;}
REGION forest_tunnel_flicker {FLOOR_TEX stfloor15_tex;CEIL_TEX black_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.2;EACH_TICK flicker_cave_d;}
REGION forest_balken {FLOOR_TEX stfloor15_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.2;}
REGION forest_balken_b {FLOOR_TEX stfloor15_tex;CEIL_TEX wood5h_tex;FLOOR_HGT -20;CEIL_HGT -16;CLIP_DIST 200;AMBIENT -.2;FLAGS CEIL_ASCEND;}
REGION forest_balken_FA {FLOOR_TEX wood5h_tex;CEIL_TEX black_tex;BELOW forest_balken_b;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.2;FLAGS FLOOR_ASCEND;}
REGION forest_swamp {FLOOR_TEX acidoben_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forest_watercave {FLOOR_TEX stfloor7_tex;CEIL_TEX stfloor7_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.45;}
REGION forest_waterentrance {FLOOR_TEX wasseroben_tex;CEIL_TEX stfloor12_tex;FLOOR_HGT 4;CEIL_HGT 14;CLIP_DIST 200;FLAGS CEIL_DESCEND;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;AMBIENT -.2;}
REGION forestwater3 {FLOOR_TEX wasseroben_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 4;CEIL_HGT 14;CLIP_DIST 200;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forest_waterborder {FLOOR_TEX stfloor12_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 4;CEIL_HGT 14;CLIP_DIST 200;AMBIENT .1;}
REGION forest_waterborder_FD {FLOOR_TEX stfloor12_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 4;CEIL_HGT 14;CLIP_DIST 200;AMBIENT .1;FLAGS FLOOR_DESCEND;}
REGION forest_swampceil {FLOOR_TEX acidoben_tex;CEIL_TEX woodflr_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
WALL forest_doortex1 {TEXTURE wooddoor_tex;IF_HIT set_forest_door1_open;DIST 50;FLAGS SAVE,PORTCULLIS;}
REGION forest_door1 {FLOOR_TEX woodflr_tex;CEIL_TEX woodflr_tex;FLOOR_HGT 0;CEIL_HGT 0;CLIP_DIST 200;SKILL2 -0.5;SKILL7 11;FLAGS SAVE;}
REGION forest_swamphut {FLOOR_TEX woodflr_tex;CEIL_TEX woodflr_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;}
REGION forest_swamphut_flicker {FLOOR_TEX woodflr_tex;CEIL_TEX woodflr_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;EACH_TICK flicker_cave_d;}
REGION forest_swampway_FA {FLOOR_TEX stfloor17_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;FLAGS FLOOR_ASCEND;}
REGION forest_swamprand {FLOOR_TEX stfloor20_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT 0;CEIL_HGT 12;CLIP_DIST 200;AMBIENT .15;}
REGION forest_tunnelende_b {FLOOR_TEX stfloor15_tex;CEIL_TEX stone8_tex;FLOOR_HGT -20;CEIL_HGT -6;CLIP_DIST 200;}
REGION forest_tunnelende {FLOOR_TEX stone8_tex;CEIL_TEX stfloor2_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;BELOW forest_tunnelende_b;FLAGS CEIL_ASCEND;AMBIENT -.1;}
REGION forest_tunnelende2 {FLOOR_TEX stone8_tex;CEIL_TEX sky3_dark_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;BELOW forest_tunnelende_b;AMBIENT .1;}
REGION forest_watertunnel {FLOOR_TEX wasseroben_tex;CEIL_TEX black_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.2;IF_ENTER water_enter_forest;IF_LEAVE water_leave_forest;}
REGION forest_tomb {FLOOR_TEX stone8_tex;CEIL_TEX stone8_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.3;EACH_TICK flicker_cave_d;}
REGION forest_sarg {FLOOR_TEX wood5h_tex;CEIL_TEX stone8_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.3;}
REGION forest_switchreg {FLOOR_TEX stfloor1_tex;CEIL_TEX woodflr_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;}
REGION forest_switchreg_FD {FLOOR_TEX stfloor1_tex;CEIL_TEX woodflr_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;FLAGS FLOOR_DESCEND;}
WALL forestdoorswitch4 {TEXTURE woodflr_tex;IF_HIT set_forestdoor4_open;FLAGS SAVE,FENCE;}
REGION forest_switchblack {FLOOR_TEX black_tex;CEIL_TEX woodflr_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 200;AMBIENT -.1;}
THING forestdoor3_l_gen {TEXTURE black_tex;FLAGS PASSABLE,INVISIBLE;}
THING forestdoor3_r_gen {TEXTURE black_tex;FLAGS PASSABLE,INVISIBLE;}
REGION forest_door3l {FLOOR_TEX black_tex;CEIL_TEX woodceil_tex;FLOOR_HGT 12;CEIL_HGT 12;CLIP_DIST 0;SKILL3 -1.57;SKILL4 0;GENIUS forestdoor3_l_gen;}
REGION forest_door3r {FLOOR_TEX black_tex;CEIL_TEX woodceil_tex;FLOOR_HGT -4;CEIL_HGT 12;CLIP_DIST 0;SKILL4 0;SKILL3 1.57;GENIUS forestdoor3_r_gen;}
WALL forestdoortex3 {TEXTURE wooddoor2_tex;IF_HIT set_forestdoor3_open;FLAGS SAVE,PORTCULLIS;}
REGION forest_door4 {FLOOR_TEX wood5h_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 11;CEIL_HGT 21;SKILL8 11;SKILL7 0;AMBIENT -.3;FLAGS SAVE;}
REGION forest_door4_FACD {FLOOR_TEX wood5h_tex;CEIL_TEX wood5h_tex;FLOOR_HGT 11;CEIL_HGT 21;SKILL8 11;SKILL7 0;FLAGS FLOOR_ASCEND,CEIL_DESCEND;AMBIENT -.3;FLAGS SAVE;}
WALL forestsign {FLAGS TRANSPARENT,FENCE;TEXTURE sign_tex;IF_HIT read_forestsign;}
THING winged_death {FLAGS SAVE,FRAGILE;TEXTURE gargy_anim_tex;IF_HIT set_foresthole;HEIGHT -0.1;}
WALL forestdoortex1 {TEXTURE texdoor_tex;FLAGS FENCE,TRANSPARENT,SAVE,FLAG6;IF_HIT set_forestdoor1_open;OFFSET_X 147;SKILL2 -0.5;SKILL7 16;}
WALL forestdoortex2 {TEXTURE gitter_big_tex;FLAGS TRANSPARENT,SAVE,PORTCULLIS;IF_HIT forestdoor2_msg;SKILL2 -0.5;SKILL7 24;}
WALL forestdoorswitch2 {TEXTURE switch1_off_tex;FLAGS SAVE,PORTCULLIS;IF_HIT set_forestdoor2_open;IF_NEAR set_forestdoorswitch2;DIST 20;}
PALETTE pal1 {PALFILE <gamepal.pcx>;RANGE 16,32;RANGE 48,32;RANGE 80,32;RANGE 112,32;RANGE 144,32;RANGE 176,32;RANGE 208,32;FLAGS BLUR;}
ACTOR player_old {TEXTURE black_tex;FLAGS INVISIBLE,CAREFULLY,SAVE;}
THING camera1 {TEXTURE black_tex;HEIGHT 15;SKILL8 0.5;FLAGS INVISIBLE,SAVE;}
THING camera2 {TEXTURE black_tex;HEIGHT 2;SKILL8 0.2;FLAGS INVISIBLE,SAVE;}
THING camera3 {TEXTURE black_tex;HEIGHT 9;SKILL8 0.2;FLAGS INVISIBLE,SAVE;}
THING camera4 {TEXTURE black_tex;HEIGHT 422;SKILL8 0.3;FLAGS INVISIBLE,SAVE;}
THING camera5 {TEXTURE black_tex;HEIGHT 9;SKILL8 0.1;FLAGS INVISIBLE,SAVE;}

//////////////////////////////////////////////////////////////////////////////////////////
//                                9-6-1997    -    1-1-1998                             //
//                                                                                      //
//                           _______________________________                            //
//                          | *   THE LORD OF LIGHTNING   * |                           //
//                          |_______________________________|                           //
//                                                                                      //
//                                                                                      //
//                               This Game Is Freeware!                                 //
//                            This Is The DEMO VERSION Of LL                            //
//                           Copyright  Virtua Demon Software                           //
//                               This Game Is Freeware!                                 //
//                                                                                      //
//                                    Programed By:                                     //
//                                                                                      //
//                                 Alexander K. Seifriz                                 //
//                                 Feckenhauser Str.27                                  //
//                                   78628 Rottweil                                     //
//                                       GERMANY                                        //
//                            E-Mail: gambitsoft@t-online.de                            //
//                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////


//+++MUMIE!+++////////////////////////////////////////////////////////////////////////

SOUND mumbum_snd,       <mub.wav>;    //Abschuss...
SOUND mumbumm_snd,      <mbu.wav>;    //...Aufprall

SOUND mum1_snd,         <mum1.wav>;   //leises Knurren
SOUND mum2_snd,         <mum15.wav>;  //leises Knurren und leises Fauchen
SOUND mum3_snd,         <mum2.wav>;   //Bruellen
SOUND mum4_snd,         <mum3.wav>;   //Grunzen

SOUND die_snd,          <die.wav>;    //Sterben


BMAP mum_wart1,         <mum_wart.pcx>,0,0,100,200;
BMAP mum_wart2,         <mum_wart.pcx>,100,0,100,200;
BMAP mum_wart3,         <mum_wart.pcx>,200,0,100,200;
BMAP mum_wart4,         <mum_wart.pcx>,300,0,100,200;

BMAP mum_geh1,          <mum_geh.pcx>,0,0,100,200;
BMAP mum_geh2,          <mum_geh.pcx>,100,0,100,200;
BMAP mum_geh3,          <mum_geh.pcx>,200,0,100,200;
BMAP mum_geh4,          <mum_geh.pcx>,0,200,100,200;
BMAP mum_geh5,          <mum_geh.pcx>,100,200,100,200;
BMAP mum_geh6,          <mum_geh.pcx>,200,200,100,200;
BMAP mum_geha,          <mum_geh.pcx>,300,0,100,200;
BMAP mum_gehb,          <mum_geh.pcx>,400,0,100,200;
BMAP mum_gehc,          <mum_geh.pcx>,500,0,100,200;
BMAP mum_gehd,          <mum_geh.pcx>,300,200,100,200;
BMAP mum_gehe,          <mum_geh.pcx>,400,200,100,200;
BMAP mum_gehf,          <mum_geh.pcx>,500,200,100,200;
BMAP mum_gehI,          <mum_geh.pcx>,0,400,100,200;
BMAP mum_gehII,         <mum_geh.pcx>,100,400,100,200;
BMAP mum_gehIII,        <mum_geh.pcx>,200,400,100,200;
BMAP mum_gehIV,         <mum_geh.pcx>,300,400,100,200;
BMAP mum_gehV,          <mum_geh.pcx>,400,400,100,200;
BMAP mum_gehVI,         <mum_geh.pcx>,500,400,100,200;
BMAP mum_gehf1,         <mum_geh.pcx>,0,600,100,200;
BMAP mum_gehf2,         <mum_geh.pcx>,100,600,100,200;
BMAP mum_gehf3,         <mum_geh.pcx>,200,600,100,200;
BMAP mum_gehf4,         <mum_geh.pcx>,300,600,100,200;
BMAP mum_gehf5,         <mum_geh.pcx>,400,600,100,200;
BMAP mum_gehf6,         <mum_geh.pcx>,500,600,100,200;

BMAP mum_atak1,          <mum_atak.pcx>,0,0,100,200;
BMAP mum_atak2,          <mum_atak.pcx>,100,0,100,200;
BMAP mum_atak3,          <mum_atak.pcx>,200,0,100,200;
BMAP mum_atak4,          <mum_atak.pcx>,300,0,100,200;
BMAP mum_atak5,          <mum_atak.pcx>,400,0,100,200;
BMAP mum_atak6,          <mum_atak.pcx>,500,0,100,200;

BMAP mum_ster1,          <mum_ster.pcx>,0,0,100,200;
BMAP mum_ster2,          <mum_ster.pcx>,100,0,100,200;
BMAP mum_ster3,          <mum_ster.pcx>,200,0,100,200;
BMAP mum_ster4,          <mum_ster.pcx>,300,0,100,200;
BMAP mum_ster5,          <mum_ster.pcx>,400,0,100,200;
BMAP mum_ster6,          <mum_ster.pcx>,500,0,100,200;

BMAP mum_rest,           <rest.pcx>,0,0,40,10;

BMAP bulgreen1,          <bulgreen.pcx>,0,0,40,40;
BMAP bulgreen2,          <bulgreen.pcx>,40,0,40,40;

BMAP bulred1,            <bulgreen.pcx>,0,40,40,40;
BMAP bulred2,            <bulgreen.pcx>,40,40,40,40;

BMAP bulex1,             <bulgreen.pcx>,80,0,40,40;
BMAP bulex2,             <bulgreen.pcx>,120,0,40,40;
BMAP bulex3,             <bulgreen.pcx>,80,40,40,40;
BMAP bulex4,             <bulgreen.pcx>,120,40,40,40;

//+++TEXTUREN+++/////////////////////////////////////////////////////////////////////
TEXTURE	mum_warten_tex {
SCALE_XY 38,38;
SIDES 4;
CYCLES 2;
BMAPS	mum_wart1, mum_wart1, mum_wart4, mum_wart4, mum_wart2, mum_wart2, mum_wart3, mum_wart3;
DELAY 115,115;
AMBIENT	1;
SOUND mum1_snd;
SCYCLES 1,0;
SVOL 1;
SDIST 170;
}

TEXTURE	mum_gehen_tex {
SCALE_XY 38,38;
SIDES 4;
CYCLES 6;
BMAPS mum_geh1, mum_geh2, mum_geh3, mum_geh4, mum_geh5, mum_geh6, mum_gehf1, mum_gehf2, mum_gehf3, mum_gehf4, mum_gehf5, mum_gehf6, mum_geha, mum_gehb, mum_gehc, mum_gehd, mum_gehe, mum_gehf, mum_gehI, mum_gehII, mum_gehIII, mum_gehIV, mum_gehV, mum_gehVI;
DELAY 2,2,2,2,2,2;
AMBIENT	1;
}

TEXTURE	mum_atak_tex {
SCALE_XY 38,38;
CYCLES 6;
BMAPS mum_atak1, mum_atak2, mum_atak3, mum_atak4, mum_atak5, mum_atak6;
DELAY 4,4,4,4,4,4;
AMBIENT	1;
SOUND mumbum_snd;
SCYCLES 0,0,1,0,0,0;
SVOL 0.65;
SDIST 120;
}

TEXTURE	mum_sterben_tex {
SCALE_XY 38,38;
CYCLES 6;
BMAPS mum_ster1, mum_ster2, mum_ster3, mum_ster4, mum_ster5, mum_ster6;
DELAY 7,7,7,7,7,8;
AMBIENT	1;
SOUND die_snd;
SCYCLES 0,1,0,0,0,0;
SVOL 0.95;
SDIST 110;
}

TEXTURE	mum_rest_tex {SCALE_XY 24,24; BMAPS mum_rest; AMBIENT 1;}

TEXTURE bulgreen_tex {
SCALE_XY 42,42;
CYCLES 2;
BMAPS bulgreen1, bulgreen2;
DELAY 1,1;
AMBIENT 1;}

TEXTURE bulred_tex {
SCALE_XY 44,44;
CYCLES 2;
BMAPS bulred1, bulred2;
DELAY 1,1;
AMBIENT 1;}

TEXTURE bulex_tex {
SCALE_XY 34,34;
CYCLES 4;
BMAPS bulex1, bulex2, bulex3, bulex4;
DELAY 3,3,3,3;
AMBIENT 1;}

//+++ACTORS+++///////////////////////////////////////////////////////////////
//Dies ist die Standart-Mumie! Sie steht einfach bloss bloed 'rum und wartet blutruenstig auf den PLAYER!
ACTOR	mumie {
FLAGS FRAGILE;
TEXTURE	mum_warten_tex;
SKILL1 0; // leben des actors
SKILL2 0; // schon den Player gesehen (Grunz!)
HEIGHT -0.1;
EACH_TICK mum_warten;
}

//Dies hier sind meine speziellen Freunde! Sie laufen auf der Suche nach dem PLAYER im ganzen Dungeon herum!

ACTOR  Schlaechter_thronsaal     {FLAGS FRAGILE; TEXTURE mum_warten_tex; SKILL1 0; SKILL2 0; HEIGHT -0.1; EACH_TICK mum_patr1;}
ACTOR  Knochenbrecher_dunkelgang {FLAGS FRAGILE; TEXTURE mum_warten_tex; SKILL1 0; SKILL2 0; HEIGHT -0.1; EACH_TICK mum_patr2;}
ACTOR  Gottestoeter_magierstube  {FLAGS FRAGILE; TEXTURE mum_warten_tex; SKILL1 0; SKILL2 0; HEIGHT -0.1; EACH_TICK mum_patr3;}
ACTOR  Hirnsauger_schlafzimmer   {FLAGS FRAGILE; TEXTURE mum_warten_tex; SKILL1 0; SKILL2 0; HEIGHT -0.1; EACH_TICK mum_patr4;}

//+++SKILLS+++////////////////////////////////////////////////////////////////
SKILL   hilfe_o_treffer            {}
SKILL   mum_hoehe                  {}
SKILL   mum_gerade_zaehler         {}
SKILL   rand1                      {}
SKILL   koordx                     {}
SKILL   koordy                     {}
SKILL   koordz                     {}
SKILL   koorda                     {}
SYNONYM koordr                     {TYPE REGION;}

//+++geschoss+++//////////////////////////////////////////////////////////////
BMAP    haha_map          <platzh.pcx>  ,0,0,64,64;
TEXTURE haha_tex          {SCALE_XY 2,2;   BMAPS haha_map;}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss {
TEXTURE haha_tex;
HEIGHT 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
DIST 1;
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo {
SET      mum_geschoss.SKILL1,1;
SET      mum_geschoss.X,koordx;
SET      mum_geschoss.Y,koordy;
SET      mum_geschoss.REGION,koordr;
SET      mum_geschoss.HEIGHT,koordz;
SET      mum_geschoss.ANGLE,koorda;
SET      mum_geschoss.TEXTURE,bulgreen_tex;
SET      mum_geschoss.PASSABLE,0;
SET      mum_geschoss.SPEED,4;
SET      mum_geschoss.CAREFULLY,1;
SET      mum_geschoss.TARGET,BULLET;
SET      mum_geschoss.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss.IF_NEAR,mum_geschoss_bumm2;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss2 {
TEXTURE haha_tex;
HEIGHT 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
DIST 1;
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo2 {
SET      mum_geschoss2.SKILL1,1;
SET      mum_geschoss2.X,koordx;
SET      mum_geschoss2.Y,koordy;
SET      mum_geschoss2.REGION,koordr;
SET      mum_geschoss2.HEIGHT,koordz;
SET      mum_geschoss2.ANGLE,koorda;
SET      mum_geschoss2.TEXTURE,bulgreen_tex;
SET      mum_geschoss2.PASSABLE,0;
SET      mum_geschoss2.SPEED,4;
SET      mum_geschoss2.CAREFULLY,1;
SET      mum_geschoss2.TARGET,BULLET;
SET      mum_geschoss2.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss2.IF_NEAR,mum_geschoss_bumm2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss3 {
TEXTURE haha_tex;
HEIGHT 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
DIST 1;
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo3 {
SET      mum_geschoss3.SKILL1,1;
SET      mum_geschoss3.X,koordx;
SET      mum_geschoss3.Y,koordy;
SET      mum_geschoss3.REGION,koordr;
SET      mum_geschoss3.HEIGHT,koordz;
SET      mum_geschoss3.ANGLE,koorda;
SET      mum_geschoss3.TEXTURE,bulgreen_tex;
SET      mum_geschoss3.PASSABLE,0;
SET      mum_geschoss3.SPEED,4;
SET      mum_geschoss3.CAREFULLY,1;
SET      mum_geschoss3.TARGET,BULLET;
SET      mum_geschoss3.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss3.IF_NEAR,mum_geschoss_bumm2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss4 {
TEXTURE haha_tex;
HEIGHT 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
DIST 1;
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo4 {
SET      mum_geschoss4.SKILL1,1;
SET      mum_geschoss4.X,koordx;
SET      mum_geschoss4.Y,koordy;
SET      mum_geschoss4.REGION,koordr;
SET      mum_geschoss4.HEIGHT,koordz;
SET      mum_geschoss4.ANGLE,koorda;
SET      mum_geschoss4.TEXTURE,bulgreen_tex;
SET      mum_geschoss4.PASSABLE,0;
SET      mum_geschoss4.SPEED,4;
SET      mum_geschoss4.CAREFULLY,1;
SET      mum_geschoss4.TARGET,BULLET;
SET      mum_geschoss4.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss4.IF_NEAR,mum_geschoss_bumm2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss5 {
TEXTURE haha_tex;
HEIGHT 1;
DIST 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo5 {
SET      mum_geschoss5.SKILL1,1;
SET      mum_geschoss5.X,koordx;
SET      mum_geschoss5.Y,koordy;
SET      mum_geschoss5.REGION,koordr;
SET      mum_geschoss5.HEIGHT,koordz;
SET      mum_geschoss5.ANGLE,koorda;
SET      mum_geschoss5.TEXTURE,bulgreen_tex;
SET      mum_geschoss5.PASSABLE,0;
SET      mum_geschoss5.SPEED,4;
SET      mum_geschoss5.CAREFULLY,1;
SET      mum_geschoss5.TARGET,BULLET;
SET      mum_geschoss5.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss5.IF_NEAR,mum_geschoss_bumm2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss6 {
TEXTURE haha_tex;
HEIGHT 1;
DIST 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo6 {
SET      mum_geschoss6.SKILL1,1;
SET      mum_geschoss6.X,koordx;
SET      mum_geschoss6.Y,koordy;
SET      mum_geschoss6.REGION,koordr;
SET      mum_geschoss6.HEIGHT,koordz;
SET      mum_geschoss6.ANGLE,koorda;
SET      mum_geschoss6.TEXTURE,bulgreen_tex;
SET      mum_geschoss6.PASSABLE,0;
SET      mum_geschoss6.SPEED,4;
SET      mum_geschoss6.CAREFULLY,1;
SET      mum_geschoss6.TARGET,BULLET;
SET      mum_geschoss6.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss6.IF_NEAR,mum_geschoss_bumm2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss7 {
TEXTURE haha_tex;
HEIGHT 1;
DIST 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo7 {
SET      mum_geschoss7.SKILL1,1;
SET      mum_geschoss7.X,koordx;
SET      mum_geschoss7.Y,koordy;
SET      mum_geschoss7.REGION,koordr;
SET      mum_geschoss7.HEIGHT,koordz;
SET      mum_geschoss7.ANGLE,koorda;
SET      mum_geschoss7.TEXTURE,bulgreen_tex;
SET      mum_geschoss7.PASSABLE,0;
SET      mum_geschoss7.SPEED,4;
SET      mum_geschoss7.CAREFULLY,1;
SET      mum_geschoss7.TARGET,BULLET;
SET      mum_geschoss7.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss7.IF_NEAR,mum_geschoss_bumm2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR mum_geschoss8 {
TEXTURE haha_tex;
HEIGHT 1;
DIST 1;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION mum_geschoss_wo8 {
SET      mum_geschoss8.SKILL1,1;
SET      mum_geschoss8.X,koordx;
SET      mum_geschoss8.Y,koordy;
SET      mum_geschoss8.REGION,koordr;
SET      mum_geschoss8.HEIGHT,koordz;
SET      mum_geschoss8.ANGLE,koorda;
SET      mum_geschoss8.TEXTURE,bulgreen_tex;
SET      mum_geschoss8.PASSABLE,0;
SET      mum_geschoss8.SPEED,4;
SET      mum_geschoss8.CAREFULLY,1;
SET      mum_geschoss8.TARGET,BULLET;
SET      mum_geschoss8.IF_HIT,mum_geschoss_bumm;
SET      mum_geschoss8.IF_NEAR,mum_geschoss_bumm2;
}
///////////////////////////////////////////////////////////////////////////////////////////////
ACTION mum_geschoss_bumm {
PLAY_SOUND mumbumm_snd,0.6;
SET      MY.PASSABLE,1;
SET      MY.CAREFULLY,0;
SET      MY.SPEED,0;
SET      MY.TARGET,NULL;
SET      MY.TEXTURE,bulex_tex;
SET      MY.EACH_CYCLE,mum_geschoss_rest;
SET      MY.IF_HIT,NULL;
SET      MY.IF_NEAR,NULL;
}

SKILL palettenzaehler312 {}

ACTION mum_geschoss_bumm2 {
FADE_PAL pal_red,0;
SET      palettenzaehler312,0;
PLAY_SOUND mumbumm_snd,0.6;
SET      MY.PASSABLE,1;
SET      MY.CAREFULLY,0;
SET      MY.SPEED,0;
SET      MY.TARGET,NULL;
CALL     LL_rot_elf;
SET      MY.TEXTURE,bulex_tex;
SET      MY.EACH_CYCLE,mum_geschoss_rest;
SET      MY.IF_HIT,NULL;
SET      MY.IF_NEAR,NULL;
SET      EACH_TICK.9,getroffenauf_act;
}

PALETTE pal_white        {PALFILE <LL_wei.pcx>;}
ACTION getroffenauf_act  {ADD palettenzaehler312,0.15; FADE_PAL pal_white,palettenzaehler312; IF_ABOVE palettenzaehler312,0.4; SET EACH_TICK.9,getroffenaus_act;}
ACTION getroffenaus_act  {SET palettenzaehler312,0;   FADE_PAL pal_white,palettenzaehler312; SET EACH_TICK.9,NULL;}

ACTION mum_geschoss_rest {SET MY.TEXTURE,haha_tex; SET MY.EACH_CYCLE,NULL; SET MY.SKILL1,0;}

ACTION mum_feuerch {
SET SHOOT_RANGE,200;
SET SHOOT_FAC,1;
SHOOT MY;
IF_EQUAL RESULT,0;
 END;
IF_BELOW mum_geschoss.SKILL1,1;
 BRANCH mum_geschoss_wo;
IF_BELOW mum_geschoss2.SKILL1,1;
 BRANCH mum_geschoss_wo2;
IF_BELOW mum_geschoss3.SKILL1,1;
 BRANCH mum_geschoss_wo3;
IF_BELOW mum_geschoss4.SKILL1,1;
 BRANCH mum_geschoss_wo4;
IF_BELOW mum_geschoss5.SKILL1,1;
 BRANCH mum_geschoss_wo5;
IF_BELOW mum_geschoss6.SKILL1,1;
 BRANCH mum_geschoss_wo6;
IF_BELOW mum_geschoss7.SKILL1,1;
 BRANCH mum_geschoss_wo7;
IF_BELOW mum_geschoss8.SKILL1,1;
 BRANCH mum_geschoss_wo8;
}





//+++ZUSTAENDE+++/////////////////////////////////////////////////////////////
WAY thronsaal_way;
WAY dunkelgang_way;
WAY magierstube_way;
WAY schlafzimmer_way;

SKILL welchersound        {}
SKILL erstemal11          {VAL 11;}
SKILL zaehler7            {}


ACTION groar {
IF_ABOVE        MY.DISTANCE,120;
 END;
ADD             zaehler7,1;
IF_BELOW        zaehler7,100;
 END;
PLAY_SOUND      mum2_snd,0.45;
SET             zaehler7,0;
}

ACTION mum_patr1 {SET MY.IF_ARRIVED,treppen; SET MY.TEXTURE,mum_gehen_tex; SET MY.SPEED,0.3; SET MY.VSPEED,0; SET MY.TARGET,thronsaal_way;    SET MY.DIST,50; SET MY.IF_NEAR,mum_angriff; SET MY.IF_FAR,NULL; SET MY.IF_HIT,mum_pruefen; SET MY.EACH_TICK,groar; SET MY.EACH_CYCLE,NULL;}
ACTION mum_patr2 {SET MY.IF_ARRIVED,treppen; SET MY.TEXTURE,mum_gehen_tex; SET MY.SPEED,0.3; SET MY.VSPEED,0; SET MY.TARGET,dunkelgang_way;   SET MY.DIST,50; SET MY.IF_NEAR,mum_angriff; SET MY.IF_FAR,NULL; SET MY.IF_HIT,mum_pruefen; SET MY.EACH_TICK,groar; SET MY.EACH_CYCLE,NULL;}
ACTION mum_patr3 {SET MY.IF_ARRIVED,treppen; SET MY.TEXTURE,mum_gehen_tex; SET MY.SPEED,0.3; SET MY.VSPEED,0; SET MY.TARGET,magierstube_way;  SET MY.DIST,50; SET MY.IF_NEAR,mum_angriff; SET MY.IF_FAR,NULL; SET MY.IF_HIT,mum_pruefen; SET MY.EACH_TICK,groar; SET MY.EACH_CYCLE,NULL;}
ACTION mum_patr4 {SET MY.IF_ARRIVED,treppen; SET MY.TEXTURE,mum_gehen_tex; SET MY.SPEED,0.3; SET MY.VSPEED,0; SET MY.TARGET,schlafzimmer_way; SET MY.DIST,50; SET MY.IF_NEAR,mum_angriff; SET MY.IF_FAR,NULL; SET MY.IF_HIT,mum_pruefen; SET MY.EACH_TICK,groar; SET MY.EACH_CYCLE,NULL;}

ACTION mum_warten {
SET             hilfe_o_treffer,0;
SET		MY.TEXTURE,mum_warten_tex;
SET             MY.SPEED,0;
SET		MY.VSPEED,0;
SET		MY.TARGET,NULL;
SET		MY.DIST,50;
SET		MY.IF_NEAR,mum_angriff;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,mum_pruefen;
SET		MY.EACH_TICK,NULL;
SET		MY.EACH_CYCLE,NULL;
}

ACTION mum_pruefen {
IF_EQUAL	hilfe_o_treffer,1;
GOTO mum_hilferuf;

ADD		 MY.SKILL1,1;
IF_ABOVE	MY.SKILL1,6;
 BRANCH	         mum_sterben;
IF_ABOVE	MY.SKILL1,4;
 BRANCH	         mum_flucht;
IF_ABOVE	MY.SKILL1,2;
 BRANCH	         mum_weichen;
BRANCH		mum_angriff;

mum_hilferuf:
SET             hilfe_o_treffer,0;
BRANCH          mum_angriff;
}

ACTION mum_angriff {
IF_EQUAL        MY.SKILL2,0;
 CALL           ueberraschung;
RANDOMIZE       erstemal11,10;
IF_ABOVE        erstemal11,6;
 CALL            ueberraschung;

SET             mum_gerade_zaehler,0;
SET             MY.SENSITIVE,0;
SET             MY.IF_ARRIVED,treppen;
SET             MY.DIST,50;
SET		MY.TEXTURE,mum_atak_tex;
SET		MY.SPEED,0.28;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,FOLLOW;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,mum_pruefen;
SET		MY.EACH_TICK,NULL;
SET		MY.EACH_CYCLE,mum_magie;
}

ACTION ueberraschung {
SET MY.SKILL2,1;
RANDOMIZE welchersound,2;
IF_BELOW  welchersound,1; GOTO label892;
IF_BELOW  welchersound,2; GOTO label893;
label892: PLAY_SOUND mum3_snd,0.55; END;
label893: PLAY_SOUND mum4_snd,0.55; END;
}

ACTION mum_weichen {
IF_ABOVE        MY.DISTANCE,29;
 BRANCH         mum_angriff;
SET             MY.IF_ARRIVED,treppen;
SET             hilfe_o_treffer,0;
SET             MY.DIST,30;
SET		MY.TEXTURE,mum_atak_tex;
SET	 	MY.SPEED,0.5;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,REPEL;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,mum_angriff;
SET		MY.IF_HIT,mum_pruefen;
SET		MY.EACH_TICK,NULL;
SET		MY.EACH_CYCLE,mum_magie;
}

ACTION mum_magie {
RULE            koordx = MY.X;
RULE            koordy = MY.Y;
RULE            koordz = THERE.FLOOR_HGT + 2.5;
RULE            koorda = MY.ANGLE;
SET             koordr,MY.REGION;
CALL            mum_feuerch;
IF_ABOVE        RANDOM,0.55;
 BRANCH           mum_rechtsolinks;
}

ACTION mum_rechtsolinks {
SET             MY.SENSITIVE,1;
RANDOMIZE       rand1,10;
IF_ABOVE        rand1,5;
 BRANCH         mum_links;
IF_ABOVE        rand1,0;
 BRANCH         mum_rechts;
}

ACTION mum_rechts {
ADD		MY.ANGLE,1.57;
SET             MY.IF_ARRIVED,treppen;
SET		MY.TEXTURE,mum_gehen_tex;
SET		MY.SPEED,0.32;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,MOVE;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,mum_angriff;
SET		MY.EACH_TICK,mum_geradezaehler;
SET		MY.EACH_CYCLE,NULL;
}

ACTION mum_links {
ADD		MY.ANGLE,4.71;
SET             MY.IF_ARRIVED,treppen;
SET		MY.TEXTURE,mum_gehen_tex;
SET		MY.SPEED,0.32;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,MOVE;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,mum_angriff;
SET		MY.EACH_TICK,mum_geradezaehler;
SET		MY.EACH_CYCLE,NULL;
}

ACTION mum_geradezaehler {
ADD             mum_gerade_zaehler,1;
IF_ABOVE        mum_gerade_zaehler,18;
 GOTO           mum_sprung0;
END;
mum_sprung0:
BRANCH          mum_angriff;
}

ACTION mum_fluchtausweich {
IF_ABOVE        RANDOM,0.45;
 END;
SET             MY.SENSITIVE,1;
RANDOMIZE       rand1,10;
IF_ABOVE        rand1,5;
 BRANCH         mum_fluchtlinks;
IF_ABOVE        rand1,0;
 BRANCH         mum_fluchtrechts;
}

ACTION mum_fluchtrechts {
ADD		MY.ANGLE,1.57;
SET             MY.IF_ARRIVED,treppen;
SET		MY.TEXTURE,mum_gehen_tex;
SET		MY.SPEED,0.7;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,MOVE;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,mum_flucht;
SET		MY.EACH_TICK,mum_fluchtgeradezaehler;
SET		MY.EACH_CYCLE,NULL;
}

ACTION mum_fluchtlinks {
ADD		MY.ANGLE,4.71;
SET             MY.IF_ARRIVED,treppen;
SET		MY.TEXTURE,mum_gehen_tex;
SET		MY.SPEED,0.7;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,MOVE;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,mum_flucht;
SET		MY.EACH_TICK,mum_fluchtgeradezaehler;
SET		MY.EACH_CYCLE,NULL;
}

ACTION mum_fluchtgeradezaehler {
ADD             mum_gerade_zaehler,1;
IF_ABOVE        mum_gerade_zaehler,8;
 GOTO           mum_sprung0;
END;
mum_sprung0:
BRANCH          mum_flucht;
}


ACTION mum_flucht {
SET             MY.SENSITIVE,0;
SET             mum_gerade_zaehler,0;
IF_ABOVE        MY.DISTANCE,59;
 BRANCH         mum_warten;
SET             MY.IF_ARRIVED,treppen;
SET             hilfe_o_treffer,0;
SET             MY.DIST,60;
SET		MY.TEXTURE,mum_gehen_tex;
SET		MY.SPEED,0.77;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,1;
SET		MY.TARGET,REPEL;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,mum_hilfeholen;
SET		MY.IF_HIT,mum_aua;
SET		MY.EACH_TICK,NULL;
SET		MY.EACH_CYCLE,mum_fluchtausweich;
}

ACTION mum_hilfeholen {
SET             hilfe_o_treffer,1;
SET		SHOOT_FAC,1;
SET		SHOOT_RANGE,100;
EXPLODE	        MY;
IF_EQUAL	HIT_MINDIST,0;
 BRANCH mum_warten;
BRANCH          mum_angriff;
}

ACTION mum_aua {
IF_EQUAL	hilfe_o_treffer,0;
 ADD		 MY.SKILL1,1;
IF_ABOVE	MY.SKILL1,6;
 BRANCH	        mum_sterben;
IF_ABOVE	MY.SKILL1,4;
 BRANCH	        mum_fluchtaua;
IF_ABOVE	MY.SKILL1,2;
 BRANCH	        mum_weichen;
BRANCH		mum_angriff;
}

ACTION mum_fluchtaua {
IF_ABOVE        MY.DISTANCE,60;
 BRANCH         mum_hilfeholen;
IF_BELOW        MY.DISTANCE,10;
 BRANCH         mum_angriff;
BRANCH          mum_flucht;
}

ACTION mum_sterben {
SET             hilfe_o_treffer,0;
SET             MY.FRAGILE,0;
SET		MY.TEXTURE,mum_sterben_tex;
SET		MY.SPEED,0;
SET		MY.VSPEED,0;
SET		MY.CAREFULLY,0;
SET		MY.PASSABLE,1;
SET		MY.TARGET,NULL;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,NULL;
SET		MY.EACH_TICK,NULL;
SET		MY.EACH_CYCLE,mum_tod;
}

ACTION mum_tod {
SET             hilfe_o_treffer,0;
SET		MY.TEXTURE,mum_rest_tex;
SET		MY.PASSABLE,1;
SET		MY.TARGET,NULL;
SET		MY.IF_NEAR,NULL;
SET             MY.IF_FAR,NULL;
SET		MY.IF_HIT,NULL;
SET		MY.EACH_TICK,NULL;
SET		MY.EACH_CYCLE,NULL;
}

ACTION treppen {
SET             MY.GROUND,1;
RULE            mum_hoehe = MY.FLOOR_HGT - 0.1;
SET             MY.HEIGHT,mum_hoehe;
}

/////////////////////////////////////////////////////////////////////////////////////////
//+++ENDE+++/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

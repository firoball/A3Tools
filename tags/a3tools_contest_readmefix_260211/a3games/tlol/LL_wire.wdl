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


//+++SKILLS+++////////////////////////////////////////////////////////////////////////
SKILL  LL_1hoehe                  {}
SKILL  LL_feuerzaehler            {}
SKILL  rand747                    {}

//+++VD+++////////////////////////////////////////////////////////////////////////////

ACTION hmpf1_act {PLAY_SOUND hmpf_snd,0.6;}

ACTION  LL_achtungfeuer {
LL_sprung007:
CALL LL_feuerch;
SET IF_CTRL,NULL;
SET IF_LEFT,NULL;
WAITT 12;
IF_ABOVE KEY_CTRL,0;
 GOTO LL_sprung007;
IF_ABOVE MOUSE_LEFT,0;
 GOTO LL_sprung007;
SET IF_CTRL,LL_achtungfeuer;
SET IF_LEFT,LL_achtungfeuer;
}

ACTION LL_feuerch {
CALL LL_blau_drei;
IF_EQUAL untershoot,1;
 BRANCH hmpf1_act;
IF_EQUAL mana_leer_skill,1;
 BRANCH hmpf1_act;

IF_BELOW act_geschoss.SKILL1,1;
 BRANCH LL_peng;
IF_BELOW act_geschoss2.SKILL1,1;
 BRANCH LL_peng2;
IF_BELOW act_geschoss3.SKILL1,1;
 BRANCH LL_peng3;
IF_BELOW act_geschoss4.SKILL1,1;
 BRANCH LL_peng4;
IF_BELOW act_geschoss5.SKILL1,1;
 BRANCH LL_peng5;
IF_BELOW act_geschoss6.SKILL1,1;
 BRANCH LL_peng6;
IF_BELOW act_geschoss7.SKILL1,1;
 BRANCH LL_peng7;
IF_BELOW act_geschoss8.SKILL1,1;
 BRANCH LL_peng8;
}

//+++WAFFEN+++////////////////////////////////////////////////////////////////////////
BMAP    hihi_map          <platzh.pcx>  ,0,0,64,64;
TEXTURE hihi_tex          {SCALE_XY 2,2;   BMAPS hihi_map;}

ACTOR act_geschoss {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng {
PLAY_SOUND blam_snd,0.8;
SET      act_geschoss.SKILL1,1;
SET      act_geschoss.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss.HEIGHT,LL_1hoehe;
DROP     act_geschoss;
SET      act_geschoss.TEXTURE,bulred_tex;
SET      act_geschoss.PASSABLE,0;
SET      act_geschoss.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss.SPEED,4;
SET      act_geschoss.CAREFULLY,1;
SET      act_geschoss.TARGET,BULLET;
SET      act_geschoss.IF_HIT LL_bumm;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ACTOR act_geschoss2 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng2 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss2.SKILL1,1;
SET      act_geschoss2.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss2.HEIGHT,LL_1hoehe;
DROP     act_geschoss2;
SET      act_geschoss2.TEXTURE,bulred_tex;
SET      act_geschoss2.PASSABLE,0;
SET      act_geschoss2.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss2.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss2.SPEED,4;
SET      act_geschoss2.CAREFULLY,1;
SET      act_geschoss2.TARGET,BULLET;
SET      act_geschoss2.IF_HIT LL_bumm;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ACTOR act_geschoss3 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng3 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss3.SKILL1,1;
SET      act_geschoss3.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss3.HEIGHT,LL_1hoehe;
DROP     act_geschoss3;
SET      act_geschoss3.TEXTURE,bulred_tex;
SET      act_geschoss3.PASSABLE,0;
SET      act_geschoss3.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss3.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss3.SPEED,4;
SET      act_geschoss3.CAREFULLY,1;
SET      act_geschoss3.TARGET,BULLET;
SET      act_geschoss3.IF_HIT LL_bumm;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ACTOR act_geschoss4 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng4 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss4.SKILL1,1;
SET      act_geschoss4.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss4.HEIGHT,LL_1hoehe;
DROP     act_geschoss4;
SET      act_geschoss4.TEXTURE,bulred_tex;
SET      act_geschoss4.PASSABLE,0;
SET      act_geschoss4.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss4.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss4.SPEED,4;
SET      act_geschoss4.CAREFULLY,1;
SET      act_geschoss4.TARGET,BULLET;
SET      act_geschoss4.IF_HIT LL_bumm;
}

/////////////////////////////////////////////////////////////////////////////////////////
ACTOR act_geschoss5 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng5 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss5.SKILL1,1;
SET      act_geschoss5.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss5.HEIGHT,LL_1hoehe;
DROP     act_geschoss5;
SET      act_geschoss5.TEXTURE,bulred_tex;
SET      act_geschoss5.PASSABLE,0;
SET      act_geschoss5.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss5.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss5.SPEED,4;
SET      act_geschoss5.CAREFULLY,1;
SET      act_geschoss5.TARGET,BULLET;
SET      act_geschoss5.IF_HIT LL_bumm;
}
/////////////////////////////////////////////////////////////////////////////////////////
ACTOR act_geschoss6 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng6 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss6.SKILL1,1;
SET      act_geschoss6.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss6.HEIGHT,LL_1hoehe;
DROP     act_geschoss6;
SET      act_geschoss6.TEXTURE,bulred_tex;
SET      act_geschoss6.PASSABLE,0;
SET      act_geschoss6.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss6.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss6.SPEED,4;
SET      act_geschoss6.CAREFULLY,1;
SET      act_geschoss6.TARGET,BULLET;
SET      act_geschoss6.IF_HIT LL_bumm;
}
/////////////////////////////////////////////////////////////////////////////////////////
ACTOR act_geschoss7 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng7 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss7.SKILL1,1;
SET      act_geschoss7.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss7.HEIGHT,LL_1hoehe;
DROP     act_geschoss7;
SET      act_geschoss7.TEXTURE,bulred_tex;
SET      act_geschoss7.PASSABLE,0;
SET      act_geschoss7.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss7.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss7.SPEED,4;
SET      act_geschoss7.CAREFULLY,1;
SET      act_geschoss7.TARGET,BULLET;
SET      act_geschoss7.IF_HIT LL_bumm;
}
/////////////////////////////////////////////////////////////////////////////////////////
ACTOR act_geschoss8 {
TEXTURE hihi_tex;
HEIGHT 2;
SKILL1 0; //bereitschaft, oder beschaeftigt?
FLAGS GROUND, PASSABLE;
}

ACTION LL_peng8 {
PLAY_SOUND blam_snd,0.6;
SET      act_geschoss8.SKILL1,1;
SET      act_geschoss8.DIST,0;
RULE     LL_1hoehe = HERE.FLOOR_HGT + 2;
SET      act_geschoss8.HEIGHT,LL_1hoehe;
DROP     act_geschoss8;
SET      act_geschoss8.TEXTURE,bulred_tex;
SET      act_geschoss8.PASSABLE,0;
SET      act_geschoss8.ANGLE, PLAYER_ANGLE;
RULE     act_geschoss8.VSPEED = PLAYER_TILT * -1 - 0.035;
SET      act_geschoss8.SPEED,4;
SET      act_geschoss8.CAREFULLY,1;
SET      act_geschoss8.TARGET,BULLET;
SET      act_geschoss8.IF_HIT LL_bumm;
}
/////////////////////////////////////////////////////////////////////////////////////////

ACTION LL_bumm {
RANDOMIZE rand747,2;
IF_BELOW rand747,1;
 PLAY_SOUND bumm_snd,0.85;
IF_BELOW rand747,2;
 PLAY_SOUND bumm2_snd,0.8;
SET      MY.PASSABLE,1;
SET      MY.CAREFULLY,0;
SET      MY.SPEED,0;
SET      MY.TARGET,NULL;
SET      SHOOT_RANGE,4;
SET      SHOOT_FAC,1;
EXPLODE  MY;
IF_ABOVE RESULT,0;
 CALL LL_rot_drei;
SET      MY.TEXTURE,bulex_tex;
SET      MY.EACH_CYCLE,LL_rest;
SET      MY.IF_HIT,NULL;
}
ACTION LL_rest {SET  MY.TEXTURE,hihi_tex; SET MY.EACH_CYCLE,NULL; SET MY.SKILL1,0;}

/////////////////////////////////////////////////////////////////////////////////////////
//+++ENDE+++/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////




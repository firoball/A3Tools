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



//+++SKILLS+++////////////////////////////////////////////////////////////////////////////
SKILL Mode_Gehen	 {VAL 1;}
SKILL Mode_Schwimmen	 {VAL 2;}
SKILL Mode_Tauchen	 {VAL 3;}

SKILL untershoot         {}
SKILL luft_skill         {}
SKILL moving	         {VAL 0;}
SKILL force 	         {}
SKILL drift_x 	         {VAL 0;}
SKILL drift_y          	 {VAL 0;}
SKILL gravity         	 {VAL -2;}
SKILL strength	         {VAL 0.1;}
SKILL fric		 {VAL 0.2;}
SKILL mass 		 {VAL 1;}
SKILL fric_air      	 {VAL 0.2;}
SKILL duck_val	         {VAL 0;}
SKILL my_size	         {VAL 4;}
SKILL WALK_PERIOD	 {VAL 7.5;}
SKILL WALK_TIME	         {VAL 14;}
SKILL WAVE_PERIOD	 {VAL 11;}
SKILL jump_phase	 {VAL 0;}
SKILL PLAYER_ARC	 {MIN 0.5; MAX 2;}
SKILL PLAYER_TILT	 {MIN -1.35; MAX 1.35;}
SKILL wave_str		 {VAL 0;}
SKILL float_str	         {VAL 0;}
SKILL duck_str		 {VAL 0.5;}
SKILL depth		 {MAX 3;}
SKILL PLAYER_DEPTH       {MAX 3;}
SKILL underwater	 {VAL 0;}
SKILL PLAYER_SIZE	 {MIN 0; VAL 4;}
SKILL PLAYER_CLIMB       {VAL 2.5;}
SKILL booster            {VAL 1; }
SKILL walk_accell        {VAL 1; }
SKILL tilt_decrease      {VAL 0.8;}
SKILL max_player_tilt_p  {VAL 0.35;}
SKILL max_player_tilt_n	 {VAL -0.35;}
SKILL player_speed_sqr   {VAL 0;}


//+++CHECK_OUT+++///////////////////////////////////////////////////////////////////////////
ACTION init_move {
	SET	moving, Mode_Gehen;
	CALL 	set_moving;
}

//+++BASIS_BEWEGUNGSAKTIONEN+++//////////////////////////////////////////////////////////////
ACTION move_me {
start:

// PLAYER_SIZE setzen
IF_EQUAL  moving, Mode_Gehen;     RULE PLAYER_SIZE = my_size + 0.15*WALK;
IF_EQUAL  moving, Mode_Schwimmen; RULE PLAYER_SIZE = 1 + 0.12*WAVE;
IF_EQUAL  moving, Mode_Tauchen;   RULE PLAYER_SIZE = 1;


IF_EQUAL  moving, Mode_Gehen;     RULE PLAYER_SIZE = PLAYER_SIZE-PLAYER_DEPTH;

no_waten:
IF_NEQUAL moving, Mode_Schwimmen; GOTO no_swim;
IF_ABOVE  PLAYER_DEPTH,1.5; GOTO no_water;
CALL		set_walking;
GOTO		start;
no_swim:

IF_NEQUAL moving, Mode_Gehen; GOTO no_water;
IF_BELOW  PLAYER_DEPTH,2.5; GOTO	no_water;
CALL	  set_swimming;
GOTO	  start;

no_water:
IF_EQUAL  MOUSE_MIDDLE,0; GOTO no_mouse;
SET FORCE_AHEAD,KEY_SENSE;

no_mouse:
SET booster, 1;
SET   INERTIA,mass;
RULE  FRICTION = fric + 0.1*depth;
RULE  force = ( strength + wave_str*WAVE) * booster * (FORCE_AHEAD*PLAYER_COS - 0.5*FORCE_STRAFE*PLAYER_SIN)+ drift_x;
ACCEL PLAYER_VX,force;
RULE  force = (strength + wave_str*WAVE) * booster * (FORCE_AHEAD*PLAYER_SIN + 0.5*FORCE_STRAFE*PLAYER_COS)+ drift_y;
ACCEL		PLAYER_VY,force;

// Drehen
SET FRICTION,0.5;
IF_NEQUAL moving, Mode_Gehen; SET FRICTION,0.85;
RULE 	  force = 0.056*FORCE_ROT;
ACCEL	  PLAYER_VROT,force;

// PLAYER_VZ setzen
RULE      force = gravity + float_str*FORCE_UP;
SET	  FRICTION,fric_air;
IF_ABOVE  PLAYER_HGT,0; GOTO airborne;
SET	  FRICTION,0.98;
RULE	  force = force - 0.2*PLAYER_HGT;
airborne:
ACCEL	  PLAYER_VZ,force;

// Ducken
RULE duck_val = 0.6*duck_val;
IF_EQUAL moving, Mode_Schwimmen; GOTO duck;
IF_ABOVE FORCE_UP,0;     	 GOTO no_duck;

duck:
RULE duck_val = 0.8*duck_val;
RULE duck_val = duck_val + duck_str*FORCE_UP;

no_duck:
RULE PLAYER_SIZE = PLAYER_SIZE + duck_val;

// Springen
IF_NEQUAL moving, Mode_Gehen; GOTO no_jump;
IF_ABOVE  jump_phase,0;	      GOTO jump_1;
IF_BELOW  FORCE_UP, 0.1;      GOTO no_jump;
SET jump_phase,1;

jump_1:
IF_ABOVE jump_phase,1; GOTO jump_2;
RULE	 duck_val = duck_val - 0.5;
IF_BELOW duck_val,-0.7;	SET jump_phase,2;
GOTO	 no_jump;

jump_2:
IF_ABOVE jump_phase,2; GOTO jump_3;
SET  duck_val,0;
RULE PLAYER_Z = FLOOR_HGT + my_size;
SET  PLAYER_VZ,0.25;
SET  jump_phase,3;
GOTO no_jump;

jump_3:
IF_ABOVE PLAYER_VZ,0;  GOTO no_jump;
IF_ABOVE PLAYER_HGT,0; GOTO no_jump;
SET jump_phase,0;

no_jump:
RULE player_speed_sqr = PLAYER_VX*PLAYER_VX + PLAYER_VY * PLAYER_VY;
IF_NEQUAL tilt_decrease,1;                GOTO calc_tilt;
IF_ABOVE  PLAYER_TILT, max_player_tilt_p; GOTO check_speed_tilt;
IF_ABOVE  PLAYER_TILT, max_player_tilt_n; GOTO decr_tilt;

check_speed_tilt:
IF_ABOVE  player_speed_sqr, 0.4; GOTO decr_tilt;
IF_NEQUAL PLAYER_VZ, 0;          GOTO decr_tilt;
	                         GOTO calc_tilt;

decr_tilt:
SET tilt_decrease, 0.8;

calc_tilt:
RULE PLAYER_TILT = tilt_decrease * PLAYER_TILT + 0.3 * FORCE_TILT - 0.3*float_str*FORCE_UP;
IF_ABOVE player_speed_sqr, 0;            SKIP 4;
IF_ABOVE PLAYER_TILT, max_player_tilt_p; SET tilt_decrease,1;
IF_BELOW PLAYER_TILT, max_player_tilt_n; SET tilt_decrease, 1;

IF_EQUAL moving, Mode_Schwimmen;         RULE PLAYER_TILT = PLAYER_TILT + 0.01 * WAVE;
IF_EQUAL moving, Mode_Tauchen;           GOTO no_htilt;
IF_ABOVE jump_phase,0;    		 GOTO no_htilt;
IF_BELOW tilt_decrease, 1;	         RULE PLAYER_TILT = PLAYER_TILT + 0.03 * (PLAYER_HGT + 0.3);

no_htilt:
RULE PLAYER_ARC = PLAYER_ARC - 0.1;
RULE PLAYER_ARC = PLAYER_ARC + 0.1;
}

//+++BTC_AKTIONEN+++////////////////////////////////////////////////////////////////////
ACTION set_walking {
SET untershoot,0;
SET moving, Mode_Gehen;
SET fric,0.2;
SET strength,0.215;
SET wave_str,0;
SET float_str,0;
SET duck_str,0.5;
SET fric_air,0.04;
SET gravity,-0.13;
SET EACH_TICK.16,move_me;
}

ACTION set_swimming {
SET untershoot,1;
SET fric,0.3; 
SET moving, Mode_Schwimmen;
SET strength,0.1;
SET wave_str,0.03;
SET float_str,0;
SET duck_str,0.55; //0.2
SET fric_air,0.3; //0.5
SET gravity,-0.05;
SET EACH_TICK.16,move_me;
}

ACTION set_diving {
SET untershoot,1;
SET fric,0.4;
SET moving, Mode_Tauchen;
SET strength,0.18;
SET wave_str,0.03;
SET float_str,0.05;
SET duck_str,0;
SET fric_air,0.1;
SET gravity,-0.003;
SET EACH_TICK.16,move_me;
}

ACTION set_moving {
IF_EQUAL moving,0;		 END;
IF_EQUAL moving, Mode_Gehen;	 BRANCH	set_walking;
IF_EQUAL moving, Mode_Schwimmen; BRANCH	set_swimming;
IF_EQUAL moving, Mode_Tauchen;	 BRANCH	set_diving;
}

ACTION stop_moving {
SET IF_CTRL,NULL;
SET PLAYER_VX,0;
SET PLAYER_VY,0;
SET PLAYER_VZ,0;
SET PLAYER_VROT,0;
}


//+++TAUCHEN+++///////////////////////////////////////////////////////////////////////
PALETTE pal_blue       {PALFILE       <LL_blue.pcx>;}

ACTION set_underwater  {FADE_PAL pal_blue,0.8;}
ACTION set_overwater   {FADE_PAL pal_blue,0;}

ACTION regio_dive {
IF_EQUAL underwater,1; END;
CALL luft_act;
SET  underwater,1;
RULE my_size = my_size-0.2;
RULE PLAYER_SIZE = PLAYER_SIZE-0.2;
RULE PLAYER_Z = PLAYER_Z-0.2;
CALL set_underwater;
CALL set_diving;
CALL unterwassermeldung_act;
}

ACTION regio_arise {
IF_EQUAL underwater,0; END;
CALL luftan_act;
SET  underwater,0;
RULE my_size = my_size+0.2;
RULE PLAYER_SIZE = PLAYER_SIZE+0.2;
RULE PLAYER_Z = PLAYER_Z+0.2;
CALL set_overwater;
CALL set_swimming;
}


ACTION luft_act    {SET luft_skill,0; SET EACH_TICK.13,luftaus_act;}
ACTION luftaus_act {ADDT luft_skill,1; IF_ABOVE luft_skill,590; CALL zieh_ab;}
ACTION luftan_act  {SET EACH_TICK.13,NULL; SET luft_skill,0;}

/////////////////////////////////////////////////////////////////////////////////////
//+++ E N D E +++////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////





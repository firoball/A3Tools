//////////////////////////////////////////////////////
// Bewegungsmodul
//////////////////////////////////////////////////////
//jc 21.09.	"Hoppeln" auf Rampen raus
//jc 25.09. Blick auf/ab auf Rampen
//jc 27.09.	diverse Verbesserungen
//mr 01.10  set_stop/stop_player
//mr 03.10  nicht auf wasser laufen (just_surf)
//mr 10.10  nicht auf wasser fahren (PLAYER_HGT + floor_depth)
//mr 13.10  VROT empfintlichkeit geringf. kleiner (r_ease)
//////////////////////////////////////////////////////
SKILL	val1			{}
SKILL	val2			{}
SKILL debug_1		{ VAL 0;	}
SKILL debug_2		{ VAL 0;	}
SKILL debug_3		{ VAL 0;	}
SKILL debug_4		{ VAL 0;	}
//////////////////////////////////////////////////////
SKILL PLAYER_ARC		{ VAL 1.1;			}
SKILL PLAYER_SIZE		{ MIN 0.0; VAL 3.5; MAX 4;	}
/*
SKILL depth			{ MAX 4; }		// Eintauchtiefe des Players
SKILL PLAYER_DEPTH {MIN 0; MAX 3.5; }		// Eintauchtiefe des Players
*/
SKILL WALK_PERIOD		{ VAL 5;	}
SKILL WALK_TIME		{ VAL 10;	}
SKILL WAVE_PERIOD		{ VAL 16;	}
SKILL PLAYER_TILT		{ MIN -1.35; MAX 1.35;	}
SKILL PLAYER_VX		{ MIN -3; MAX 3;	}
SKILL PLAYER_VY		{ MIN -3; MAX 3;	}

SKILL ahead_mouse		{ VAL 0; MIN 0; MAX 1; }
SKILL up_joy			{ VAL 0; MIN 0; MAX 1; }

#SKILL delta_speed		{ }
SKILL thrust			{ }
SKILL ahead_force		{ MAX	4; MIN -4;	}
SKILL ahead_speed		{ }
SKILL strafe_speed	{ MIN -2; MAX 2;	}
SKILL tilt_speed		{ MIN -1; MAX 1;	}
//jc 25.09.
SKILL slope_tilt		{ MIN -1; MAX 1;	}
SKILL free_hgt			{ MIN -30;	MAX 2.0;	}
SKILL duck_val			{ MIN -1.5; MAX 0;	}
SKILL gnd_ease			{ MIN -0.2; MAX 0.2; 	}

SKILL my_size			{ MIN 0.1; VAL 3.5;	}
SKILL old_frot			{ VAL 0;	}
SKILL drift_x			{ VAL 0;	}
SKILL drift_y			{ VAL 0;	}
SKILL drift_z			{ VAL 0;	}
SKILL rocket_up		{ VAL 0; MIN 0; }
SKILL moving			{ VAL 0; }
SKILL underwater		{ VAL 0; }

SKILL a_fric			{ MIN 0;	MAX 0.99; VAL 0.7;	}
SKILL a_ease			{ VAL 0.2;	}
SKILL s_fric			{ MIN 0;	MAX 0.99; VAL 0.75;	}
SKILL s_ease			{ VAL 0.2;	}
SKILL r_fric			{ MIN 0;	MAX 0.99; VAL 0.5;	}
SKILL r_ease			{ VAL 0.07;	}
#SKILL t_fric			{ MIN 0;	MAX 0.99; VAL 0.3;	}
SKILL t_ease			{ VAL 0.15;	}
SKILL i_fric			{ MIN 0;	MAX 0.99; VAL 0.6;	}
SKILL	imp_fac 			{ VAL 1; }
SKILL ht_ease			{ VAL 0.04;	}
SKILL v_ease			{ VAL 0.10;	}
SKILL v_fric			{ MIN -1; MAX 1;	}
SKILL hu_ease			{ VAL -0.2;	}
SKILL air_fric			{ MIN 0.01;	MAX 0.99; VAL 0.02;	}
SKILL gnd_fric			{ MIN 0.01;	MAX 0.99; VAL 0.95;	}
SKILL stiff				{ VAL -0.3;		}
SKILL grav				{ MAX 0; VAL -0.12;	}
#SKILL wfac				{ VAL 0.3; 	}
SKILL wave_fac			{ MIN 0; MAX 0.2;	}
SKILL rueck				{ VAL 1; MIN 0; MAX 1;	}
SKILL v_rueck			{ VAL 0.6;	}
#SKILL my_tilt			{ VAL 0; 	}
SKILL xy_fric			{ MIN 0;	MAX 0.99; VAL 0.75;	}
#SKILL dt_ease			{ VAL 0.08;	}
#SKILL a_ease			{ VAL -0.03;	}

SKILL god				{ VAL 0;		}
SKILL stop				{ VAL 1;		}

SKILL airborne			{ MIN 0; MAX 1;	}
SKILL undergnd			{ MIN 0; MAX 1;	}
SKILL old_ugnd			{ MIN 0; MAX 1;	}
SKILL leave_ugnd		{ MIN 0; MAX 1;	}
SKILL no_jump			{ MIN 0; MAX 1;	}

SKILL jump_count 		{ VAL 0;	}
SKILL duck	 			{ MIN -0.6; MAX 0;}
SKILL just_surf         { VAL 0; } //mr0310

SKILL boolean			{ VAL 100;		}
SKILL mboolean			{ VAL -100;	}
SKILL minus				{ VAL -1;		}
SKILL half				{ VAL 0.5;		}
SKILL abs1				{ MIN 0;	MAX 1;	}
SKILL abs2				{ MIN 0;	MAX 1;	}

SKILL	speed_fac		{ VAL 0; MIN 0; MAX 0.99; }
SKILL	one_corr			{ VAL 1; MIN 1; }
SKILL	timefac_1		{ VAL 1; MIN 1; }
SKILL	timefac_2		{ VAL 1; MIN 1; }
SKILL	timefac_3		{ VAL 1; MIN 1; }
SKILL	timefac_4		{ VAL 1; MIN 1; }
SKILL	time_dec			{ VAL -1;	MIN -5;	}
SKILL	random_1			{ VAL 1;	}
SKILL	random_2			{ VAL 1;	}
SKILL	random_3			{ VAL 1;	}
SKILL	random_4			{ VAL 1;	}

SKILL	sign_rot	{ MIN -0.5; MAX 0.5; }

SKILL	floor_depth		{ MIN 0; MAX 3.5; }	// max < playersize!

//////////////////////////////////////////////////////////////
ACTION dive {
	RULE wave_fac		= boolean*ahead_force;
	RULE ahead_speed	= a_fric*ahead_speed + wave_fac*WAVE + a_ease*ahead_force;
	RULE PLAYER_VROT	= r_fric*PLAYER_VROT + r_ease*FORCE_ROT;
	RULE PLAYER_VX	= xy_fric*PLAYER_VX + PLAYER_COS*ahead_speed;
	RULE PLAYER_VY	= xy_fric*PLAYER_VY + PLAYER_SIN*ahead_speed;

	RULE airborne		= 3*PLAYER_HGT;
	RULE undergnd		= mboolean*PLAYER_HGT+1;
	RULE gnd_ease		= stiff*PLAYER_HGT;
	RULE v_fric		= airborne*air_fric + undergnd*gnd_fric;
	RULE PLAYER_VZ	= PLAYER_VZ + gnd_ease*undergnd + v_ease*FORCE_UP;
	RULE PLAYER_VZ	= v_fric*PLAYER_VZ;

	RULE PLAYER_SIZE	= my_size;

	RULE tilt_speed	= 0.3*tilt_speed + t_ease*FORCE_TILT;
	RULE PLAYER_TILT	= 0.8*PLAYER_TILT + tilt_speed + hu_ease*PLAYER_VZ;
}

ACTION swim {
	RULE wave_fac		= boolean*ahead_force;
	RULE ahead_speed	= a_fric*ahead_speed + wave_fac*WAVE + a_ease*ahead_force;
	RULE PLAYER_VROT	= r_fric*PLAYER_VROT + r_ease*FORCE_ROT;
	RULE PLAYER_VX	= xy_fric*PLAYER_VX + PLAYER_COS*ahead_speed;
	RULE PLAYER_VY	= xy_fric*PLAYER_VY + PLAYER_SIN*ahead_speed;

	RULE airborne		= boolean*PLAYER_HGT + mboolean*my_size;
	RULE undergnd		= mboolean*PLAYER_HGT + boolean*my_size + 1;
	RULE v_fric		= 0.8*airborne + 0.02*undergnd;
	RULE gnd_ease		= -6*PLAYER_HGT;
	RULE duck 			= 0.3*FORCE_UP;
	RULE PLAYER_VZ	= PLAYER_VZ +  gnd_ease*undergnd + grav*airborne;
	RULE PLAYER_VZ	= v_fric*PLAYER_VZ + 0.02*WAVE + 0.05*FORCE_UP + duck;

	RULE PLAYER_SIZE	= my_size;

	RULE tilt_speed	= 0.3*tilt_speed + t_ease*FORCE_TILT + ht_ease*PLAYER_HGT;
	RULE PLAYER_TILT	= 0.8*PLAYER_TILT + tilt_speed + hu_ease*PLAYER_VZ;
}

///////////////////////////////////////////////////////////

ACTION	common {
	RULE random_1	= random_2;
	RULE random_2	= random_3;
	RULE random_3	= random_4;
	RULE random_4	= RANDOM;
	RULE time_dec	= -TIME_CORR;
	RULE one_corr	= TIME_FAC;
	RULE timefac_1	= TIME_FAC;
	RULE timefac_2	= TIME_FAC + TIME_FAC;
	RULE timefac_3	= TIME_FAC + TIME_FAC + TIME_FAC;
	RULE timefac_4	= TIME_FAC + TIME_FAC + TIME_FAC + TIME_FAC;

    // mr1010 PLAYER_HGT + floor_depth sonst kann
    //                      Player auf Wasser laufen !!!
	RULE airborne	= 4*(PLAYER_HGT + floor_depth*0.1);			// sonst sinkt Player in Boden ein
	RULE undergnd	= -5*(PLAYER_HGT + floor_depth*0.1) + 1.5;	// Reibung setzt ein unter 0.3 Steps
	RULE gnd_ease	= stiff*(PLAYER_HGT + floor_depth*0.1);
}

SKILL	foot_hgt			{ }
SKILL	surf_hgt			{ }


ACTION swimming {
	SET	ahead_force,FORCE_AHEAD;
	CALL	common;
	CALL	swim;
}
ACTION diving {
	SET	ahead_force,FORCE_AHEAD;
	CALL	common;
	CALL	dive;
}

ACTION flying	{
	RULE 		drift_z=0.15*FORCE_UP;
	BRANCH	driving;
}

ACTION rocketing	{
	RULE		up_joy = up_joy + 0.25*KEY_JOY4;
	IF_EQUAL	KEY_JOY4,0;
		SET	up_joy,0;
	IF_EQUAL KEY_SHIFT,1;
		ADD	up_joy,up_joy;
	IF_ABOVE	KEY_JOY4,0;
		SET	FORCE_UP,up_joy;

	IF_BELOW	FORCE_UP,0;
		SET	rocket_up,0;
	IF_EQUAL	FORCE_UP,0;
		RULE	rocket_up = rocket_up - 0.05*TIME_CORR;
	IF_ABOVE	FORCE_UP,0;
		RULE	rocket_up = rocket_up + 0.1*TIME_CORR + 0.1*RANDOM;

	IF_ABOVE	rocket_up,1;
		SET	rocket_up,1;

	IF_EQUAL	HERE.FLAG8,1;
		GOTO	no_uwreg;
	IF_BELOW	PLAYER_HGT,0.4;
		RULE	rocket_up=0.95*rocket_up;	// triebwerk bei bodenkontakt drosseln
no_uwreg:

	IF_BELOW	FORCE_UP,0.1;
		GOTO	no_addrock;

	IF_BELOW PLAYER_VZ,-0.5;
		RULE	rocket_up = 2*rocket_up;	// triebwerk in freiem Fall wirksamer

#	IF_EQUAL	underwater,1;
#		RULE	rocket_up = 1.3*rocket_up;	// triebwerk unter wasser wirksamer
no_addrock:

	CALL		driving;
}


ACTION walking {
	SET		rocket_up,0;

	IF_BELOW	jump_count,1;
		GOTO	no_jump;

	IF_BELOW	jump_count,2;
		SET	FORCE_UP,-0.5;
	IF_ABOVE	jump_count,3;
		SET	rocket_up,1;
	IF_ABOVE	jump_count,6;
		SET	rocket_up,0;

	ADD		jump_count,1;
	IF_BELOW	jump_count,16;		// abgelaufen?
		GOTO	jumping;
no_jump:
	SET		jump_count,0;
	IF_ABOVE	FORCE_UP,0.2;
		SET	jump_count,1;
	IF_ABOVE	PLAYER_HGT,0.5;	// noch in der Luft?
		SET	jump_count,0;
jumping:

	CALL		driving;

    // mr0310
    IF_EQUAL    just_surf, 1;
    END;

	RULE		duck 		= boolean*FORCE_UP;
	RULE		duck_val	= 0.8*duck_val + duck;
	RULE		PLAYER_SIZE	= duck_val + 0.2*WALK + my_size;
}

ACTION driving		{
	SET		PLAYER_SIZE,my_size;
	SET		floor_depth.MAX,PLAYER_SIZE;
	SET		floor_depth,0;
    SET         just_surf, 0; // mr0310
	IF_EQUAL	HERE.FLAG8,0;
		GOTO 	no_surf;			// Wasser-Region?
	IF_EQUAL	HERE.BASE,1;
		GOTO 	no_surf;			// BASE -> kein reinfallen
	IF_EQUAL	underwater,1;
		GOTO	no_surf;			// Player unter Wasser?
	SET		floor_depth,0;
	IF_ABOVE	PLAYER_HGT,5;	// nicht 3, da das bei tiefem wasser bei player_size==0 der fall ist.
		GOTO 	no_surf;			// Player ueber Oberflaeche
	RULE		floor_depth	= HERE.SKILL5 - HERE.SKILL1;
    //                      = FLOOR_HGT_OW - FLOOR_HGT_UW
	RULE		PLAYER_SIZE	= my_size - floor_depth;	// fuer Kollisionserkennung
	RULE		xy_fric		= 0.75 + 0.1*floor_depth;
	RULE		air_fric		= 0.03 + 0.1*floor_depth;

    SET         just_surf, 1; // mr0310
no_surf:

	RULE		ahead_mouse = ahead_mouse + 0.25*MOUSE_MIDDLE;
	IF_EQUAL	MOUSE_MIDDLE,0;
		SET	ahead_mouse,0;
	IF_EQUAL KEY_SHIFT,1;
		ADD	ahead_mouse,ahead_mouse;
	SET		ahead_force,ahead_mouse;
	IF_EQUAL	ahead_mouse,0;
		SET	ahead_force,FORCE_AHEAD;

//jc 15.08.
	IF_EQUAL	KEY_Z,1;
		SET	FORCE_TILT,KEY_SENSE;
	IF_EQUAL	KEY_A,1;
		RULE	FORCE_TILT=-KEY_SENSE;
//jc 25.09.

// Rotation sofort stoppen, wenn bei kleinem VROT
// die Taste losgelassen wird

	IF_NEQUAL	FORCE_ROT,0;
		GOTO	no_rot0;
	IF_BELOW	old_frot,KEY_SENSE;	// absolutwert der letzten force_rot
		SET	PLAYER_VROT,0;
no_rot0:
	IF_EQUAL	old_frot,0;				// for better aiming
		RULE	FORCE_ROT=FORCE_ROT*0.3;
	RULE	old_frot = FORCE_ROT;	// letzte force_rot bei gedrueckter Taste
	ABS	old_frot,old_frot;

// 'Einfangen' der PLAYER_HGT
   IF_EQUAL    just_surf, 1;  // mr1010 nicht auf Wasser
		GOTO    no_hcorr;
   IF_NEQUAL	SLOPE_AHEAD,0;  // nicht auf Rampen
		GOTO    no_hcorr;
	IF_ABOVE	PLAYER_HGT,0.2;
		GOTO	no_hcorr;
	IF_BELOW	PLAYER_HGT,-0.2;
		GOTO	no_hcorr;
	RULE	PLAYER_Z = PLAYER_Z - 0.5*PLAYER_HGT;		// geht nur bei 0.5!
	RULE	PLAYER_HGT = 0.5*PLAYER_HGT;	// wirkt nicht wg. R/O?
	RULE	PLAYER_VZ = 0.5*PLAYER_VZ;
no_hcorr:

	CALL common;

	SET		FRICTION,a_fric;
	RULE		thrust = a_ease*ahead_force + 0.04*rocket_up;# - 0.25*SLOPE_AHEAD;
	ACCEL		ahead_speed,thrust;

	SET		FRICTION,s_fric;
	RULE		thrust = s_ease*FORCE_STRAFE;# - 0.15*SLOPE_SIDE;
	ACCEL		strafe_speed,thrust;

	SET		FRICTION,r_fric;
	RULE		thrust = r_ease*FORCE_ROT;
	ACCEL		PLAYER_VROT,thrust;

	SET		FRICTION,i_fric;
	ACCEL		IMPACT_VX,0;
	ACCEL		IMPACT_VY,0;

	SET		FRICTION,xy_fric;
	RULE		thrust = IMPACT_VX + drift_x
					+ PLAYER_COS*ahead_speed + PLAYER_MSIN*strafe_speed;
	ACCEL		PLAYER_VX,thrust;
	RULE		thrust = IMPACT_VY + drift_y
					+ PLAYER_SIN*ahead_speed + PLAYER_COS*strafe_speed;
	ACCEL		PLAYER_VY,thrust;

//jc 21.09.
	RULE		FRICTION = air_fric + gnd_fric*undergnd;
	RULE		thrust = grav*airborne + v_ease*rocket_up + drift_z;
	ACCEL		PLAYER_VZ,thrust;
	RULE		PLAYER_VZ = PLAYER_VZ + gnd_ease*undergnd; // sonst schleudereffekt
	IF_BELOW	ahead_speed,0;	// rueckwaerts?
		GOTO	ahead2;
//	IF_BELOW	SLOPE_AHEAD,0;	// abwaerts?
//jc 03.11.
		RULE	PLAYER_Z = PLAYER_Z + 0.8*REAL_SPEED*SLOPE_AHEAD*TIME_CORR;
		RULE	PLAYER_HGT = PLAYER_HGT + 0.8*REAL_SPEED*SLOPE_AHEAD*TIME_CORR;
//		RULE	PLAYER_VZ = PLAYER_VZ + 0.5*REAL_SPEED*SLOPE_AHEAD;
ahead2:

	SET		FRICTION,0.75;
//jc 25.09.
	RULE		thrust = 0.03*FORCE_TILT;	// - 0.05*SLOPE_AHEAD;
	ACCEL		tilt_speed,thrust;	// acceleration-effekt auf langsamen rechnern geringer!
	RULE		tilt_speed = tilt_speed + 0.04*ACCELERATION;

//jc 25.09.
	IF_ABOVE	FORCE_TILT,0.1;	// Rueckstellzeit fuer tilt
		SET	v_rueck,1.7;
	IF_BELOW	FORCE_TILT,-0.1;
		SET	v_rueck,1.7;
	RULE		v_rueck = v_rueck -0.04*TIME_CORR;
	RULE		rueck = v_rueck;
	RULE		slope_tilt = 0.7*slope_tilt - 0.2*SLOPE_AHEAD;
	RULE		PLAYER_TILT	= rueck*(PLAYER_TILT-slope_tilt) + tilt_speed + slope_tilt;
	IF_ABOVE	rocket_up,0.1;
		END;
	IF_ABOVE	PLAYER_VZ,0;
		END;
	RULE		PLAYER_TILT	= PLAYER_TILT	+ ht_ease*PLAYER_HGT;
}

//////////////////////////////////////////////////////////
SKILL fly_mode		{ VAL 0; }
ACTION switch_fly {
	ADD		fly_mode,1;
	IF_ABOVE	fly_mode,1;
		SET	fly_mode,0;

	IF_EQUAL	fly_mode,1;
		BRANCH		set_fly;
	BRANCH			set_drive;
}

ACTION set_swim {
	SET	a_ease,	0.10;
	SET	a_fric,0.50;
	SET	r_ease,	0.10;
	SET	r_fric,	0.20;
	SET	v_ease,	0.05;
	SET	xy_fric,	0.30;
	SET	air_fric,0.80;
	SET	gnd_fric,0.02;
	SET	stiff,	-0.7;
	SET	grav,		-0.12;
	SET	my_size,	0.6;
	SET	PLAYER_SIZE, 0.6;
	SET	duck.MIN,-0.25;
	SET	PLAYER_ARC,1.1;
	SET	EACH_TICK.16,swimming;
}

ACTION set_dive {
	SET	a_ease,	0.10;
	SET	a_fric,	0.60;
	SET	r_ease,	0.05;
	SET	r_fric,	0.60;
	SET	v_ease,	0.1;
	SET	xy_fric,	0.30;
	SET	air_fric,0.40;
	SET	gnd_fric,0.02;
	SET	stiff,	-4;
	SET	stop,		1;
	SET	my_size,	1;
	SET	PLAYER_SIZE, 1;
	SET	gnd_ease.MIN,0;
	SET	PLAYER_ARC,1.8;
	SET	EACH_TICK.16,diving;
}

ACTION set_ice {
	SET	moving,	1;		// ice mode
	SET	EACH_TICK.16,driving;
	BRANCH	set_moves;
}

ACTION set_drive {
	SET	moving,	0;	// normal mode
	SET	EACH_TICK.16,driving;
	BRANCH	set_moves;
}

//mr0210 stop the Player,
ACTION set_stop {
	SET	EACH_TICK.16, stop_player; // stop_player;
    SET PLAYER_VX, 0;
    SET PLAYER_VY, 0;
    SET PLAYER_VZ, 0;
    SET PLAYER_VROT, 0;
    SET PLAYER_SIZE, my_size;
}

ACTION stop_player
{
//    RULE PLAYER_Z = FLOOR_HGT + PLAYER_SIZE;

// 'Einfangen' der PLAYER_HGT
	IF_ABOVE	PLAYER_HGT,0.2;
		GOTO	no_hcorr;
	IF_BELOW	PLAYER_HGT,-0.2;
		GOTO	no_hcorr;
	RULE	PLAYER_HGT = 0.5*PLAYER_HGT;
	RULE	PLAYER_VZ = 0.5*PLAYER_VZ;
	SUB	PLAYER_Z,PLAYER_HGT;		// geht nur bei 0.5!
no_hcorr:

	CALL common;

//jc 21.09.
	RULE		FRICTION = air_fric + gnd_fric*undergnd;
	RULE		thrust = grav*airborne + v_ease*rocket_up + drift_z;
	ACCEL		PLAYER_VZ,thrust;
	RULE		PLAYER_VZ = PLAYER_VZ + gnd_ease*undergnd; // sonst schleudereffekt
	IF_BELOW	SLOPE_AHEAD,0;
//jc 27.09.
		RULE	PLAYER_VZ = PLAYER_VZ + 0.5*ahead_speed*SLOPE_AHEAD;

}

ACTION set_rocket {
	SET	moving,	4;	// rocket mode
	SET	EACH_TICK.16,rocketing;
	BRANCH	set_moves;
}

ACTION set_walk {
	SET	moving,	2;	// walk mode
	SET	EACH_TICK.16,walking;
	BRANCH	set_moves;
}

ACTION set_moves {
	SET	my_size,	3.5;
	SET	a_ease,	0.30;
	SET	a_fric,	0.20;
	SET	s_ease,	0.25;
	SET	s_fric,	0.50;
	SET	r_ease,	0.06;	// mr1310  (alt=0.07) //jc 25.09.
	SET	r_fric,	0.50;
	SET	xy_fric,	0.75;
	SET	i_fric,	0.80;
	SET	air_fric,0.03;
	SET	gnd_fric,0.96;
	SET	grav,		-0.1;
	SET	stiff,	-0.3;
	SET	v_ease,	0;
	SET	ht_ease,	0.04;

	IF_EQUAL	underwater,1;
		CALL	setf_underwater;
	IF_EQUAL	moving,1;
		CALL	setf_ice;
	IF_EQUAL	moving,2;		// walking?
		CALL	setf_walk;
	IF_EQUAL	moving,4;
		CALL	setf_rocket;
}

ACTION setf_underwater {
	SET	xy_fric,	1;
	SET	i_fric,	1;
	SET	air_fric,0.50;
	SET	a_fric,	0.50;
	SET	r_fric,	0.80;
}
ACTION setf_ice {
	SET	a_ease,	0.1;
	SET	xy_fric,	0.06;
	SET	i_fric,	0.90;		// Abprall-Effekt verhindern
	SET	r_fric,	0.20;
	SET	r_ease,	0.04;		//jc 27.09.
}
ACTION setf_rocket {
	SET	v_ease,	0.119;
	SET	ht_ease,	0;
}
ACTION setf_walk {
	SET	a_ease,	0.20;
	SET	xy_fric,	1;
	SET	i_fric,	1;
	SET	a_fric,	0.50;
	SET	r_fric,	0.80;
	SET	v_ease,	0.2;
	SET	duck.MIN,-0.6;
}

ACTION set_fly {
	SET	a_ease,	1.00;
	SET	air_fric,0.90;
	SET	ht_ease,	0;
	SET	grav,		0;
	SET	EACH_TICK.16,flying;
}

////////////////////////////////////////////////
ACTION schubs {
	SET		val1,HIT_DIST;
	IF_BELOW	val1,1;
		SET	val1,1;
	RULE PLAYER_VX = PLAYER_VX + imp_fac*(PLAYER_X - MY.X)/val1;
	RULE PLAYER_VY = PLAYER_VY + imp_fac*(PLAYER_Y- MY.Y)/val1;
}

//mr2409
ACTION schubs_wall {
    SET val1, 10;
    IF_ABOVE ahead_speed, 0;
        SET val1, -10;

	RULE ahead_speed = val1 * imp_fac;
}

ACTION brems {
	RULE a_fric		= 2*a_fric;
	RULE s_fric		= 2*s_fric;
	RULE drift_x	= 0;
	RULE drift_y	= 0;
	RULE drift_z	= 0;
	RULE PLAYER_VX = 0.5*PLAYER_VX;
	RULE PLAYER_VY = 0.5*PLAYER_VY;
}

////////////////////////////////////////////////
ACTION adjust_plus {
	ADD		r_fric,-0.02;
	RULE		debug_1 = 10*r_fric;
}

ACTION adjust_minus {
	ADD		r_fric,0.02;
	RULE		debug_1 = 10*r_fric;
}

#IF_N	adjust_minus;
#IF_M	adjust_plus;

////////////////////////////////////////////////
//jc 20.10.	set_ulev
////////////////////////////////////////////////
// Lift-Aktionen
// Start mit SET lift.EACH_TICK,lift_start/lift_auf/lift_ab;
// oder IF_ENTER lift_start...;
// Bei Matma-Liften: IF_ARISE	...matma_arise; IF_DIVE ...matma_dive;
// Achtung: Matma-Lifte funktionieren nur, wenn Player sie betritt!

// mr 03.10 Bei matma_dive/matma_arise merken und wiederherstellen
//          aktuelle Pallette.

// Region - Parameter (M = nur bei Matma-Liften):
// SKILL1	Absolute Bodenhoehe (M)
// SKILL2	Absolute Deckenhoehe (M)
// SKILL3	Liftboden - unterer Level
// SKILL4	Liftboden - oberer Level
// SKILL5	Wasser-Level (M)
// SKILL6	Lift-Speed //vorzeichen ergibt richtung
// SKILL7   frei
// SKILL8	benutzt fuer counter

// TEXTURE1	Ueberwasser-Boden	(M)
// TEXTURE2	Ueberwasser-Decke	(M)
// TEXTURE3	Unterwasser-Boden	(M)
// TEXTURE4	Unterwasser-Decke	(M)

// FLAG2		Bei Liftstart nicht warten
// FLAG3		Boden nicht bewegen (SKILL3,SKILL4 beziehen sich auf Decke)
// FLAG4		Decke bewegen (Kabine oder Gate)
// FLAG5		Paternoster / kein HEALTH-Verlust unter Matma (M)
// FLAG6		1 - hier ist Plattform 0- keine Plattform
// FLAG7		Kein Liftsound
// FLAG8		Matma-Region/Matma-Lift	(M)

DEFINE	paternoster,FLAG1;
IFNDEF 	OLD_VERS; // hier neue lift-version

#SKILL	x					{ }
#SKILL	y					{ }
SKILL	surface			{ VAL 0;	}
SKILL	lift_min			{ VAL 0;	}
SKILL	lift_max			{ VAL 0;	}
SKILL	lift_speed		{ VAL 0; }
SKILL	tlift_speed		{ VAL 0.3;	}
SKILL lift_dir			{ VAL 0;	}

SYNONYM  LiftRegion 		{ TYPE REGION; } //region aktuellem floor plattform
SYNONYM  TopLiftRegion 	{ TYPE REGION; } //region speichert SKILL6 und SKILL6

ACTION lift_auf	{ SET lift_dir,1;		BRANCH lift_start; }
ACTION lift_ab		{ SET lift_dir,-1;	BRANCH lift_start; }

ACTION lift_stop	{
	SET      THERE.EACH_TICK,NULL;  //hier erst mal loeschen
	CALL		GetPlattformRegion; //wo ist die plattform
	SET 		LiftRegion.EACH_TICK,NULL;
}

ACTION gate_up		{
	SET		THERE.FLAG2,1;
	SET		lift_dir,1;
	BRANCH	gate_start;
}

ACTION gate_down	{
	SET	THERE.FLAG2,1;
	SET 	lift_dir,-1;
	BRANCH 	gate_start;
}

ACTION gate_start	{
	SET		THERE.FLAG3,1;
	SET		THERE.FLAG4,1;
	BRANCH 	lift_start;
}


SYNONYM  regsyn { TYPE REGION; }

ACTION GetAbovReg{  //above-region suchen / nach synonym
	SET 		regsyn,THERE.TOP;
check_belowreg:
	IF_EQUAL regsyn.BELOW,NULL;  //hat keine below-region oder ist THERE
		END;
	IF_EQUAL regsyn.BELOW,THERE; //above-region gefunden
		END;                      //above gefunden
	SET  		regsyn,regsyn.BELOW;
	GOTO 		check_belowreg;
}

ACTION GetPlattformRegion{  //wo befindet sich Plattform
	SET  LiftRegion,THERE.TOP;
check_belowreg:
	IF_EQUAL LiftRegion.BELOW,NULL;  //hat keine Below-region lift nur hier
		END;
	IF_EQUAL LiftRegion.FLAG6,1; //aktive-region gefunden
		END;                      //above gefunden
	SET  		LiftRegion,LiftRegion.BELOW;
	GOTO 		check_belowreg;
}

ACTION NewPlattformLevel{
	//wichtige daten zwischen above und below tauschen
	IF_EQUAL  regsyn,THERE;
		END;
	SET 		regsyn.SKILL1,THERE.SKILL1; 			//bezugswert weitergeben
	SET 		regsyn.FLOOR_HGT,THERE.FLOOR_HGT; 	//hoehe weitergeben
	SET 		regsyn.SKILL6,THERE.SKILL6; 			//geschwindigkeit weitergeben
	//regsyn uebernimmt SKILL1-berechnung
	SET 		regsyn.EACH_TICK,THERE.EACH_TICK; 	//Lift-aktion weitergeben
	SET 		THERE.EACH_TICK,NULL; 					//aktion in alter region anhalten
	SET   	regsyn.FLAG6,1;							//Andere region ist nun aktiv
	SET		THERE.FLAG6,0;
	//plattform kann nur in einer region betreten werden
	SET 		regsyn.IF_ENTER,THERE.IF_ENTER;
//	SET 		THERE.IF_ENTER,NULL;
// Texturen noch austauschen
}

ACTION SetBelowHGT{  //hoehe der below-region mitnehmen

	IF_EQUAL THERE.IF_DIVE,NULL; //lift schon in below-region bzw. kein tauchen moeglich
		END;                      //dann below.boden und decke auch nicht mitnehmen
/*
	IF_ABOVE THERE.FLOOR_HGT,THERE.SKILL3;   //aktueller lift ueber normal GND angehoben?
		GOTO SetBelHGT;
	END;
SetBelHGT:
*/
//bei IF_DIVE muss auch BELOW vorhanden sein-> kein BELOW==NULL test
	SET 		regsyn,THERE.BELOW;
	SET 		regsyn.FLOOR_HGT,THERE.FLOOR_HGT; 	//floor-hoehe below nachziehen
	SET 		regsyn.CEIL_HGT,THERE.CEIL_HGT; 		//hoehe below  nachziehen
//	SET 	regsyn.CEIL_HGT,THERE.FLOOR_HGT; 		//hoehe_CEILING==FLOOR nachziehen
//-> gibt noch fehler wenn lift wieder nach unten geht
}

ACTION liftboden_unter_floor{
	IF_EQUAL THERE.IF_DIVE,NULL;          //boden fest
		END;
	SET 		regsyn,THERE.BELOW;
	CALL		NewPlattformLevel;
	SET		THERE.FLOOR_HGT,THERE.SKILL3;  	//auf boden festmachen
	SET 		THERE,regsyn;  						//aktuelle region nun BELOW
}

ACTION liftdecke_ueber_decke{
	IF_EQUAL THERE.IF_ARISE,NULL;   //keine region drueber
	  END;
	CALL GetAbovReg; //Above-region suchen sollte dann in regsyn sein
	SET  regsyn.CEIL_HGT,THERE.CEIL_HGT; 	//neue hoehe uebergeben
	SET  THERE.CEIL_HGT,THERE.SKILL2;  		//hoehe anpassen
}

ACTION liftboden_ueber_decke{
	IF_EQUAL THERE.IF_ARISE,NULL;   //keine region drueber
	  END;
	CALL 		GetAbovReg; //Above-region suchen / sollte dann in regsyn sein
	CALL		NewPlattformLevel;  					//drueber gehts weiter
	SET   	THERE,regsyn;                    //aktuelle region nun drueber
//	SET   THERE.CEIL_HGT,THERE.FLOOR_HGT;  //hoehe anpassen //decke mitnehmen
}

ACTION SetLiftPlattform{
	SET      THERE.EACH_TICK,NULL;  	//hier erst mal loeschen
	CALL		GetPlattformRegion; 		//wo ist die plattform //aktuelles skill1
	SET      THERE,LiftRegion;			//hier ist Lift
}

ACTION lift_start {
	CALL		SetLiftPlattform;
	SET      LiftRegion.EACH_TICK,lift_start; //nur dort weiter

	IF_EQUAL	lift_min,0;
		SET	lift_min,LiftRegion.SKILL3;
	SET		LiftRegion.SKILL3,lift_min;

	IF_EQUAL	lift_max,0;
		SET	lift_max,LiftRegion.SKILL4;
	SET		LiftRegion.SKILL4,lift_max;


//	IF_EQUAL	THERE.FLAG8,1;	// matma-Lift? -> Skill1 schon gesetzt
//		SKIP	3;
	SET		LiftRegion.SKILL1,LiftRegion.FLOOR_HGT;	// SKILL1 = Vergleichswert
	IF_EQUAL	LiftRegion.FLAG3,1;	// Gate?
		SET	LiftRegion.SKILL1,LiftRegion.CEIL_HGT;

//Speed bestimmen //immer !=NULL
	IF_EQUAL	lift_speed,0;
		SET	lift_speed,LiftRegion.SKILL6;
	IF_EQUAL	lift_speed,0;
		SET	lift_speed,0.3;	// Default-Speed
	SET		LiftRegion.SKILL6,lift_speed;

	IF_BELOW LiftRegion.SKILL6,0;      //Betrag von Speed bestimmen
		RULE  LiftRegion.SKILL6=LiftRegion.SKILL6 * -1;
//default Richtung ist up

	SET		LiftRegion.SKILL8,0;	// counter
	SET		LiftRegion.EACH_TICK,lift_move_start;
	IF_EQUAL	LiftRegion.SKILL1,LiftRegion.SKILL4;
		RULE  LiftRegion.SKILL6=LiftRegion.SKILL6*-1;

//	IF_ABOVE	lift_dir,0;
//		SET	LiftRegion.EACH_TICK,lift_upstart;

	IF_BELOW	lift_dir,0;  //lift nach unten
		RULE  LiftRegion.SKILL6=LiftRegion.SKILL6*-1;

	SET		lift_speed,0;	// Initialisieren fuer naechsten Lift
	SET		lift_min,0;
	SET		lift_max,0;
	SET		lift_dir,0;
}

ACTION lift_move_start {
	IF_EQUAL	THERE.FLAG2,1;
		GOTO	lift_wait;	// nicht warten?
	IF_EQUAL	THERE.FLAG3,1;
		GOTO	lift_wait;	// Gate?
// 8 Ticks warten
	ADD		THERE.SKILL8,TIME_CORR;
	IF_ABOVE	THERE.SKILL8,8;
		END;
lift_wait:
	SET		THERE.EACH_TICK,lift_up_down;
}

ACTION lift_up_down {
	SET		lift_speed,THERE.SKILL6;
	RULE		lift_speed = TIME_CORR*lift_speed;
	ADD		THERE.SKILL1,lift_speed;

	IF_EQUAL	THERE.FLAG3,1;				// Boden nicht bewegen?
		GOTO	lu_nouw;
	ADD		THERE.FLOOR_HGT,lift_speed;
	LIFT		THERE,lift_speed;
	IF_EQUAL	THERE.HERE,1;				// Steckt Player im Lift?
		RULE	PLAYER_Z = PLAYER_Z - 0.7*lift_speed;
//		RULE	PLAYER_HGT = PLAYER_HGT+lift_speed;

lu_nouw:
	IF_EQUAL	THERE.FLAG4,1; 				// Decke nicht bewegen?
		ADD	THERE.CEIL_HGT,lift_speed;

	SET		lift_speed,0;
	IF_EQUAL	THERE.VISIBLE,1;
		SET	RENDER_MODE,1;
	IF_EQUAL	THERE.FLAG7,0;
		PLAY_SOUND	lift_sound,0.2;

//bodengrenzen nicht ueberschreiten
	IF_ABOVE THERE.CEIL_HGT,THERE.SKILL2;
	  CALL	liftdecke_ueber_decke;

	IF_BELOW THERE.SKILL6,0;            //welche Richtung auf grenzen testen
		GOTO 	check_down_border;

	IF_ABOVE THERE.FLOOR_HGT,THERE.SKILL2; //wassergrenze ueberschritten ?
	  CALL	liftboden_ueber_decke;
	CALL 		SetBelowHGT;						//bodenhoehe mitnehmen
	IF_BELOW	THERE.SKILL1,THERE.SKILL4; //oberes liftende erreicht ?
		END;	// weiter
	SET		lift_max,THERE.SKILL4;		// Sollwert Decke
	BRANCH	lift_end;

check_down_border:
	IF_BELOW THERE.FLOOR_HGT,THERE.SKILL3;
	  CALL	liftboden_unter_floor;
	CALL 		SetBelowHGT;						//bodenhoehe mitnehmen
	IF_ABOVE	THERE.SKILL1,THERE.SKILL3; //boden erreicht ?
		END;
	SET		lift_max,THERE.SKILL3;		// Sollwert Boden
	BRANCH	lift_end;
}

ACTION lift_end {
	SET		THERE.EACH_TICK,NULL;

	SET		lift_min,THERE.SKILL1;	// Istwert
	RULE		lift_min = lift_max - lift_min;
	SET		lift_max,0;
	IF_EQUAL	THERE.FLAG4,1;					// Decke bewegen?
		SET	lift_max,lift_min;
	IF_EQUAL	THERE.FLAG3,1;					// Boden nicht bewegen?
		SET	lift_min,0;

	ADD		THERE.FLOOR_HGT,lift_min;  //Hoehen auf Grenzen begrenzen
	LIFT		THERE,lift_min;
	ADD		THERE.SKILL1,lift_min;
	ADD		THERE.CEIL_HGT,lift_max;

	CALL		SetBelowHGT;   //hoehen der below-region mitnehmen

	SET		lift_max,0;
	SET		lift_min,0;
//jc 09.08.
	IF_EQUAL	THERE.paternoster,1;	// gleich wieder runterfahren?
		BRANCH	lift_start;
}

//mr0310  pallette speichern :
SYNONYM	save_letzt_pal  	{TYPE ACTION; DEFAULT l_fade_norm; }  /// zuletzt benutzte Palette

////////////////////////////////////////////////
// Matma-Absturz
// IF_DIVE:  (check_ulevel...) matma_dive;
// IF_ARISE: (check_olevel...) matma_arise;
// Skill underwater zur Unterscheidung
ACTION matma_dive {
	IF_EQUAL	underwater,1;
		END;
//	IF_ABOVE	HERE.FLOOR_HGT,HERE.SKILL5;
//		END;
	SET		underwater,1;

    //mr0310
    SET     save_letzt_pal, letzt_pal;

	IF_EQUAL	THERE.FLAG5,1;
		GOTO	md_green;

	IF_ABOVE	shield,0;
		GOTO	md_nospruch;
	IF_ABOVE	RANDOM,0.3;
		GOTO	md_nospruch;
	IF_ABOVE	message_delay,0;	// laeuft meldung bereits?
		GOTO	md_nospruch;

	SET			screen_msg.STRING,matbad_1;
	IF_ABOVE	RANDOM,0.27;
		GOTO 	NoRndTxt;
	RULE		zwerg_Skill=RANDOM*35+1; //1..10 erzeugen
	SET   	randtxt_matma_speicher.index,zwerg_menue;
	//nur mit set wird string sofort ermittelt //keine RULE verwenden
	SET		screen_msg.STRING,randtxt_matma_speicher.STRING;
NoRndTxt;
	SET		message_delay,80;	// 5-Sekunden-Message
	SET 		EACH_TICK.14,show_message;

md_nospruch:
	CALL 		l_fade_matma;				  ///////// CG	 ??????
//	FADE_PAL	matmapal,1;
	SKIP		1;
//jc 09.08.
md_green:
	CALL 		l_fade_gruen;				  ///////// CG	 ??????

	RULE		PLAYER_VX = 0.5*PLAYER_VX;
	RULE		PLAYER_VY = 0.5*PLAYER_VY;
	RULE		ahead_speed = 0.5*ahead_speed;

	RULE		PLAYER_ARC = PLAYER_ARC + 0.5;
	BRANCH	set_moves;
}

ACTION matma_arise {
	IF_EQUAL	underwater,0;
		END;				// schon ueber wasser?
	SET		underwater,0;
#	SET		FLAG8,0;	// fuer alte Aktionen

    //mr0310
    CALL    save_letzt_pal;
    SET     save_letzt_pal, l_fade_norm;
//	CALL 	l_fade_norm;
///	FADE_PAL	pal1,1;			 ////CG ????????
	RULE		PLAYER_ARC = PLAYER_ARC - 0.5;
//	ADD my_size,0.3;
	BRANCH	set_moves;
//	SET 		PLAYER_SIZE,my_size;

}


# =====================================================================
# Unterwasser-Aktionen
# =====================================================================

//PALETTE pal_blue	{ PALFILE <blue.pcx>; }
ACTION set_blue	{ NOP;
//FADE_PAL	pal_blue,0.7;
}
ACTION reset_blue { NOP;
//	FADE_PAL	pal_blue,0;
}
// Synonyme fuer Zusatzaktionen beim Tauchen, z.B. Palettenwechsel
SYNONYM	set_underwater	{ TYPE ACTION; DEFAULT set_blue; }
SYNONYM	set_overwater	{ TYPE ACTION; DEFAULT reset_blue; }

IFELSE;  //OLD_VERS
////////////////////////////////////////////////
SKILL	surface			{ VAL 0;	}
SKILL	lift_min			{ VAL 0;	}
SKILL	lift_max			{ VAL 0;	}
SKILL	lift_speed		{ VAL 0; }
SKILL	tlift_speed		{ VAL 0.3;	}
SKILL lift_dir			{ VAL 0;	}

ACTION lift_auf	{ SET lift_dir,1;		BRANCH lift_start; }
ACTION lift_ab		{ SET lift_dir,-1;	BRANCH lift_start; }
ACTION lift_stop	{ SET THERE.EACH_TICK,NULL; 				}

ACTION gate_up		{
	SET	THERE.FLAG2,1;
	SET	lift_dir,1;
	BRANCH		gate_start;
}

ACTION gate_down	{
	SET	THERE.FLAG2,1;
	SET 	lift_dir,-1;
	BRANCH 	gate_start;
}

ACTION gate_start	{
	SET		THERE.FLAG3,1;
	SET		THERE.FLAG4,1;
	BRANCH 		lift_start;
}

ACTION lift_start {
	IF_EQUAL	lift_min,0;
		SET	lift_min,THERE.SKILL3;
	SET		THERE.SKILL3,lift_min;

	IF_EQUAL	lift_max,0;
		SET	lift_max,THERE.SKILL4;
	SET		THERE.SKILL4,lift_max;

#	IF_EQUAL	THERE.SKILL5,0;		  // GCGCGCGC
#		SET	THERE.SKILL5,surface;	  // GCGCGCGC

	IF_EQUAL	THERE.FLAG8,1;	// matma-Lift? -> Skill1 schon gesetzt
		SKIP	3;
	SET		THERE.SKILL1,THERE.FLOOR_HGT;	// SKILL1 = Vergleichswert
	IF_EQUAL	THERE.FLAG3,1;	// Gate?
		SET	THERE.SKILL1,THERE.CEIL_HGT;

	IF_EQUAL	lift_speed,0;
		SET	lift_speed,THERE.SKILL6;
	IF_EQUAL	lift_speed,0;
		SET	lift_speed,0.3;	// Default-Speed
	SET		THERE.SKILL6,lift_speed;

	SET		THERE.SKILL8,0;	// counter
	SET		THERE.EACH_TICK,lift_downstart;
	IF_BELOW	THERE.SKILL1,lift_max;
		SET	THERE.EACH_TICK,lift_upstart;
	IF_ABOVE	lift_dir,0;
		SET	THERE.EACH_TICK,lift_upstart;
	IF_BELOW	lift_dir,0;
		SET	THERE.EACH_TICK,lift_downstart;

	SET		lift_speed,0;	// Initialisieren fuer naechsten Lift
	SET		lift_min,0;
	SET		lift_max,0;
	SET		lift_dir,0;
}

ACTION lift_upstart {
	IF_EQUAL	THERE.FLAG2,1;
		GOTO	lift_upwait;	// nicht warten?
	IF_EQUAL	THERE.FLAG3,1;
		GOTO	lift_upwait;	// Gate?
// 8 Ticks warten
	ADD		THERE.SKILL8,TIME_CORR;
	IF_ABOVE	THERE.SKILL8,8;
		END;
lift_upwait:
	SET		THERE.EACH_TICK,lift_up;
}

ACTION lift_downstart {
	IF_EQUAL	THERE.FLAG2,1;
		GOTO	lift_dnwait;	// nicht warten?
	IF_EQUAL	THERE.FLAG3,1;
		GOTO	lift_dnwait;	// Gate?
// 8 Ticks warten
	ADD		THERE.SKILL8,TIME_CORR;
	IF_ABOVE	THERE.SKILL8,8;
		END;
lift_dnwait:
	SET		THERE.EACH_TICK,lift_down;
}

ACTION lift_up {
	SET		lift_speed,THERE.SKILL6;
	RULE		lift_speed = TIME_CORR*lift_speed;
	ADD		THERE.SKILL1,lift_speed;
	IF_EQUAL	THERE.FLAG3,1;				// Boden nicht bewegen?
		SKIP	4;
	ADD		THERE.FLOOR_HGT,lift_speed;
	LIFT		THERE,lift_speed;
	IF_EQUAL	THERE.HERE,1;				// Steckt Player im Lift?
		RULE	PLAYER_Z = PLAYER_Z + 0.7*lift_speed;

	IF_EQUAL	THERE.FLAG8,0,lu_nouw;			// Matma-Lift?
		SET	THERE.FLOOR_TEX,THERE.TEXTURE1;
	IF_ABOVE	THERE.SKILL1,THERE.SKILL5;
		GOTO	lu_nouw;
	IF_EQUAL	underwater,1;
		GOTO	lu_nouw;
	SET		THERE.FLOOR_HGT,THERE.SKILL5;	// Matmaoberflaeche
	SET		THERE.FLOOR_TEX,THERE.TEXTURE3;
	SET		THERE.CEIL_HGT,THERE.SKILL2;
	SET		THERE.CEIL_TEX,THERE.TEXTURE2;
lu_nouw:

	IF_EQUAL	THERE.FLAG4,1;
		ADD	THERE.CEIL_HGT,lift_speed;

	SET		lift_speed,0;

	IF_EQUAL	THERE.VISIBLE,1;
		SET	RENDER_MODE,1;
	IF_EQUAL	THERE.FLAG7,0;
		PLAY_SOUND	lift_sound,0.2;

	IF_BELOW	THERE.SKILL1,THERE.SKILL4;
		END;	// weiter

	SET		lift_max,THERE.SKILL4;		// Sollwert
	BRANCH	lift_end;
}

ACTION lift_down {
	SET		lift_speed,THERE.SKILL6;
	RULE		lift_speed = time_dec*lift_speed;
	ADD		THERE.SKILL1,lift_speed;

	IF_EQUAL	THERE.FLAG3,1;
		GOTO	ld_nofloor;					// Boden nicht bewegen?
	IF_EQUAL	THERE.HERE,1;									// Steckt Player im Lift?
		RULE	PLAYER_Z = PLAYER_Z + 0.8*lift_speed;	// Ruckeln unterdruecken
	ADD		THERE.FLOOR_HGT,lift_speed;
	LIFT		THERE,lift_speed;
ld_nofloor:

	IF_EQUAL	THERE.FLAG8,0;
		GOTO	ld_nouw;			// Matma-Lift?
	IF_ABOVE	THERE.SKILL1,THERE.SKILL5;
		GOTO	ld_nouw;
	IF_EQUAL	underwater,1;
		GOTO	ld_nouw;
	SET		THERE.FLOOR_HGT,THERE.SKILL5;	// Matmaoberflaeche
	SET		THERE.FLOOR_TEX,THERE.TEXTURE3;
	SET		THERE.CEIL_HGT,THERE.SKILL2;
	SET		THERE.CEIL_TEX,THERE.TEXTURE2;
ld_nouw:

	IF_EQUAL	THERE.FLAG4,1;
		ADD	THERE.CEIL_HGT,lift_speed;

	SET		lift_speed,0;

	IF_EQUAL	THERE.VISIBLE,1;
		SET	RENDER_MODE,1;
	IF_EQUAL	THERE.FLAG7,0;
		PLAY_SOUND	lift_sound,0.2;

	IF_ABOVE	THERE.SKILL1,THERE.SKILL3;
		END;

	SET		lift_max,THERE.SKILL3;		// Sollwert
	BRANCH	lift_end;
}

ACTION lift_end {
	SET		THERE.EACH_TICK,NULL;

	SET		lift_min,THERE.SKILL1;	// Istwert
	RULE		lift_min = lift_max - lift_min;
	SET		lift_max,0;
	IF_EQUAL	THERE.FLAG4,1;					// Decke bewegen?
		SET	lift_max,lift_min;
	IF_EQUAL	THERE.FLAG3,1;
		SET	lift_min,0;

	IF_EQUAL	THERE.FLAG8,0;	// sonst maeuerchen auf matma
		ADD	THERE.FLOOR_HGT,lift_min;
	LIFT		THERE,lift_min;
	ADD		THERE.SKILL1,lift_min;
	ADD		THERE.CEIL_HGT,lift_max;
	SET		lift_max,0;
	SET		lift_min,0;

//jc 09.08.
	IF_EQUAL	THERE.paternoster,1;	// gleich wieder runterfahren?
		BRANCH	lift_start;
}

//mr0310  pallette speichern :
SYNONYM	save_letzt_pal  	{TYPE ACTION; DEFAULT l_fade_norm; }  /// zuletzt benutzte Palette


////////////////////////////////////////////////
// Matma-Absturz
// IF_DIVE:  (check_ulevel...) matma_dive;
// IF_ARISE:  (check_olevel...) matma_arise;
// Skill underwater zur Unterscheidung
ACTION matma_dive {
	IF_EQUAL	underwater,1;
		END;				// schon unter wasser
	IF_ABOVE	HERE.FLOOR_HGT,HERE.SKILL5;
		END;
	SET		underwater,1;

    //mr0310
    SET     save_letzt_pal, letzt_pal;

	IF_EQUAL	THERE.FLAG5,1;
		GOTO	md_green;
/*
	IF_ABOVE	shield,0;
		GOTO	md_nospruch;
	IF_ABOVE	RANDOM,0.3;
		GOTO	md_nospruch;
	IF_ABOVE	message_delay,0;	// laeuft meldung bereits?
		GOTO	md_nospruch;

	SET			screen_msg.STRING,matbad_1;

	IF_ABOVE	RANDOM,0.27;
		GOTO  NoSelMat;
	RULE		zwerg_Skill=RANDOM*35+1; //1..10 erzeugen
	SET   	randtxt_matma_speicher.index,zwerg_Skill;
	//nur mit set wird string sofort ermittelt //keine RULE verwenden
	SET		screen_msg.STRING,randtxt_matma_speicher.STRING;
NoSelMat:
	CALL		show_message;
*/
md_nospruch:
	CALL 		l_fade_matma;				  ///////// CG	 ??????
//	FADE_PAL	matmapal,1;
	SKIP		1;
//jc 09.08.
md_green:
	CALL 		l_fade_gruen;				  ///////// CG	 ??????

	RULE		PLAYER_VX = 0.5*PLAYER_VX;
	RULE		PLAYER_VY = 0.5*PLAYER_VY;
	RULE		ahead_speed = 0.5*ahead_speed;

	ADD		my_size,	-0.3;			// Hysterese
	ADD		PLAYER_SIZE,-0.3;
	ADD		PLAYER_Z,-0.3;
	RULE		PLAYER_ARC = PLAYER_ARC + 0.5;
	BRANCH	set_moves;
}

ACTION matma_arise {
	IF_EQUAL	underwater,0;
		END;				// schon ueber wasser?
	SET		underwater,0;
#	SET		FLAG8,0;	// fuer alte Aktionen

    //mr0310
    CALL    save_letzt_pal;
    SET     save_letzt_pal, l_fade_norm;
//	CALL 	l_fade_norm;
///	FADE_PAL	pal1,1;			 ////CG ????????

	ADD		my_size,	0.3;
	ADD		PLAYER_SIZE,0.3;
	ADD		PLAYER_Z,0.3;
	RULE		PLAYER_ARC = PLAYER_ARC - 0.5;
	BRANCH			set_moves;
}

// Unter/auftauchen in Regionen mit SKILL5
ACTION regio_dive {
	SET		surface,THERE.SKILL5;
	SET		THERE.DO,set_ulevel;
	BRANCH	matma_dive;
}

ACTION regio_arise {
	SET		surface,THERE.SKILL5;
	SET		THERE.DO,set_olevel;
	BRANCH	matma_arise;
}

////////////////////////////////////////////////
// Region unter matma?
// Hoehen und texturen setzen - abhaengig von skill surface
// Veraendert SKILL5 der Regionen!
ACTION init_level {	// initialisiere Matma-Region aus border
	SET		THERE.SKILL1,THERE.FLOOR_HGT;
	SET		THERE.SKILL2,THERE.CEIL_HGT;
	SET		THERE.TEXTURE1,THERE.FLOOR_TEX;
	SET		THERE.TEXTURE2,THERE.CEIL_TEX;
	SET		THERE.TEXTURE3,border.FLOOR_TEX;
	SET		THERE.TEXTURE4,border.CEIL_TEX;
	SET		THERE.FLAG8,1;
	SET		THERE.IF_ARISE,border.IF_ARISE;
	SET		THERE.IF_DIVE,border.IF_DIVE;
	BRANCH			check_level;
}

ACTION set_level {
	RULE		val1 = surface + 0.15;
	IF_ABOVE	PLAYER_Z,val1;
		BRANCH		set_olevel;
	RULE		val1 = surface - 0.15;
	IF_BELOW	PLAYER_Z,val2;
		BRANCH		set_ulevel;
}

ACTION check_level {
	IF_BELOW	PLAYER_Z,surface;	// Player unter dem Matma?
		BRANCH		check_ulevel;
	BRANCH			check_olevel;
}

ACTION check_ulevel {	// setze Region auf Unterwasser-Modus
	SET		THERE.EACH_TICK,NULL;
	BRANCH	set_ulevel;
}

ACTION check_olevel {	// setze Region auf Ueberwasser-Modus
	SET		THERE.EACH_TICK,NULL;
	BRANCH	set_olevel;
}

//jc 20.10.
ACTION set_ulevel {		// setze Region auf Unterwasser-Modus
	SET		RENDER_MODE,1;
	SET		THERE.SKILL5,surface;
	CALL		set_ulev;
}

ACTION set_ulev {		// setze Region auf Unterwasser-Modus
	SET		THERE.FLOOR_HGT,THERE.SKILL1;
	SET		THERE.FLOOR_TEX,THERE.TEXTURE1;

	IF_BELOW	THERE.SKILL2,THERE.SKILL5;	// Decke unter Wasser?
		SKIP	3;
	SET		THERE.CEIL_HGT,THERE.SKILL5;
	SET		THERE.CEIL_TEX,THERE.TEXTURE4;
	SKIP		2;
	SET		THERE.CEIL_HGT,THERE.SKILL2;
	SET		THERE.CEIL_TEX,THERE.TEXTURE2;
	IF_EQUAL	THERE,HERE;
		BRANCH	matma_dive;
}

ACTION set_olevel {
	SET		RENDER_MODE,1;
	SET		THERE.SKILL5,surface;
	CALL		set_olev;
}

ACTION set_olev {
	SET		THERE.CEIL_HGT,THERE.SKILL2;
	SET		THERE.CEIL_TEX,THERE.TEXTURE2;

	IF_ABOVE	THERE.SKILL1,THERE.SKILL5;		// ragt Boden aus dem Wasser?
		SKIP	3;
	SET		THERE.FLOOR_HGT,THERE.SKILL5;	// Wasseroberflaeche
	SET		THERE.FLOOR_TEX,THERE.TEXTURE3;
	SKIP		2;
	SET		THERE.FLOOR_HGT,THERE.SKILL1;
	SET		THERE.FLOOR_TEX,THERE.TEXTURE1;
	IF_EQUAL	THERE,HERE;
		BRANCH	matma_arise;
}

ENDIF;  //OLD_VERS



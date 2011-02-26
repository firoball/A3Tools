////////// CONSTANTS //////////

SKILL Mode_Gehen        { VAL 1; }
SKILL Mode_Schwimmen    { VAL 2; }
SKILL Mode_Tauchen      { VAL 3; }    
SKILL Mode_Fliegen      { VAL 4; }

SYNONYM last_reg {TYPE REGION;}
SYNONYM info_str {TYPE STRING; DEFAULT nix_str;}

////////// GLOBAL SKILLS //////////

SKILL damage {VAL 0; MAX 0;}
SKILL height {}

SKILL ctrl_mode {VAL 0;}
SKILL LIGHT_DIST {VAL 5;}
SKILL diving_time {VAL 0;}
#SKILL anicount {VAL 0;}
SKILL newstring {VAL 0; }
SKILL tilt      { MIN -0.6; MAX 0.6; VAL 0; }
SKILL moving    { VAL 0; }      // 1 Gehen, 2 Schwimmen, 3 Tauchen
SKILL force     {}              // Kraft
SKILL drift_x   { VAL 0; }      // Drift in X-Richtung
SKILL drift_y   { VAL 0; }      // Drift in Y-Richtung
SKILL gravity   { VAL -0.1; }  // Drift in Z-Richtung (Gravitationskraft)
SKILL strength  { VAL 0.1; }    // Kraft-Koeffizient
SKILL fric      { VAL 0.2; }    // Reibungskoeffizient
SKILL mass      { VAL 0.6; }              // Traege Masse des Players
SKILL fric_air  { VAL 0.02; }   // Luftreibungskoeffizient
SKILL duck_val  { VAL 0; }
SKILL my_size   { VAL 6; }
SKILL WALK_PERIOD { VAL 20; }
SKILL WALK_TIME { VAL 20; }
SKILL WAVE_PERIOD { VAL 16; }
SKILL jump_phase  { VAL 0; }
SKILL PLAYER_ARC  { MIN 0.5; MAX 2; VAL 1.2; }
SKILL PLAYER_TILT   { MIN -0.5; MAX 0.5;  }
SKILL wave_str  { VAL 0; }      // Strength-Faktor fuer Wellen-Vorwaertsbewegung
SKILL float_str { VAL 0; }              // Strength-Faktor beim Tauchen
SKILL duck_str  { VAL 0.5; }    
SKILL underwater  { VAL 0; }      // 1-3 = Player unter, 0 = Player ueber Wasser
SKILL PLAYER_SIZE { MIN 2; VAL 6; }
SKILL PLAYER_CLIMB { VAL 3.5; }   // Player sinkt um 1 Step in Boden ein...
SKILL region_height {}
SKILL SHIFT_SENSE {VAL 0.8;}
SKILL KEY_SENSE {VAL 2;}
SKILL wave_mult {VAL 0;}
SKILL mouse_mode {VAL 2;}
SKILL mousetilt_x {VAL 0;}
SKILL mousetilt_y {VAL 0;}
SKILL mousecnt1 {VAL 0; MIN 0;}//fuer mittlere Maustaste
SKILL mousecnt2 {VAL 0; MIN 0;}
SOUND die_snd, <die.wav>;
//////////SPECIAL SKILLS//////////
# walking
SKILL booster     { VAL 1; }            // aktueller Beschleunigungsfaktor
SKILL walk_accell { VAL 1; }            // Beschleunigungsfaktor

# Quake
SKILL richter           { VAL 0; }      // Richter-Skala
SKILL random_1  { }
SKILL random_2  { }

////////// INITIALISIERUNG    M O V E //////////
ACTION init_move {
	SET     moving, Mode_Gehen;
	CALL    set_moving;
}

//////////FADE-PALETTEN//////////
PALETTE pal_blue        { PALFILE <bluepal.pcx>; }
PALETTE pal_green       { PALFILE <greenpal.pcx>; }
PALETTE pal_red         { PALFILE <redpal.pcx>; }
PALETTE nebel_pal {  PALFILE <whitepal.pcx>;
	RANGE 16,32;
	RANGE 48,32; RANGE 80,32; RANGE 112,32;
	RANGE 144,32; RANGE 176,32; RANGE 208,32;
	RANGE 240,15;
	} 
////////// BASIS BEWEGUNGSAKTION    M O V E //////////
ACTION move_me {
start:
IF_EQUAL moving,3; CALL set_diveview;	
IF_EQUAL moving,2; CALL set_swimview;	
	RULE nextlvl=exp-points;
	IF_EQUAL nextlvl,0; CALL train;
	CALL check_skills;
	IF (HP<=0.5) {CALL stop_moving;//Aus! Ende! Jeder geht mal hops
	IF ((PLAYER_TILT<= -.5)&&(my_size<=0)) {PLAY_SOUND die_snd,1;SET LAYERS.4,NULL;
	WAIT 1; FADE_PAL nebel_pal,gamma;SET EACH_TICK.16,NULL;BRANCH reload_game;}
	FADE_PAL pal_red,0.5;ADD my_size,-1; ADD tilt,-0.1; SET RENDER_MODE,1;}  
	RULE weapon_ovr.POS_Y=116+weapon_hgt+5*WALK;
	CALL check_spells;
	RULE region_height=HERE.CEIL_HGT-HERE.FLOOR_HGT;
	SET PLAYER_SIZE.MAX,region_height;

	IF_EQUAL MOUSE_MIDDLE,1; ADD mousecnt1,1;	//Doppelklick mittlere Maustaste
	IF_ABOVE mousecnt1,16; set mousecnt1,0;		//Mit Hilfe einer Timerfunktion verwirklicht
	IF_EQUAL mousecnt1,0; SKIP 4;
	IF_NEQUAL MOUSE_MIDDLE,0; SKIP 2; 
	ADD mousecnt2,1;
	SET mousecnt1,0;
	IF_ABOVE mousecnt2,0; ADD mousecnt2,1;
	IF_ABOVE mousecnt2,16; SET mousecnt2,0;
		
	IF_ABOVE KEY_HOME,0;//Auf HOME kein Sprung!
		SET FORCE_UP,0;

	IF_BELOW KEY_END,1;//Auf END kein Ducken, dafuer aber Sicht zentrieren
		SKIP 2;
	SET tilt,0;
	SET FORCE_UP,0;
	
	IF_ABOVE KEY_PGDN,0;	//Nach unten schauen
                ADDT tilt,0.08;

	IF_ABOVE KEY_PGUP,0;	//Nach oben schauen
                ADDT tilt,-0.08;
	
	SET mousetilt_x,0;	//Mouse-Look
	SET mousetilt_y,0;	
	ADDT mousetilt_y,MICKEY_Y;
	ADDT mousetilt_x,MICKEY_X; 
	RULE tilt=tilt+mousetilt_y/90;
	RULE FORCE_ROT=FORCE_ROT-1*mousetilt_x/15;    
	SET FORCE_TILT,tilt;
	
	IF_ABOVE KEY_A,0;	//A=Sprung
                RULE FORCE_UP=KEY_SENSE;
		
	IF_ABOVE KEY_Z,0;	//Y=Ducken
                RULE FORCE_UP=-1*KEY_SENSE;
	
	IF_BELOW MOUSE_MIDDLE,1; SKIP 6;//Springen, Ducken mit der Maus
	IF_EQUAL mousecnt2,0; SKIP 3;
	RULE FORCE_UP=KEY_SENSE;
	SET mousecnt2,10;
	SKIP 1;	
	RULE FORCE_UP=-1*KEY_SENSE;

	IF_NEQUAL HERE,last_reg;	//notwendig fuer Berechnung von Fallschaden
		RULE height =PLAYER_Z;

	IF_EQUAL underwater,2;	//Wasserregionen (ersaufen, Saeureschaden)
		SUB HP,0.2;
	IF_NEQUAL HERE.FLAG2,1;
		SKIP 3;
	IF_ABOVE PLAYER_HGT,0;
		SKIP 1;  	
	ADDT HP,-0.2;
	IF_EQUAL underwater,0;
		SKIP 3;
	ADDT diving_time,1;
	IF_ABOVE diving_time,240;
                ADDT HP,-0.2;
	IF_BELOW moving,3;
		SKIP 2;
	SET height,PLAYER_Z;	//Wenn man gerade fliegt, kein Fallschaden
	GOTO flying;

	IF_ABOVE PLAYER_HGT,0;	//Solange man in der Luft ist, kein Schaden
		SKIP 4;
	RULE damage=(height-PLAYER_SIZE-FLOOR_HGT-15)*-2;
	SET height,PLAYER_Z;
	IF_BELOW PLAYER_DEPTH,2.5;	//Wenn man in tieferes Wasser faellt, auch kein Schaden
		ADD HP,damage;	//jetzt aber volle Kanne
	SET damage,0;
flying:
	SET last_reg,HERE;	//wieder fuer Schadensberechnung
	IF_ABOVE map_mode,0;	//Kartenzoom-Aktion aufrufen?
		CALL check_map_scale;
	CALL show_info;	//Info-Strings anzeigen, falls notwendig
	IF_NEQUAL moving,Mode_Fliegen;	//Fliegen verbraucht Mana (=MP)
		SKIP 3;
	ADD MP,-0.1;
	IF_EQUAL MP,MP.MIN;	//Aus is! Kein Mana mehr
		CALL set_walking;
	IF_EQUAL night,0;	//Auch Nightvision verschlingt Mana
		SKIP 3;
	ADD MP,-0.1;
	IF_EQUAL MP,MP.MIN;	//kein Mana mehr...buhuuuu...
		CALL night_spell;
//////////////////////////////// PLAYER_SIZE setzen
	IF_EQUAL        moving, Mode_Gehen;             // Gehen
		RULE    PLAYER_SIZE = my_size + 0.5* WALK;
	IF_EQUAL        moving, Mode_Schwimmen;         // Schwimmen
		RULE    PLAYER_SIZE = 1 + 0.12*WAVE;
	IF_EQUAL        moving, Mode_Tauchen;           // Tauchen
		RULE    PLAYER_SIZE = 1;
	IF_EQUAL        moving, Mode_Fliegen;             // Fliegen
		RULE    PLAYER_SIZE = 3;

//////////////////////////////// Unterwasser
	IF_EQUAL	moving, Mode_Gehen;		 // Waten
		RULE	PLAYER_SIZE = PLAYER_SIZE-PLAYER_DEPTH; // SIZE reduzieren
no_waten:
//////////////////////////////// Umschalten Schwimmen/Waten
	IF_NEQUAL	moving, Mode_Schwimmen;
		GOTO	no_swim;
	IF_ABOVE	PLAYER_DEPTH,1.5;		// Wasser tief genug zum Schwimmen?
		GOTO	no_water;
	CALL		set_walking;
	GOTO		start;
no_swim:
	IF_NEQUAL	moving, Mode_Gehen;
		GOTO	no_water;
	IF_ABOVE PLAYER_HGT,0;
		GOTO no_water;
	IF_BELOW	PLAYER_DEPTH,2.5;		// Wasser zu tief zum Waten?
		GOTO	no_water;
	CALL		set_swimming;
	GOTO		start;
no_water:
//////////////////////////////// Grundbewegung
	SET booster, 1;
	SET             INERTIA,mass;
	
	RULE FRICTION = fric + 0.1*PLAYER_DEPTH;    // Zusatzreibung durch Waten	
	IF_ABOVE PLAYER_HGT,0;
		RULE FRICTION=fric;

	IF_ABOVE moving,1;
		SET FRICTION,fric;
	RULE            force =(( strength + wave_str*WAVE)* booster
					* (FORCE_AHEAD*PLAYER_COS - FORCE_STRAFE*PLAYER_SIN)
					+ drift_x)*2.2;
	ACCEL           PLAYER_VX,force;

	RULE            force =((strength + wave_str*WAVE)* booster 
					* (FORCE_AHEAD*PLAYER_SIN + FORCE_STRAFE*PLAYER_COS)
					+ drift_y)*2.2;
	ACCEL           PLAYER_VY,force;

//////////////////////////////// Drehen
	SET             FRICTION,0.7;
	IF_NEQUAL       moving, Mode_Gehen;     // Kein Gehen?
		SET     FRICTION,0.85;

	RULE            force = 0.07*FORCE_ROT;
	ACCEL           PLAYER_VROT,force;

//////////////////////////////// PLAYER_VZ setzen
	SET INERTIA,0.8;
	RULE            force = gravity + float_str*FORCE_UP;
	IF_EQUAL moving,Mode_Fliegen;
		RULE force = force + 0.02*WAVE;
	SET             FRICTION,fric_air;              // Luftreibung
	IF_ABOVE        PLAYER_HGT,0;                   // Schwebt Player in der Luft?
		GOTO    airborne;
	SET             FRICTION,0.98;                  // Bodenreibung
	RULE            force = force - 0.15*PLAYER_HGT; // Bodenelastizitaet
airborne:
	ACCEL           PLAYER_VZ,force;
	SET INERTIA,mass;
//////////////////////////////// Ducken
	RULE            duck_val = 0.8*duck_val;
	IF_EQUAL        moving, Mode_Schwimmen; // Schwimmen: auf- und abwaertsducken
		GOTO    duck;
	IF_ABOVE        FORCE_UP,0;             // Gehen: nur abwaertsducken
		GOTO    no_duck;
duck:
	RULE            duck_val = duck_val + duck_str*FORCE_UP;
no_duck:
	RULE            PLAYER_SIZE = PLAYER_SIZE + duck_val;
//////////////////////////////// Springen
	IF_NEQUAL       moving, Mode_Gehen;     // Kein Gehen?
		GOTO    no_jump;

	IF_ABOVE        jump_phase,0;           // Sprung im Gange?
		GOTO    jump_1;
	IF_BELOW        FORCE_UP, 0.1;          // KEIN Tastendruck auf Pos1?
		GOTO    no_jump;
	SET             jump_phase,1;           // Sprung beginnt
jump_1:
	IF_ABOVE        jump_phase,1;
		GOTO    jump_2;
	RULE            duck_val = duck_val - 0.5;
	IF_BELOW        duck_val,-0.5;          // Tief genug geduckt? (Oben berechnetes Minimum beachten!)
		SET     jump_phase,2;           // Dann jetzt hochspringen
	GOTO            no_jump;
jump_2:
	IF_ABOVE        jump_phase,2;
		GOTO    jump_3;
	SET             duck_val,0;                     // Ducken beenden
	RULE            PLAYER_Z = FLOOR_HGT + my_size; // Wieder zu voller Groesse aufrichten
	SET             PLAYER_VZ,0.45;          // Absprung-Geschwindigkeit
	SET             jump_phase,3;           // Als naechstes: Freier Flug
	GOTO            no_jump;
jump_3:
	
	IF_BELOW	PLAYER_VZ,0.001; //Spieler wird nicht mehr beschleunigt?
			SKIP 2; //dann naechsten 2 Anweisungen ueberspringen
	IF_ABOVE	PLAYER_HGT,4; //Spieler höher als 4 Steps in der Luft?
			SET PLAYER_VZ,0.001;//nur noch sehr kleine Beschleunigung nach oben
	IF_ABOVE        PLAYER_VZ,0;            // Bewegt Player sich noch nach oben?
		GOTO    no_jump;
	IF_ABOVE        PLAYER_HGT,0;           // Ist Player noch in der Luft?
		GOTO    no_jump;
	SET             jump_phase,0;           // Sprung beendet - bereit fuer naechsten Sprung
no_jump:
	RULE PLAYER_TILT = 0.8 * PLAYER_TILT + 0.3 * FORCE_TILT;
}

# =====================================================================
# CONVENIENT ACTIONS
# =====================================================================
ACTION set_walking {    // Modus 'Gehen' einschalten
	SET     PLAYER_SIZE.MIN,3;
	SET     moving, Mode_Gehen;
	SET     fric,0.2;
	SET     strength,0.1;
	SET     wave_str,0;
	SET     float_str,0;
	SET     duck_str,0.5;
	SET     fric_air,0.03;
	SET     gravity,-0.1; 
	SET     EACH_TICK.16,move_me;
}

ACTION set_swimming { // Modus 'Schwimmen' einschalten
	SET     PLAYER_SIZE.MIN,0;
	SET     fric,0.8;
	SET     moving, Mode_Schwimmen;
	SET     strength,0.2;  
	SET     wave_str,0.08; 
	SET     float_str,0;
	SET     duck_str,0.2;
	SET     fric_air,0.5;
	SET     gravity,-0.05; // reduzieren, sonst Eintauchen zu tief
	SET     EACH_TICK.16,move_me;
}

ACTION set_diving { // Modus 'Tauchen' einschalten
	SET     PLAYER_SIZE.MIN,3;
	SET     fric,0.3;
	SET     moving, Mode_Tauchen;
	SET     strength,0.1;
	SET     wave_str,0.03;
	SET     float_str,0.05;
	SET     duck_str,0;
	SET     fric_air,0.7;
	SET     gravity,0;
	SET     EACH_TICK.16,move_me;
}

ACTION set_flying {    // Modus 'Fliegen' einschalten
	SET     PLAYER_SIZE.MIN,3;
	SET     moving, Mode_Fliegen;
	SET     fric,0.2;
	SET     strength,0.1;
	SET     wave_str,0;
	SET     float_str,0.05;
	SET     duck_str,0;
	SET     fric_air,0.7;
	SET     gravity,0;
	SET     EACH_TICK.16,move_me;
}

ACTION set_moving {     // aktiviert die letzte move-Aktion
	IF_EQUAL        moving,0;
		END;
	IF_EQUAL        moving, Mode_Gehen;
		BRANCH  set_walking;
	IF_EQUAL        moving, Mode_Schwimmen;
		BRANCH  set_swimming;
	IF_EQUAL        moving, Mode_Tauchen;
		BRANCH  set_diving;
	IF_EQUAL        moving, Mode_Fliegen;
		BRANCH  set_flying;
}

ACTION stop_moving {    // stoppt Playerbewegung
	SET             PLAYER_VX,0;
	SET             PLAYER_VY,0;
	SET             PLAYER_VZ,0;
	SET             PLAYER_VROT,0;
}


# =====================================================================
# Unterwasser-Aktionen
# =====================================================================


ACTION set_blue { FADE_PAL      pal_blue,0.5; }
ACTION reset_blue { FADE_PAL    pal_blue,0;
		    FADE_PAL    nebel_pal,gamma;}

ACTION set_green { FADE_PAL     pal_green,0.6;}
ACTION reset_green { FADE_PAL   pal_green,0;
		     FADE_PAL   nebel_pal,gamma;}

ACTION set_red { FADE_PAL       pal_red,0.6;}        
ACTION reset_red { FADE_PAL     pal_red,0;
		   FADE_PAL     nebel_pal,gamma;}

// Synonyme fuer Zusatzaktionen beim Tauchen, z.B. Palettenwechsel
SYNONYM set_underwater  { TYPE ACTION; DEFAULT set_blue; }
SYNONYM set_overwater   { TYPE ACTION; DEFAULT reset_blue; }

ACTION regio_dive {
	IF_ABOVE        underwater,0;           // Ist der Player schon unter Wasser?
		END;                                                    // dann Schluss
	SET             underwater,THERE.SKILL1;           // Ab jetzt unter Wasser!
	SET             diving_time,0;
	IF_BELOW underwater,1;
                SET underwater,1;
	IF_ABOVE underwater,3;
                SET underwater,3;
	IF_NEQUAL underwater,1;
		SKIP 2;
	SET set_underwater,set_blue;
	SET set_overwater,reset_blue;
	IF_NEQUAL underwater,2;
		SKIP 2;
	SET set_underwater,set_green;
	SET set_overwater,reset_green;
	IF_NEQUAL underwater,3;
		SKIP 2;
	SET set_underwater,set_red;
	SET set_overwater,reset_red;
	RULE            PLAYER_ARC = PLAYER_ARC + 0.3;  // Blickwinkel veraendern
	RULE            my_size = my_size-0.3;                          // Hysterese
	RULE            PLAYER_SIZE = PLAYER_SIZE-0.3;
	RULE            PLAYER_Z = PLAYER_Z-0.3;
	CALL            set_underwater;
	CALL            set_diving;
	SET RENDER_MODE,2;
}

// Wird bei IF_ARISE von Wasser-Region ausgeloest
ACTION regio_arise {
	IF_EQUAL        underwater,0;           // Player schon ueber Wasser?
		END;
	SET             underwater,0;
	RULE            PLAYER_ARC = PLAYER_ARC - 0.3;  // Blickwinkel normalisieren
	RULE            my_size = my_size+0.3;                          // Hysterese
	RULE            PLAYER_SIZE = PLAYER_SIZE+0.3;
	RULE            PLAYER_Z = PLAYER_Z+0.3;
	CALL            set_overwater;
	CALL            set_swimming;
	SET RENDER_MODE,2;
}

ACTION set_diveview {
IF_ABOVE FORCE_AHEAD,0;
	RULE FORCE_UP=FORCE_UP-PLAYER_TILT*3;
IF_BELOW FORCE_AHEAD,0;
	RULE FORCE_UP=FORCE_UP+PLAYER_TILT*3;
}

ACTION set_swimview {
IF_ABOVE FORCE_AHEAD,0;
	SKIP 1;
END;	
IF_ABOVE PLAYER_TILT,0;
	RULE FORCE_UP=FORCE_UP-PLAYER_TILT*3;
}

//////////Automap//////////
ACTION check_map_scale {
	IF_ABOVE KEY_PLUS,0;                
		RULE MAP_SCALE = MAP_SCALE*1.05;
	IF_ABOVE KEY_APO,0;                
		RULE MAP_SCALE = MAP_SCALE*1.05;

	IF_ABOVE KEY_MINUS,0;                
		RULE MAP_SCALE = MAP_SCALE*0.95;
	IF_ABOVE KEY_SZ,0;                
		RULE MAP_SCALE = MAP_SCALE*0.95;}

//////////Informationstexte anzeigen//////////
ACTION show_info {
	IF_BELOW newstring,1;
		SKIP 3;
	SET msg_timer,0;
	SET anzeige_txt.STRING,info_str;
	SET MESSAGES.10,anzeige_txt;

	ADD msg_timer,1;
	SET newstring,0;
	IF_NEQUAL msg_timer,96;
		END;
	SET msg_timer,0;
	SET anzeige_txt.STRING,nix_str;
	SET MESSAGES.10,NULL;
	}

































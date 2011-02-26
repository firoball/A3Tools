////////////////////////////////////////////////////////////////////////////
/////////////// * ACTION	das TOR - STANDARD *  Chees Gorski 7.08.97 /////
////////  als REGION - TOR. Hoehe des Tores - THERE.SKILL1 //////////////////
////////  Anfang - Floor_hgt = Ceil_hgt	  //////////////////////////////////
//SKILL1	Hoehe des Tores
//SKILL2	Counter - geoefnet/geschlossen
//SKILL3	Counter - wie weit geoefnet
//SKILL4	Tuersound
			// 0 - Standardsound
			// 1 - Metalic
			// 2 - Electro
			// 9 - Ohnesound
//FLAG1		reagiert auf IF_HIT
//

ACTION	Open_S_Tor {
	IF_ABOVE	THERE.SKILL2,1;
	END;
	SET 		THERE.SKILL2,1;
	IF_EQUAL	THERE.FLAG1,0;
	SKIP		2;
	SET			MY.DIST,20;
	SKIP		1;
	SET 		MY.DIST,30;
	IF_EQUAL	THERE.SKILL4,0;
	PLAY_SOUND	door_open, 0.3;
	IF_EQUAL	THERE.SKILL4,1;
	PLAY_SOUND	tor1_open,0.3;
	IF_EQUAL	THERE.SKILL4,2;
	PLAY_SOUND	tor2_open,0.3;
	IF_EQUAL	THERE.SKILL4,4;
	PLAY_SOUND	sockel_l,0.9;
    SET 		THERE.EACH_TICK,Open_S_Tor1;
}
ACTION	Open_S_Tor1 {
	SET 		RENDER_MODE,1;
	ADD			THERE.CEIL_HGT,0.5;
	ADD			THERE.SKILL3,0.5;
	IF_ABOVE	THERE.SKILL3,THERE.SKILL1;
	SKIP 		1;
	END;
	SET			THERE.EACH_TICK,NULL;
}

ACTION clos_S_Tor {
	IF_ABOVE	THERE.SKILL2,1;
	END;
	SET 		THERE.SKILL2,2;
	IF_EQUAL	THERE.FLAG1,0;
	SKIP		2;
    SET 		MY.DIST,0;
	SKIP		1;
    SET 		MY.DIST,20;
	IF_EQUAL	THERE.SKILL4,0;
	PLAY_SOUND	door_open,0.3;
	IF_EQUAL	THERE.SKILL4,1;
	PLAY_SOUND	tor1_open,0.3;
	IF_EQUAL	THERE.SKILL4,2;
	PLAY_SOUND	tor2_open,0.3;
	IF_EQUAL	THERE.SKILL4,4;
	PLAY_SOUND	sockel_l,0.6;
	SET			THERE.EACH_TICK,clos_S_Tor1;
}
ACTION	clos_S_Tor1 {
	SET 		RENDER_MODE,1;
	ADD			THERE.CEIL_HGT,-0.5;
	ADD			THERE.SKILL3,-0.5;
	IF_BELOW	THERE.SKILL3,0.5;
	SKIP 		1;
	END;
	SET 		MY.DIST,20;
	SET			THERE.CEIL_HGT,THERE.FLOOR_HGT;
	SET			THERE.SKILL2,0;
	SET 		THERE.SKILL3,0;
	SET			THERE.EACH_TICK,NULL;
}
///////////////////////////////////////////////////////////////////



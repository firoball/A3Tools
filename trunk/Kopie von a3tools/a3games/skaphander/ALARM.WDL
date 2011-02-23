/////////////////////////////ALARM//////////////////////////////////////////
#Diese Aktion weist Lampe2 eine Alarmfunktion zu. DafÅr mu· die lampe2.wdl
#vorher included werden. Meldelampen sind ACTORS!

SOUND agent_ho, <waker.wav>; //spezieller carrier_alarm

ACTOR	MeldeLampe1 {
	TEXTURE	lampe2_austex;
	HEIGHT   -0.1;
	IF_HIT	alarm1;			//man kann die Lampe killen
	IF_NEAR	alarm1;
	DIST		50;
}
ACTOR	MeldeLampe2 {
	TEXTURE	lampe2_austex;
	HEIGHT   -0.1;
	IF_HIT	alarm2;			//man kann die Lampe killen
	IF_NEAR	alarm2;
	DIST		50;
}
ACTOR	MeldeLampe3 {
	TEXTURE	lampe2_austex;
	HEIGHT   -0.1;
	IF_HIT	alarm3;			//man kann die Lampe killen
	IF_NEAR	alarm3;
	DIST		50;
}
ACTOR	MeldeLampe4 {
	TEXTURE	lampe2_austex;
	HEIGHT   -0.1;
	IF_HIT	alarm4;			//man kann die Lampe killen
	IF_NEAR	alarm4;
	DIST		50;
}
ACTION alarm1 {SET MeldeLampe1.EACH_TICK, petze;}
ACTION alarm2 {SET MeldeLampe2.EACH_TICK, petze;}
ACTION alarm3 {SET MeldeLampe3.EACH_TICK, petze;}
ACTION alarm4 {SET MeldeLampe4.EACH_TICK, petze;}

ACTION petze {
	PLAY_SOUND agent_ho, 0.5;

	SET		MY.TEXTURE,lampe2_blinktex;	// aufblinken
	SET		SHOOT_FAC,0;
	SET		SHOOT_RANGE,180;
	EXPLODE	MY;								// Viren im Umkreis alarmieren
	SET		SHOOT_FAC,1;
	SET		gun_strength, 0;
	SET		MY.IF_NEAR,NULL;
	SET MY.EACH_TICK, NULL;
}

ACTION dissolve {SET MY.INVISIBLE, 1;}

ACTION petze_aus {SET MY.EACH_TICK, NULL;}




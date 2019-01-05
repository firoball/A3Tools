//////////////////////////////////////////////
// SKAPHANDER PLUS Level "Michelangelo", R.Wissdorf / oP group
// 2. April 1995
// Touched up 12/1996 by JCL
///////////////////////////////////////////////
NEXUS	60;
INCLUDE  <LGSkills.wdl>;				##

SKILL	level_track	{ VAL 0; };
SKILL level_no {VAL 4;}
SKILL level_mintime { VAL 500; }  // 5 minuten

LIGHT_ANGLE		1.2;

//////////////////////////////////////////////////////////

MAPFILE		<skaphw.WMP>;
BIND			<skaph.wdl>;
INCLUDE		<smove.wdl>;
INCLUDE		<sound.wdl>;
//////////////////////////////////////////////////////////
SOUND Trigger, <trigger.wav>; # rotlicht-umschalt-sound
SOUND fegefeuer_snd, <fegef.wav>;	#geschrei der seelen in der h”lle!
SOUND fegefeuerwehr, <vereis.wav>; #wenn das H”llenfeuer gefriert
SOUND halleluja, <alleluja.wav>;  # riesenpunkte!!!
SOUND harhar, <lacher2.wav>;
SOUND choral1, <miserere.wav>;
SOUND choral2, <gregoria.wav>;
SOUND choral3, <allegri.wav>;
MUSIC	m_tense, <m_tense.mid>;	#Choral: O Herr, verzeih mir meine Zweifel
MUSIC Scotch_ho,  <scotch.mid>;	#die schottische Hymne im schottischen Raum
//////////////////////////////////////////////////////////
INCLUDE		<emstring.wdl>;
INCLUDE		<scommon.WDL>;

INCLUDE		<unigeniu.wdl>;

INCLUDE		<shield.wdl>;
INCLUDE		<mine.wdl>;
#INCLUDE		<explobox.wdl>;
INCLUDE		<bug.wdl>;

//INCLUDE		<separatr.wdl>;
INCLUDE		<interrup.wdl>;
INCLUDE 		<eraser.wdl>;

INCLUDE		<tueren.wdl>;
INCLUDE		<lampe4.wdl>;
INCLUDE		<lampe2.wdl>;
INCLUDE		<alarm.wdl>;
INCLUDE		<tank_rep.wdl>;	//DamageRepair und Energy-Download

INCLUDE		<tron.wdl>;
INCLUDE		<xmas.wdl>;
INCLUDE		<FASSWDL.WDL>;

#INCLUDE		<box.wdl>;
//////////////////////////////////////////////////////////
SKILL countfac {}

ACTION Choral_play1 {
	SET		countfac,0;
	WAIT		1;
	ADD		countfac,TIME_CORR;
	IF_BELOW	countfac,960;
		SKIP	-3;
   	PLAY_SOUND choral1,0.3;
}
SKILL countfac2 {}

ACTION Choral_play2 {
	SET		countfac2,0;
	WAIT		1;
	ADD		countfac2,TIME_CORR;
	IF_BELOW	countfac2,660;
		SKIP	-3;
	PLAY_SOUND choral3,0.3;
}
SKILL countfac3 {}

ACTION Choral_play3 {
	SET		countfac3,0;
	WAIT		1;
	ADD		countfac3,TIME_CORR;
	IF_BELOW	countfac3,360;
		SKIP	-3;
	PLAY_SOUND choral2,0.3;
}

ACTION StartAction {
	SET 	SOUND_VOL, 1;
	SET 	PLAYER_LIGHT,0.6;
	CALL	skaph_start;
}

IF_START	StartAction;


//////////////////////////BITMAPS'nTextures'nWALLS/////////////////////

BMAP	devils_eyes, 	<michels.lbm>,520,72,110,120;
BMAP gruenboden, 		<michels.lbm>,128,192,64,64;
BMAP blauboden, 		<michels.lbm>,64,192,64,64;
BMAP rotboden, 		<michels.lbm>,0,192,64,64;
BMAP blauschatten, 	<michels.lbm>,320,192,64,64;
BMAP farbschatten, 	<michels.lbm>,256,192,64,64;
BMAP jauneboden, 		<michels.lbm>,192,192,64,64;
BMAP balkendecke, 	<michels.lbm>,192,128,64,64;
BMAP lichterdecke, 	<michels.lbm>,320,0,64,64;
BMAP pixeldecke, 		<michels.lbm>,64,128,64,64;
BMAP glattdecke, 		<michels.lbm>,128,128,64,64;
BMAP blaudomdecke, 	<michels.lbm>,384,64,128,128;
BMAP domdecke, 		<michels.lbm>,256,64,128,128;
BMAP rotwand1, 		<michels.lbm>,384,0,64,64;
BMAP rotwand2, 		<michels.lbm>,448,0,64,64;
BMAP rotwand3, 		<michels.lbm>,512,0,64,64;
BMAP Nietenrand_map,	<michels.lbm>,0,128,54,64;
BMAP Nietenblock_map,<michels.lbm>,192,128,54,64;
BMAP Nieten_Braun, 	<michels.lbm>,0,0,128,128;
BMAP Nieten_Grau, 	<michels.lbm>,128,0,128,128;
#BMAP coni_map,		 	<coni.lbm>;

BMAP repairfloor, <repairs.lbm>,0,0,64,64;
BMAP repairsims,  <repairs.lbm>,64,0,64,8;

////////////////////////////////////////
TEXTURE repairfloor_tex {
	SCALE_XY 9,9;
	BMAPS		repairfloor;
	AMBIENT	-0.2;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE repairdecke_tex {
	SCALE_XY 9,9;
	BMAPS		repairfloor;
	AMBIENT	-0.1;
}
//////////////////////////////////////////////////////////////////////77
BMAP	irq_platine1,<irqplat2.lbm>;
BMAP	irq_platine2,<irqplat3.lbm>;

TEXTURE	irq_platine_tex {
	SCALE_XY	24,24;
	CYCLES	2;
	BMAPS		irq_platine1,irq_platine2;#,irq_platine3,irq_platine4;
	DELAY		1,2;
	AMBIENT	-0.4;
}
TEXTURE	irq_platine_hell {
	SCALE_XY	24,24;
	CYCLES	2;
	BMAPS		irq_platine1,irq_platine2;
	DELAY		2,1;
	AMBIENT	1;
}
TEXTURE	irq_platine_gross {
	SCALE_XY	12,12;
	CYCLES	2;
	BMAPS		irq_platine1,irq_platine2;
	DELAY		4,6;
	AMBIENT	0.4;
}

WALL irq_diabolo {
	TEXTURE		irq_platine_gross;
	IF_NEAR		lachaus;
}
ACTION lachaus {PLAY_SOUND harhar, 0.3;}

WALL irq_1 {
	TEXTURE		irq_platine_tex;
	FLAGS		SAVE;
}

WALL irq_2 {
	TEXTURE	irq_platine_hell;
	FLAGS		SAVE;
}

WALL irq_3 {
	TEXTURE	irq_platine_tex;
	FLAGS		SAVE;
}
WALL irq_4 {
	TEXTURE	irq_platine_tex;
	FLAGS		SAVE;
}
WALL irq_5 {
	TEXTURE	irq_platine_tex;
	FLAGS		SAVE;
}
BMAP	transmitter_innen, <bigtrans.lbm>,0,0,96,128;
TEXTURE trans_innen_tex {
	SCALE_XY 10,10;
     BMAPS	transmitter_innen;
	AMBIENT	1;
}
WALL trans_inside_wall {
	TEXTURE	trans_innen_tex;
}
BMAP	transmitter_aussen, <transmit.lbm>,104,0,88,128;
TEXTURE trans_aussen_tex {
	SCALE_XY 10,10;
	BMAPS		transmitter_aussen;
	AMBIENT	0.2;
}


ACTION warnung {SET screen_msg.STRING, inaktiv; ADD PLAYER_VX, 5;
	BRANCH show_text;}

WALL trans_outside_wall {
	TEXTURE	trans_aussen_tex;
	IF_NEAR	warnung;
	FLAGS		SAVE;
}
BMAP	rotband, <transmit.lbm>,0,128,64,64;
TEXTURE x_rotwand_tex {
	SCALE_XY	12,12;
	BMAPS	rotband;
	AMBIENT	0.2;
}
WALL	xrotwall {
	TEXTURE	x_rotwand_tex;
	FLAGS		PORTCULLIS;
	POSITION	0;
	DIST 20;
}
WALL	xrotwall1 {
	TEXTURE	x_rotwand_tex;
	FLAGS		PORTCULLIS;
	POSITION	0;
	DIST 20;
}
WALL	xrotwall2 {
	TEXTURE	x_rotwand_tex;
	FLAGS		PORTCULLIS;
	POSITION	0;
	DIST 20;
}
/*
ACTION xmove {
	SET xrotwall1.EACH_TICK offsetmove;
	SET xrotwall2.EACH_TICK offsetmove;
}
ACTION offsetmove {
	ADD xrotwall1.OFFSET_X 2;
	ADD xrotwall2.OFFSET_X 2;
}
*/
/*
BMAP	tuer_rahmen, <michels.lbm>,384,192,24,64;
TEXTURE tuer_rahmen_tex {
	SCALE_XY 21,9;
	BMAPS	tuer_rahmen;
	AMBIENT	-0.1;
}

WALL TuerHolm {
	TEXTURE tuer_rahmen_tex;
}
*/

BMAP	dummy, <dummy.lbm>,0,0,32,32;
TEXTURE dummy_Tex {
	SCALE_XY 12,12;
	BMAPS		dummy;
}
WALL DummyWand {
	TEXTURE		dummy_Tex;
	FLAGS			transparent;
}
TEXTURE Nieten_Braun_Tex {
	SCALE_XY 12,12;
	BMAPS		Nieten_Braun;
}
/*
TEXTURE coni2_tex {
#	POS_Y		60;
	SCALE_XY 24,24;
	BMAPS		debugger_obj;	//coni_map;
}

TEXTURE coni_tex {
	SCALE_XY 16,16;
	BMAPS		debugger_obj;	//coni_map;
	POS_Y		70;
	ATTACH	coni2_tex;
}
*/

TEXTURE nieten_coni_tex {
	POS_Y		32;
	SCALE_XY 12,12;
	BMAPS		Nieten_Braun;
#	ATTACH	coni_tex;
#	POS_X		1;
#	POS_Y		40;
}

TEXTURE Nieten_Gross_Tex {
	SCALE_XY 6,6;
	BMAPS		Nieten_Braun;
}
TEXTURE Nieten_Grau_Tex {
	SCALE_XY 12,12;
	BMAPS		Nieten_Grau;
}
TEXTURE Nieten_Graudunkel_Tex {
	SCALE_XY 12,12;
	BMAPS		Nieten_Grau;
	AMBIENT	-0.1;
}
TEXTURE Nieten_Graumittel_Tex {
	SCALE_XY 12,12;
	BMAPS		Nieten_Grau;
	AMBIENT	0.45;
}
TEXTURE Nieten_GrauHell_Tex {
	SCALE_XY 12,12;
	BMAPS		Nieten_Grau;
	AMBIENT	0.9;
}
WALL NietenBraunWand {
	TEXTURE	Nieten_Braun_Tex;
	FLAGS		PORTCULLIS;
	POSITION	1;
}
WALL NietenBraunConi {
	TEXTURE	nieten_coni_tex;
	FLAGS		PORTCULLIS;
	POSITION	1;
}
WALL NietenraffiWand {
	TEXTURE		Nieten_Braun_Tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
}
WALL NietenBraunGross {
	TEXTURE		Nieten_Gross_Tex;
}
WALL NietenGrauWand {
	TEXTURE		Nieten_Grau_Tex;
}
WALL NietenGrauHellWand {
	TEXTURE		Nieten_GrauHell_Tex;
}
WALL NietenGrauMittelWand {
	TEXTURE		Nieten_Graumittel_Tex;
}
WALL NietenGrauDunkelWand {
	TEXTURE		Nieten_Graudunkel_Tex;
}

TEXTURE Nieten_Rand_Tex {
	SCALE_XY 6,6;
	BMAPS		Nietenrand_map;
}
WALL Nietenrand {
	TEXTURE		Nieten_Rand_Tex;
}
TEXTURE Nieten_Bloecke_Tex {
	SCALE_XY 9,9;
	BMAPS		NietenBlock_map;
}
TEXTURE Nieten_BloeckeHell_Tex {
	SCALE_XY 9,9;
	BMAPS		NietenBlock_map;
	AMBIENT	0.3;
}
TEXTURE Nieten_BloeckeMitt_Tex {
	SCALE_XY 9,9;
	BMAPS		NietenBlock_map;
	AMBIENT	0.1;
}

TEXTURE BlockSaeule_Tex {
	SCALE_XY 12,12;
	BMAPS		NietenBlock_map;
}
WALL BlockSaeule {
	TEXTURE		BlockSaeule_Tex;
}
WALL NietenBloecke {
	TEXTURE		Nieten_Bloecke_Tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
}
WALL GalerieliftWall {
	TEXTURE		Nieten_Bloecke_Tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
}
WALL RelingWall {
	TEXTURE		Nieten_Bloecke_Tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
}
WALL Treppen {
	TEXTURE		Nieten_Bloecke_Tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
}
BMAP lamellen, <staebe.lbm>,0,0,256,256;
TEXTURE lamellen_tex {
	SCALE_XY 24,24;
	BMAPS		lamellen;
	AMBIENT	0.1;
}
TEXTURE lamellen_saeule {
	SCALE_XY 44,44;
	BMAPS		lamellen;
	AMBIENT	0.3;
}
WALL Lamellenlift {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
}
WALL Lamellennoster {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
WALL opnoster1 {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		opnosterstart1;
}
WALL opnoster2 {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		opnosterstart2;
}
WALL opnoster3 {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		quetsche;
}
WALL untermatlift {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
	IF_HIT		mat_lift;
}
WALL goliathliftwall {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		golli_start;
}

ACTION mat_lift {SET mat_aufzug.EACH_TICK,lift_start;}

WALL galeria_1_lift {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		galerie_lift;
}
WALL galeria_2_lift {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		galerie_lift;
}
BMAP	fegereinhard, <staebe.lbm>,0,0,256,256;
TEXTURE fegereinhard_tex {
	SCALE_XY 24,24;
	BMAPS		fegereinhard;
	AMBIENT	0.1;
}

WALL fegefeuer_gate {
	TEXTURE		fegereinhard_tex;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		0;
	IF_NEAR		fegelift;
	IF_FAR		fegedown;
#	IF_HIT		fegestart;
	DIST	 		20;
	FLAGS		SAVE;
}

WALL Goliathlift {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS;
	POSITION		1;
	IF_HIT		golli_start;
	IF_NEAR		golli_start;
	FLAGS		SAVE;
}

WALL Lamellensaeule {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
WALL Lamellenwand {
	TEXTURE		lamellen_tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}

/////////////////////////////////////////////

WALL goliath_secret_wall {
	TEXTURE		lamellen_Tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
	IF_NEAR		open_secret_door;
	IF_HIT		open_secret_door;
	FLAGS			SAVE;
}
WALL goliath_secret_wall2 {
	TEXTURE		lamellen_Tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
	DIST			12;
	IF_NEAR		open_door2;
	IF_HIT		open_door2;
	FLAGS			SAVE;
}
WALL goliath_secret_wall3 {
	TEXTURE		Nieten_Grau_Tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}

BMAP	GotikFenster, <got_fens.lbm>,0,0,64,128;
TEXTURE GotikFenster_Tex {
	SCALE_XY 10,16;
	BMAPS		GotikFenster;
	AMBIENT	1;
}
WALL GothicWindow {
	TEXTURE		GotikFenster_Tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
BMAP	GotikBlau, <goblue.lbm>,0,0,64,128;
TEXTURE GotikBlau_Tex {
	SCALE_XY 5,8;
	BMAPS		Gotikblau;
	AMBIENT	1;
}
WALL BlueWindow {
	TEXTURE		GotikBlau_Tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
BMAP	Gotikgruen, <gogreen.lbm>,0,0,64,128;
TEXTURE GotikGruen_Tex {
	SCALE_XY 5,8;
	BMAPS		Gotikgruen;
	AMBIENT	1;
}
WALL GruenWindow {
	TEXTURE		GotikGruen_Tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
BMAP scottish1, <scotch.lbm>,0,0,128,128;

TEXTURE scottish_Tex {
	SCALE_XY 12,12;
	BMAPS		scottish1;
	AMBIENT	0.2;
}
TEXTURE scottsimple_Tex {
	SCALE_XY 12,12;
	BMAPS		scottish1;
}
WALL ScotchWand1 {
	TEXTURE		scottish_Tex;
	EACH_TICK	move_it;
}
WALL ScotchWand2 {
	TEXTURE		scottish_Tex;
	EACH_TICK	move_it;
}
WALL ScotchWand3 {
	TEXTURE		scottish_Tex;
	EACH_TICK	move_it;
}
WALL ScotchWand4 {
	TEXTURE		scottsimple_Tex;
	EACH_TICK	move_fast;
}
WALL ScotchWand5 {
	TEXTURE		scottsimple_Tex;
	EACH_TICK	move_fast;
}

ACTION move_it {
	ADD ScotchWand1.OFFSET_Y, 1;
	ADD ScotchWand2.OFFSET_X, 1;
	ADD ScotchWand3.OFFSET_X, 2;
	ADD ScotchWand3.OFFSET_Y, 3;
}
ACTION move_fast {
	ADD ScotchWand4.OFFSET_Y, 7;
	ADD ScotchWand5.OFFSET_X, 12;
}

BMAP	orgel_map, <orgel.lbm>,0,0,313,128;
#BMAP  Orgel_background, <orgel.lbm>,0,128,72,32;

TEXTURE Orgel_Tex {
	SCALE_XY 6,9;
	BMAPS		orgel_map;
	AMBIENT	0.2;
}
WALL OrgelWand {
	TEXTURE		Orgel_Tex;
	FLAGS			TRANSPARENT,PORTCULLIS;
	POSITION		0;
}
WALL Orgel_vorwand {
	TEXTURE		lamellen_Tex;
}

TEXTURE Orgel_background_Tex {
	SCALE_XY 9,9;
	BMAPS		lamellen;
	AMBIENT	0.3;
}
WALL OrgelHintergrund {
	TEXTURE		Orgel_background_Tex;
}

TEXTURE rotwand_tex {
	SCALE_XY 9,9;
	CYCLES	4;
	BMAPS		rotwand1,rotwand2,rotwand3,rotwand2;
	DELAY		2,2,2,2;
	AMBIENT	0.3;
}
TEXTURE rotwand_soundtex {
	SCALE_XY 9,9;
	CYCLES	4;
	BMAPS		rotwand1,rotwand2,rotwand3,rotwand2;
	DELAY		3,4,5,7;
	SOUND		fegefeuer_snd;
	SCYCLE	1;
	SVOL		0.6;
	SDIST		80;
	AMBIENT	0.3;
}
WALL FegefeuerWand1 {
	TEXTURE	rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand2 {
	TEXTURE		rotwand_soundTex;
	FLAGS		SAVE;
}
WALL FegefeuerWand3 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand4 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand5 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand6 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand7 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand8 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand9 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand10 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand11 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand12 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand13 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand14 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand15 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand16 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand17 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand18 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}
WALL FegefeuerWand19 {
	TEXTURE		rotwand_Tex;
	FLAGS		SAVE;
}

BMAP	icefloor, <icefloor.lbm>,128,0,128,128;
BMAP  icewall,  <icefloor.lbm>,256,0,128,128;
TEXTURE icefloor_Tex {
	SCALE_XY 12,12;
	BMAPS		icefloor;
	AMBIENT	-0.1;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE icedecke_Tex {
	SCALE_XY 12,12;
	BMAPS		icefloor;
	AMBIENT	-0.3;
}
TEXTURE icewall_Tex {
	SCALE_XY 12,12;
	BMAPS		icewall;
	AMBIENT	0;
}
WALL EisWand {
	TEXTURE		icewall_Tex;
	FLAGS		SAVE;
}
BMAP  m_switch1, <m_switch.lbm>,0,0,128,128;
BMAP  m_switch2, <m_switch.lbm>,128,0,128,128;

TEXTURE	M_SwitchTex1 {
	SCALE_XY	20,20;
	BMAPS		m_switch1;
	AMBIENT	0.1;
}
TEXTURE	M_SwitchTex2 {
	SCALE_XY	20,20;
	BMAPS		m_switch2;
	AMBIENT	0.1;
}

WALL orgel_trigger {
	TEXTURE		M_SwitchTex1;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_HIT		display_note;
}
WALL DavidWaffe_frei {
	TEXTURE		M_SwitchTex1;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_NEAR 		waffensockel;
	IF_HIT 		waffensockel;
}
WALL irq_switch1 {
	TEXTURE		M_SwitchTex1;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_NEAR 		irq_switcher1;
	IF_HIT 		irq_switcher1;
}

ACTION irq_switcher1 {
	PLAY_SOUND trigger, 0.3;
	SET irq_switch1.TEXTURE, M_SwitchTex2;
	SET irq_switch1.IF_NEAR, NULL;
	SET irq_switch1.IF_HIT, NULL;
	SET irq_1.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, not_yet1;
	SET message_delay, 120;
	BRANCH show_text;
}
ACTION irq_switcher1a {
	SET irq_switch1.TEXTURE, M_SwitchTex2;
	SET irq_switch1.IF_NEAR, NULL;
	SET irq_switch1.IF_HIT, NULL;
	SET irq_1.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, yet;
	SET message_delay, 120;
	BRANCH show_text;
}
ACTION irq_switcher3 {
	PLAY_SOUND trigger, 0.3;
	SET irq_switch3.TEXTURE, M_SwitchTex2;
	SET irq_switch3.IF_NEAR, NULL;
	SET irq_switch3.IF_HIT, NULL;
	SET irq_3.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, not_yet3;
	SET message_delay, 120;
	BRANCH show_text;
}
ACTION irq_switcher3a {
	SET irq_switch3.TEXTURE, M_SwitchTex2;
	SET irq_switch3.IF_NEAR, NULL;
	SET irq_switch3.IF_HIT, NULL;
	SET irq_3.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, yet;
	SET message_delay, 120;
	BRANCH show_text;
}

ACTION irq_switcher4 {
	PLAY_SOUND trigger, 0.3;
	SET irq_switch4.TEXTURE, M_SwitchTex2;
	SET irq_switch4.IF_NEAR, NULL;
	SET irq_switch4.IF_HIT, NULL;
	SET irq_4.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, not_yet4;
	SET message_delay, 120;
	BRANCH show_text;
}
ACTION irq_switcher4a {
	SET irq_switch4.TEXTURE, M_SwitchTex2;
	SET irq_switch4.IF_NEAR, NULL;
	SET irq_switch4.IF_HIT, NULL;
	SET irq_4.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, yet;
	SET message_delay, 120;
	BRANCH show_text;
}

ACTION irq_switcher5 {
	PLAY_SOUND trigger, 0.3;
	PLAY_SONG scotch_ho, 1;
	SET irq_switch5.TEXTURE, M_SwitchTex2;
	SET irq_5.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, yet5;
	SET orgel_trigger.IF_NEAR, NULL;
	SET orgel_trigger.IF_HIT, well_done;

	SET schaltersockel.FLOOR_HGT, 25;
	SET schalter.FLOOR_HGT, 31;

	SET Empore.IF_ENTER, helterskelter;

		SET irq_switch1.IF_NEAR, irq_switcher1a;
		SET irq_switch1.IF_HIT, irq_switcher1a;
		SET irq_switch3.IF_NEAR, irq_switcher3a;
		SET irq_switch3.IF_HIT, irq_switcher3a;
		SET irq_switch4.IF_NEAR, irq_switcher4a;
		SET irq_switch4.IF_HIT, irq_switcher4a;

	SET irq_switch5.IF_NEAR, irq_switcher5a;
	SET irq_switch5.IF_HIT, irq_switcher5a;
	SET MY.EACH_TICK, dotz;
	SET message_delay, 120;
	BRANCH show_text;
}
ACTION irq_switcher5a {
	PLAY_SOUND trigger, 0.3;
	PLAY_SONG scotch_ho, 1;
	SET irq_switch5.TEXTURE, M_SwitchTex2;
	SET irq_5.TEXTURE, irq_platine_hell;
	SET screen_msg.STRING, yetyet;
	SET MY.EACH_TICK, dotz;
	SET message_delay, 120;
	BRANCH show_text;
}


WALL irq_switch3 {
	TEXTURE		M_SwitchTex1;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_NEAR 		irq_switcher3;
	IF_HIT 		irq_switcher3;
}

WALL irq_switch4 {
	TEXTURE		M_SwitchTex1;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_NEAR 		irq_switcher4;
	IF_HIT 		irq_switcher4;
}

WALL irq_switch5 {
	TEXTURE		M_SwitchTex1;
	FLAGS			PORTCULLIS,SAVE;
	POSITION		1;
	IF_NEAR 		irq_switcher5;
	IF_HIT 		irq_switcher5;
}

TEXTURE	devil_tex {
	SCALE_XY	16,16;
	BMAPS		devils_eyes;
	AMBIENT 	0.0;
}
TEXTURE	devil_hittex {
	SCALE_XY	16,16;
	BMAPS		devils_eyes;
	AMBIENT 	0.9;
}

WAY	devilrow;

ACTOR	devil {
	TEXTURE	devil_tex;
	HEIGHT 	4;
	TARGET	devilrow;
	SPEED		0.2;
	SKILL1	4;	// Panzerung
	SKILL5	0;
	FLAGS		GROUND;
}


ACTION Seelenswitch {
	PLAY_SOUND	harhar, 0.7;
	SET devil.TEXTURE, devil_hittex;
	WAIT 1;
	SET devil.TEXTURE, devil_tex;
#	IF_ABOVE HIT_DIST,20;
#		END;
	ADD MY.SKILL1, -1;
	IF_ABOVE MY.SKILL1, 0;
		END;

	SET fegefeuer_matma.IF_DIVE, NULL;
	SET fegefeuer_matma.IF_ARISE, NULL;
	SET fegefeuer_matma.IF_ENTER, skid;
	SET fegefeuer_matma.IF_LEAVE, norm_drive;
	SET fegefeuer_matma.FLAG8,0;

	SET mat_aufzug.IF_ENTER, HelterSkelter;
	SET mat_aufzug.IF_LEAVE, NULL;
	SET mat_aufzug.FLAG8,0;
	SET fegefeuer.EACH_TICK, seelenruh;
	SET Devil.INVISIBLE,1;
	SET Devil.SKILL1,0;
	SET screen_msg.STRING, freezer;
	ADD points, 50;
	BRANCH show_text;
}

ACTION seelenruh {
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET Fegefeuer.FLOOR_TEX, icefloor_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.4;
	SET Fegefeuer.CEIL_TEX, icedecke_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET Fegefeuer_matma.FLOOR_TEX, icefloor_tex;
WAIT 2;
	SET Fegefeuer_matma.CEIL_TEX, icedecke_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.5;
	SET Fegefeuer_Treppe1.CEIL_TEX, icedecke_tex;
WAIT 2;
	SET Fegefeuer_Treppe1.FLOOR_TEX, icefloor_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET Fegefeuer_Treppe2.CEIL_TEX, icedecke_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET Fegefeuer_Treppe2.FLOOR_TEX, icefloor_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET mat_aufzug.FLOOR_TEX, icefloor_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET mat_aufzug.CEIL_TEX, icedecke_tex;
WAIT 2;
	SET mat_aufzug.IF_ENTER, NULL;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand1.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand2.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand3.TEXTURE, icewall_tex;
WAIT 2;
	SET FegefeuerWand4.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand5.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand6.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand7.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand8.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand9.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand10.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand11.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand12.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand13.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand14.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.3;
	SET FegefeuerWand15.TEXTURE, icewall_tex;
WAIT 2;
	SET FegefeuerWand16.TEXTURE, icewall_tex;
WAIT 2;
	SET FegefeuerWand17.TEXTURE, icewall_tex;
WAIT 2;
	SET FegefeuerWand18.TEXTURE, icewall_tex;
WAIT 2;
	PLAY_SOUND	fegefeuerwehr, 0.5;
	SET FegefeuerWand19.TEXTURE, icewall_tex;
WAIT 2;
	SET fegefeuer.EACH_TICK, NULL;
}
ACTION skid {
	PLAY_SOUND	HolterDiePolter,0.2;
	SET PLAYER_CLIMB, 3;
	BRANCH		set_ice;
}
ACTION norm_drive {
	SET PLAYER_CLIMB, 2;
	BRANCH		set_drive;
}

BMAP michelangelo, <adam2.lbm>,0,0,450,256;
TEXTURE michelangelo_tex {
	SCALE_XY	10,9;
	BMAPS		michelangelo;
	AMBIENT	1;
}
WALL michelangelo_wall {
	TEXTURE	michelangelo_tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
TEXTURE michelklein_tex {
	SCALE_XY	15,19;
	BMAPS		michelangelo;
	AMBIENT	1;
}
WALL michelklein_wall {
	TEXTURE	michelklein_tex;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
BMAP	streifensaeule_map,<streifen.lbm>,0,0,128,128;
BMAP	streifen_3D,<streifen.lbm>,320,0,128,128;

TEXTURE	streifensaeuletex {
	SCALE_XY	20.6,30;
	BMAPS		streifensaeule_map;
}
TEXTURE	streifenbodentex {
	SCALE_XY	20,20;
	BMAPS		streifensaeule_map;
	SOUND 	EngineRun;
	SVOL		0.6;
	FLAGS		SLOOP;
}

TEXTURE	streifen_3D_tex {
	SCALE_XY	10,10;
	BMAPS		streifen_3D;
}

TEXTURE	streifensaeule_kleintex {
	SCALE_XY	41,60;
	BMAPS		streifensaeule_map;
}
WALL streifensaeule {
	TEXTURE	streifensaeuletex;
	FLAGS		PORTCULLIS;
	POSITION	1;
}

WALL streifenbruecke {
	TEXTURE	streifensaeuletex;
}

WALL streifen_3DWand {
	TEXTURE	streifen_3D_tex;
	FLAGS		PORTCULLIS;
}

WALL streifensaeule_klein {
	TEXTURE	streifensaeule_kleintex;
	FLAGS		PORTCULLIS;

}


////////////////////////////////DECKEN////////////////////////////////////
TEXTURE domdecke_tex {
	SCALE_XY 6,6;
	BMAPS		domdecke;
	AMBIENT	1;
}
TEXTURE blaudomdecke_tex {
	SCALE_XY 6,6;
	BMAPS		blaudomdecke;
	AMBIENT	0.9;
}
TEXTURE glattdecke_tex {
	SCALE_XY 9,9;
	BMAPS		glattdecke;
}
TEXTURE glattdeckeHell_tex {
	SCALE_XY 9,9;
	BMAPS		glattdecke;
	AMBIENT	0.07;
}
TEXTURE pixeldecke_tex {
	SCALE_XY 9,9;
	BMAPS		pixeldecke;
	AMBIENT	-0.1;
}
TEXTURE lichterdecke_tex {
	SCALE_XY 9,9;
	BMAPS		lichterdecke;
	AMBIENT	-0.1;
}
TEXTURE balkendecke_tex {
	SCALE_XY 9,9;
	BMAPS		balkendecke;
	AMBIENT	-0.1;
}

////////////////////////////////////BOEDEN///////////////////////////////
TEXTURE jauneboden_tex {
	SCALE_XY 9,9;
	BMAPS		jauneboden;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE jaunedecke_tex {
	SCALE_XY 9,9;
	BMAPS		jauneboden;
}
TEXTURE farbschatten_tex {
	SCALE_XY 9,9;
	BMAPS		farbschatten;
	AMBIENT	0.9;
	SOUND 	EngineRun;
	SVOL		0.6;
	FLAGS		SLOOP;
}
TEXTURE blauschatten_tex {
	SCALE_XY 9,9;
	BMAPS		blauschatten;
	AMBIENT	0.5;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE jaunehell_tex {
	SCALE_XY 9,9;
	BMAPS		jauneboden;
	AMBIENT	0.9;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}


TEXTURE rotboden_tex {
	SCALE_XY 9,9;
	BMAPS		rotboden;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE rotdecke_tex {
	SCALE_XY 9,9;
	BMAPS		rotboden;
}
TEXTURE blauboden_tex {
	SCALE_XY 9,9;
	BMAPS		blauboden;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE blaudecke_tex {
	SCALE_XY 9,9;
	BMAPS		blauboden;
}
TEXTURE gruenboden_tex {
	SCALE_XY 9,9;
	BMAPS		gruenboden;
	SOUND 	EngineRun;
	SVOL		0.7;
	FLAGS		SLOOP;
}
TEXTURE gruendecke_tex {
	SCALE_XY 9,9;
	BMAPS		gruenboden;
}
BMAP  Matma_o_1, <matoben.lbm>,0,0,64,64;
BMAP  Matma_o_2, <matoben.lbm>,64,0,64,64;
BMAP  Matma_o_3, <matoben.lbm>,128,0,64,64;
BMAP  Matma_o_4, <matoben.lbm>,192,0,64,64;
BMAP  Matma_o_5, <matoben.lbm>,0,64,64,64;
BMAP  Matma_o_6, <matoben.lbm>,64,64,64,64;
BMAP  Matma_o_7, <matoben.lbm>,128,64,64,64;
BMAP  Matma_o_8, <matoben.lbm>,192,64,64,64;
BMAP  Matma_o_9, <matoben.lbm>,0,128,64,64;
BMAP  Matma_o_10, <matoben.lbm>,64,128,64,64;
BMAP	umat_boden, <matmabod.lbm>,0,0,256,256;

BMAP	Matma_u_1,  <matunten.lbm>,0,0,64,64;
BMAP	Matma_u_2,  <matunten.lbm>,64,0,64,64;
BMAP	Matma_u_3,  <matunten.lbm>,128,0,64,64;
BMAP	Matma_u_4, 	<matunten.lbm>,192,0,64,64;
BMAP	Matma_u_5,  <matunten.lbm>,0,64,64,64;
BMAP	Matma_u_6,  <matunten.lbm>,64,64,64,64;
BMAP	Matma_u_7,  <matunten.lbm>,128,64,64,64;
BMAP	Matma_u_8,  <matunten.lbm>,192,64,64,64;
BMAP	Matma_u_9,  <matunten.lbm>,0,128,64,64;
BMAP	Matma_u_10,  <matunten.lbm>,64,0,64,64;


TEXTURE matma_oben {
	SCALE_XY	4,4;
	CYCLES		10;
	BMAPS		matma_o_1,matma_o_2,matma_o_3,matma_o_4,
				matma_o_5,matma_o_6,matma_o_7,matma_o_8,
				matma_o_9,matma_o_10;
	DELAY		2,2,2,2,2,2,2,2,2,2;
	AMBIENT	0.1;

}

TEXTURE	matma_unten {
	SCALE_XY	8,8;
	CYCLES		10;
	BMAPS		matma_u_1,matma_u_2,matma_u_3,matma_u_4,
				matma_u_5,matma_u_6,matma_u_7,matma_u_8,
				matma_u_9,matma_u_10;
	DELAY		2,2,2,2,2,2,2,2,2,2;
}

TEXTURE umattex {
	SCALE_XY	8,8;
	BMAPS		umat_boden;
	SOUND		UnterMatmaBlubb;
	SVOL		0.5;
	FLAGS		SLOOP;
 }
/////////////////////////////ACTORS//////////////////////////////////////
WAY	immanuel;
WAY	salomonis;
WAY	holy_patrol;
WAY	moses;
WAY	petrus;
WAY	noah;
WAY	destiny;

ACTOR	manuel {
	TEXTURE	v_tron_tex;
	HEIGHT	2;
	SPEED		0.5;
	DIST		80;
	EACH_TICK	tron_init;
	TARGET	immanuel;
}
ACTOR	salomo {
	TEXTURE	v_tron_tex;
	HEIGHT	2;
	SPEED		0.5;
	DIST		80;
	EACH_TICK	tron_init;
	TARGET	salomonis;
}
ACTOR	mose {
	TEXTURE	v_tron_tex;
	HEIGHT	2;
	SPEED		0.5;
	DIST		80;
	EACH_TICK	tron_init;
	TARGET	moses;
}
ACTOR	petro {
	TEXTURE	v_tron_tex;
	HEIGHT	2;
	SPEED		0.5;
	DIST		80;
	EACH_TICK	tron_init;
	TARGET	petrus;
}

ACTOR	tron_immer {
	TEXTURE	v_tron_tex;
	HEIGHT	2;
	SPEED		0.5;
	DIST		80;
	EACH_TICK	tron_init;
	TARGET	holy_patrol;
}

/////////////////////////////THINGS////////////////////////////////////////
BMAP	drahtmodell,<schladr.lbm>,0,0,242,210;

TEXTURE	drahtmodelltex {
 	 SCALE_XY	9,9;
    BMAPS	drahtmodell;
    AMBIENT 	1;
}
TEXTURE	drahtmodell_dark {
 	 SCALE_XY	9,9;
    BMAPS	drahtmodell;
    AMBIENT 	0;
}
THING oP_Schlange {
	TEXTURE	drahtmodelltex;
	HEIGHT	18;
	FLAGS			PASSABLE,SAVE;
}
THING oP_Schlange2 {
	TEXTURE	drahtmodell_dark;
	HEIGHT	2;
	FLAGS		GROUND,PASSABLE,SAVE;
}


/////////////////////////////////////////////////////////////////////////
///////////   							REGIONEN									///////
////////////////////////////////////////////////////////////////////////

REGION Border {
	FLOOR_HGT	80;
	CEIL_HGT		80;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	FLAGS			SAVE;	// nur fuer actions-provisorium
	CLIP_DIST	0;	// region never visible!
}

REGION Kapelle {
	FLOOR_HGT	0;
	CEIL_HGT		70;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	EACH_TICK	choral_play1;
	FLAGS			SAVE;
	IF_ENTER		HelterSkelter;
}


REGION Kapellenrampe {
	FLOOR_HGT	0;
	CEIL_HGT		70;
	FLOOR_TEX	streifenbodentex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}

REGION Adam_1 {
	FLOOR_HGT	-1;
	CEIL_HGT		80;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	450;
	AMBIENT		1;
	IF_ENTER		HelterSkelter;
}
REGION Kreuzgang {
	FLOOR_HGT	0.5;
	CEIL_HGT		45;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		glattdecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.45;
	FLAGS			SAVE;
	IF_ENTER		HelterSkelter;
}

REGION Galerie_ubruecke {
	FLOOR_HGT	0;
	CEIL_HGT		17;
	FLOOR_TEX	jaunedecke_tex;
	CEIL_TEX		blaudecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	EACH_TICK	choral_play1;
	FLAGS			SAVE,CEIL_LIFTED;
}

REGION Galerie_bruecke {
	FLOOR_HGT	20;
	CEIL_HGT		70;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	BELOW			Galerie_ubruecke;
}

REGION adam_ubruecke {
	FLOOR_HGT	-1;
	CEIL_HGT		17;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.9;
	IF_ENTER		HelterSkelter;
}

REGION Adam_bruecke {
	FLOOR_HGT	20;
	CEIL_HGT		80;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	BELOW			adam_ubruecke;
}

REGION Galerie {
	FLOOR_HGT	20;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		pixeldecke_tex;
	CLIP_DIST	450;
	AMBIENT		0;
	FLAGS			SAVE;
	IF_ENTER		HelterSkelter;
}
REGION Galerie_Lift1 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		glattdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.6;
	SKILL3		1;
	SKILL4		20;
	IF_ENTER		galerie_lift;
	FLAGS		SAVE;
}
ACTION galerie_lift {
	SET galerie_lift1.EACH_TICK, lift_start;
	SET galerie_lift2.EACH_TICK, lift_start;
}


REGION Galerie_Lift2 {
	FLOOR_HGT	20;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		glattdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.6;
	SKILL3		1;
	SKILL4		20;
	IF_ENTER		galerie_lift;
	FLAGS		SAVE;
}
REGION Galerie_Licht {
	FLOOR_HGT	20;
	CEIL_HGT		40;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		pixeldecke_tex;
	CLIP_DIST	450;
	AMBIENT		0;
}
REGION Galerie_Fenster_links {
	FLOOR_HGT	21;
	CEIL_HGT		39;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		pixeldecke_tex;
	AMBIENT		0.3;
	FLAGS			CEIL_LIFTED;
	IF_ENTER		HelterSkelter;
}
REGION Galerie_Fenster_rechts {
	FLOOR_HGT	21;
	CEIL_HGT		39;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		pixeldecke_tex;
	AMBIENT		0.3;
	FLAGS			CEIL_LIFTED;
}
REGION Empore_Stufe1 {
	FLOOR_HGT	21;
	CEIL_HGT		40;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	650;
	AMBIENT		0.5;
	IF_ENTER		message_out;
}

ACTION message_out {
	PLAY_SOUND holterdiepolter, 0.3;
	SET kreuzgang.IF_LEAVE, NULL;
}
REGION Empore_Stufe2 {
	FLOOR_HGT	22;
	CEIL_HGT		40;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	650;
	AMBIENT		0.5;
	IF_ENTER		HelterSkelter;
}
REGION Empore_Stufe3 {
	FLOOR_HGT	23;
	CEIL_HGT		40;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	650;
	AMBIENT		0.5;
	IF_ENTER		HelterSkelter;
}
REGION Empore_Stufe4 {
	FLOOR_HGT	24;
	CEIL_HGT		40;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	650;
	AMBIENT		0.5;
	IF_ENTER		HelterSkelter;
}
REGION Empore {
	FLOOR_HGT	24;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	AMBIENT		0.5;
	CLIP_DIST	650;
	EACH_TICK	choral_play2;
	IF_ENTER		HelterSkelter;
}
REGION schaltersockel {
	FLOOR_HGT	28;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	AMBIENT		0.5;
	CLIP_DIST	650;
}
REGION schalter {
	FLOOR_HGT	34;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	AMBIENT		0.5;
	CLIP_DIST	650;
}
REGION Baldachin {
	FLOOR_HGT	25;
	CEIL_HGT		38;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	AMBIENT		0.5;
	CLIP_DIST	450;
}

REGION Empore_Sockel {
	FLOOR_HGT	26;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	AMBIENT		0.5;
}

REGION Wandelgang {
	FLOOR_HGT	1;
	CEIL_HGT		20;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
  	AMBIENT		0.05;
	CLIP_DIST	500;
	EACH_TICK	choral_play3;
	IF_ENTER		soundset;
}
ACTION soundset {
	PLAY_SOUND	holterdiepolter, 0.2;
}
REGION M_TANK {
	FLOOR_HGT	2;
	CEIL_HGT		19;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
  	AMBIENT		0.05;
	CLIP_DIST	400;
	IF_ENTER		HelterSkelter;
}
REGION M_TANK_Nische {
	FLOOR_HGT	2;
	CEIL_HGT		19;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
  	AMBIENT		0.1;
	CLIP_DIST	300;
}
REGION M_TANK_Bogen {
	FLOOR_HGT	2.4;
	CEIL_HGT		17;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
  	AMBIENT		0.5;
	CLIP_DIST	250;
	IF_ENTER		HelterSkelter;
}
REGION M_TANK_Schiene {
	FLOOR_HGT	4;
	CEIL_HGT		17;
	FLOOR_TEX	streifenbodentex;
	CEIL_TEX		glattdecke_tex;
  	AMBIENT		0.2;
	IF_ENTER		HelterSkelter;
}
REGION Damage_Entree {
	FLOOR_HGT	2;
	CEIL_HGT		20;
	FLOOR_TEX	repairfloor_tex;
	CEIL_TEX		repairdecke_tex;
  	AMBIENT		0.05;
	CLIP_DIST	350;
	IF_ENTER		HelterSkelter;
}
REGION M_Damage_Sims {
	FLOOR_HGT	3;
	CEIL_HGT		19;
	FLOOR_TEX	lamellen_tex;
	CEIL_TEX		lamellen_tex;
  	AMBIENT		0.2;
	IF_ENTER		HelterSkelter;
}
REGION Wandelgang_nosound {
	FLOOR_HGT	1;
	CEIL_HGT		20;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
  	AMBIENT		0.05;
	CLIP_DIST	400;
}
REGION Wandelgang_Nische {
	FLOOR_HGT	2.5;
	CEIL_HGT		18;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		glattdeckeHell_tex;
	AMBIENT		1;
}
REGION Wandelgang_farbighell {
	FLOOR_HGT	1;
	CEIL_HGT		20;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		glattdeckeHell_tex;
	AMBIENT		0.06;
}
REGION Tueren {
	FLOOR_HGT	2;
	CEIL_HGT		16;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
	AMBIENT		0.2;
 	CLIP_DIST	450;
	FLAGS			SAVE;
	IF_ENTER		HelterSkelter;
}
REGION Rahmen {
	FLOOR_HGT	2.4;
	CEIL_HGT		15.6;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
	AMBIENT		0.2;
 	CLIP_DIST	450;
	IF_ENTER		HelterSkelter;
	IF_LEAVE		HelterSkelter;
}
REGION FegefeuerGate {
	FLOOR_HGT	1;
	CEIL_HGT		1;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
	SKILL3		1;
	SKILL4		15.6;
	SKILL6		1;
	FLAGS			FLAG3,FLAG4,FLAG6;
	AMBIENT		0;
 	CLIP_DIST	450;
	IF_ENTER		HelterSkelter;
	FLAGS		SAVE;
}

ACTION fegelift {
	SET FegefeuerGate.EACH_TICK,gate_up;
}

ACTION fegedown {
	SET FegefeuerGate.EACH_TICK,gate_down;
}

ACTION fegestart {
	SET FegefeuerGate.EACH_TICK,gate_start;
}

REGION daVinci {
	FLOOR_HGT	1;
	CEIL_HGT		16;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	AMBIENT		0.3;
 	CLIP_DIST	250;
	IF_ENTER		HelterSkelter;
}
REGION daVinci_sims {
	FLOOR_HGT	2;
	CEIL_HGT		15;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	AMBIENT		0.1;
	IF_ENTER		HelterSkelter;
}


REGION raffael {
	FLOOR_HGT	1;
	CEIL_HGT		12;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0;
	IF_ENTER		fill_it;
	FLAGS		SAVE;
}
REGION raffael_interface {
	FLOOR_HGT	1.2;
	CEIL_HGT		17;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	300;
	AMBIENT		0.4;
	IF_LEAVE		no_fill;
	FLAGS		SAVE;
}

REGION raffael_leiste {
	FLOOR_HGT	2;
	CEIL_HGT		11;
	FLOOR_TEX	streifenbodentex;
	CEIL_TEX		streifenbodentex;
	CLIP_DIST	300;
	AMBIENT		0;
}
REGION raffael_schacht {
	FLOOR_HGT	-10;
	CEIL_HGT		16;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0.5;
	SKILL3		-10;
	SKILL4		12;
	FLAGS			FLAG5,FLAG6;
	IF_ENTER		HelterSkelter;
	FLAGS		SAVE;
}

ACTION fill_it {SET raffael_schacht.EACH_TICK, lift_start;}
ACTION no_fill {SET raffael_schacht.EACH_TICK, NULL;}

REGION diChirico {
	FLOOR_HGT	1;
	CEIL_HGT		16;
	FLOOR_TEX	gruenboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	230;
	AMBIENT		0;
	EACH_TICK	LightUp1;
	IF_ENTER		HelterSkelter;
}
REGION diChirico_u {
	FLOOR_HGT	0;
	CEIL_HGT		14;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0;
}

REGION miro {
	FLOOR_HGT	1;
	CEIL_HGT		16;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0.3;
	IF_ENTER		sqaredancer;
	IF_LEAVE		sqarestander;
	FLAGS		SAVE;
}
ACTION sqaredancer {
	SET Kapelle.EACH_TICK, NULL;
	SET EMPORE.EACH_TICK, NULL;
	SET Wandelgang.EACH_TICK, NULL;
	PLAY_SONG scotch_ho,1;
}
ACTION sqarestander {
	PLAY_SOUND holterdiepolter, 0.1;
	SET Kapelle.EACH_TICK, choral_play1;
	SET Empore.EACH_TICK, choral_play2;
	SET Wandelgang.EACH_TICK, choral_play3;
	PLAY_SONG scotch_ho,0;
}


REGION miro_sims {
	FLOOR_HGT	3;
	CEIL_HGT		14;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	200;
	AMBIENT		0;
}

REGION fegefeuer {
	FLOOR_HGT	1;
	CEIL_HGT		21;
	FLOOR_TEX	rotwand_tex;
	CEIL_TEX		rotdecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	IF_ENTER		helterskelter;
	FLAGS		SAVE;
}

ACTION make_tense {
	PLAY_SOUND	holterdiepolter, 0.2;
	SET 			Kapelle.EACH_TICK, NULL;
	SET 			Empore.EACH_TICK, NULL;
	SET 			Wandelgang.EACH_TICK, NULL;
	PLAY_SONG	m_tense, 1;
}

REGION fegewasser {
	FLOOR_HGT	1.2;
	CEIL_HGT		21;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		glattdecke_tex;
	CLIP_DIST	500;
	AMBIENT		0.1;
	IF_ENTER		HelterSkelter;
	IF_LEAVE		stop_making_tense;
	FLAGS		SAVE;
}
ACTION stop_making_tense {
	PLAY_SONG	m_tense, 0;
}
REGION fegefeuer_treppe1 {
	FLOOR_HGT	0;
	CEIL_HGT		22;
	FLOOR_TEX	rotwand_tex;
	CEIL_TEX		rotdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.3;
	IF_ENTER		make_tense;
	FLAGS		SAVE;
}
REGION fegefeuer_treppe2 {
	FLOOR_HGT	-1;
	CEIL_HGT		22;
	FLOOR_TEX	rotwand_tex;
	CEIL_TEX		rotdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}


REGION fegefeuer_matma {
	FLOOR_HGT	-2;
	CEIL_HGT		22;
	SKILL1		-25;
	SKILL2		22;
	FLOOR_TEX	matma_unten;
	CEIL_TEX		rotdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.3;
	FLAGS			FLAG8;
	IF_DIVE		mat_abtauch;
	IF_ARISE		mat_auftauch;
	FLAGS			SAVE;
}

REGION mat_aufzug {	 #von rw angepasste Michelangelo-Version
	FLOOR_HGT	-2;
	CEIL_HGT		22;
	SKILL1		-25;
	SKILL2		22;
	SKILL3		-25;
	SKILL4		0;
	SKILL5		-2;
	SKILL6		0.3;

	FLOOR_TEX	matma_unten;
	CEIL_TEX		rotdecke_tex;
	TEXTURE1		jauneboden_tex;
	TEXTURE2		rotboden_tex;
	TEXTURE3		matma_unten;
	TEXTURE4		matma_oben;

  	CLIP_DIST	500;
	AMBIENT	   0.3;
	FLAGS			FLAG8;

	IF_ENTER		lift_start;
	IF_DIVE		mat_abtauch;
	IF_ARISE		mat_auftauch;
	FLAGS		SAVE;
}
ACTION mat_auftauch	{
	PLAY_SOUND	matmaschtalp,0.4;
	SET	fegefeuer_matma.FLOOR_HGT,	-2;
	SET	fegefeuer_matma.CEIL_HGT,	22;
	SET	fegefeuer_matma.FLOOR_TEX,	matma_unten;
	SET	fegefeuer_matma.CEIL_TEX,	rotdecke_tex;
	SET	mat_aufzug.CEIL_HGT,22;
	SET	mat_aufzug.CEIL_TEX,rotdecke_tex;
	SET 	mat_aufzug.FLOOR_HGT,-2;
	SET 	mat_aufzug.FLOOR_TEX,matma_unten;

	SET devil.INVISIBLE,0;
	SET devil.IF_HIT, seelenswitch;

	BRANCH		matma_arise;
}

ACTION mat_abtauch {
	PLAY_SOUND	Matmaplatsch,0.4;
	SET	fegefeuer_matma.FLOOR_HGT,	-26;
	SET	fegefeuer_matma.CEIL_HGT,	-2;
	SET	fegefeuer_matma.FLOOR_TEX,	umattex;
	SET	fegefeuer_matma.CEIL_TEX,matma_oben;
	SET	mat_aufzug.FLOOR_TEX,jauneboden_tex;
	SET	mat_aufzug.CEIL_HGT,-2;
	SET	mat_aufzug.CEIL_TEX,matma_oben;
	SET 	mat_aufzug.FLOOR_HGT,mat_aufzug.SKILL1;

	BRANCH		matma_dive;
}

REGION fegefeuer_box {
	FLOOR_HGT	7;
	CEIL_HGT		21;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	AMBIENT		0.4;
}




////////////////////////////////////////////////////////////////////////

REGION david {
	FLOOR_HGT	1;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.2;
	IF_ENTER		HelterSkelter;
}
REGION david_licht {
	FLOOR_HGT	1;
	CEIL_HGT		40;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.2;
}
REGION david_lichtnischen {
	FLOOR_HGT	2;
	CEIL_HGT		36;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		jaunedecke_tex;
	AMBIENT		0.9;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe1 {
	FLOOR_HGT	2;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe2 {
	FLOOR_HGT	3;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe3 {
	FLOOR_HGT	4;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe4 {
	FLOOR_HGT	5;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe5 {
	FLOOR_HGT	6;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe6 {
	FLOOR_HGT	7;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe7 {
	FLOOR_HGT	8;
	CEIL_HGT		45;
	FLOOR_TEX	blauschatten_tex;
	CEIL_TEX		blaudomdecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}
REGION david_treppe8 {
	FLOOR_HGT	9;
	CEIL_HGT		43;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
	IF_LEAVE		HelterSkelter;
}
REGION david_treppenreling1 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling2 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling3 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling4 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling5 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling6 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling7 {
	FLOOR_HGT	1;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_treppenreling8 {
	FLOOR_HGT	1;
	CEIL_HGT		43;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		blaudomdecke_tex;	//gotikblau_tex;
	AMBIENT		0.3;
	FLAGS			FLOOR_LIFTED;
}
REGION david_Erker {
	FLOOR_HGT	10;
	CEIL_HGT		50;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	500;
	AMBIENT		0.3;
}
REGION david_ErkerSockel {
	FLOOR_HGT	16.4;
	CEIL_HGT		50;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	500;
	AMBIENT		1;
	FLAGS			SAVE;
}

ACTION waffensockel {
	PLAY_SOUND	trigger,0.3;
	SET 	DavidWaffe_frei.TEXTURE, M_SwitchTex2;
	SET 	david_ErkerSockel.EACH_TICK, runter;
	SET 	davidwaffe_frei.IF_NEAR, NULL;
}
ACTION runter {
	PLAY_SOUND	sockel,0.2;
	ADD	david_ErkerSockel.FLOOR_HGT, -0.1;
	LIFT	david_ErkerSockel, -0.1;
	SET 	RENDER_MODE,1;
	IF_BELOW david_ErkerSockel.FLOOR_HGT, 10;
		SET 	david_ErkerSockel.EACH_TICK, NULL;
}

REGION david_Fenster_Links {
	FLOOR_HGT	10.7;
	CEIL_HGT		36;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		jaunedecke_tex;
	AMBIENT		0.05;
	FLAGS			CEIL_LIFTED;
}
REGION david_Fenster_Rechts {
	FLOOR_HGT	10.7;
	CEIL_HGT		36;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		jaunedecke_tex;
	AMBIENT		0.05;
	FLAGS			CEIL_LIFTED;
}
REGION david_Fenster_Licht {
	FLOOR_HGT	10;
	CEIL_HGT		50;
	FLOOR_TEX	farbschatten_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.2;
}
//////////////////////////////////////////////////////////////////////////

REGION goliath {
	FLOOR_HGT	1;
	CEIL_HGT		50;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	300;
	AMBIENT		0.3;
	IF_ENTER		HelterSkelter;
}
REGION goliath_reling {
	FLOOR_HGT	3;
	CEIL_HGT		40;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	AMBIENT		0.3;
	IF_ENTER		HelterSkelter;
}
REGION goliath_nische_links {
	FLOOR_HGT	-10;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.3;
	FLAGS			CEIL_LIFTED;
}
REGION goliath_nische_rechts {
	FLOOR_HGT	-10;
	CEIL_HGT		45;
	FLOOR_TEX	blauboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.3;
	FLAGS			CEIL_LIFTED;
}
REGION goliath_lift {
	FLOOR_HGT	1.5;
	CEIL_HGT		50;
	FLOOR_TEX	streifenbodentex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	300;
	SKILL3		-40;
	SKILL4		1.5;
	AMBIENT		0.6;
	IF_ENTER		lift_start;
	FLAGS		SAVE;
}
ACTION golli_start {SET goliath_lift.EACH_TICK, lift_start;}

REGION goliath_grund {
	FLOOR_HGT	-40;
	CEIL_HGT		50;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.2;
	FLAGS			SAVE;
	IF_ENTER		HelterSkelter;
}
REGION goliath_mauern {
	FLOOR_HGT	-25;
	CEIL_HGT		50;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		balkendecke_tex;
	SKILL3		-40.7;
	SKILL4		-25;
	CLIP_DIST	550;
	AMBIENT		0.1;
	FLAGS			SAVE;
	IF_ENTER		HelterSkelter;
}

ACTION waende_hoch {
	SET goliath_grund.IF_ENTER, NULL;
	SET goliath_mauern.EACH_TICK, lift_ab;
}
REGION goliath_matma_tuempel {
	FLOOR_HGT	-41;
	CEIL_HGT		50;
	FLOOR_TEX	matma_unten;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0.2;
	FLAGS			FLAG8,SAVE;
	SKILL1		-60;
	SKILL2		50;
	SKILL5		-41;
	TEXTURE1		umattex;
	TEXTURE2		balkendecke_tex;
	TEXTURE3		matma_unten;
	TEXTURE4		matma_oben;
	IF_DIVE		tuempel_flupp;
}

ACTION tuempel_flupp	{
	PLAY_SOUND	matmaplatsch,0.4;
		BRANCH regio_dive;
}

REGION goliath_geheimgang {
	FLOOR_HGT	-40;
	CEIL_HGT		-30;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	320;
	AMBIENT		0;
	IF_ENTER		HelterSkelter;
}
REGION goliath_geheimraum {
	FLOOR_HGT	-41;
	CEIL_HGT		-28;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	350;
	AMBIENT		0;
	FLAGS			SAVE;
	IF_ENTER		set_waende_hoch;
}
ACTION set_waende_hoch {SET Goliath_Grund.IF_ENTER, waende_hoch;}

REGION goliath_opcenter {
	FLOOR_HGT	-40;
	CEIL_HGT		-29;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	320;
	AMBIENT		0;
	IF_ENTER		Playerdark;
}
ACTION Playerdark { PLAY_SOUND Holterdiepolter, 0.2;	SET PLAYER_LIGHT, 0.7; }

REGION goliath_geheimtuer {
	FLOOR_HGT	-40;
	CEIL_HGT		-40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	SKILL3		-41;
	SKILL4		-30;
	FLAGS			FLAG3,FLAG4,FLAG6,SAVE;
	CLIP_DIST	220;
	AMBIENT		0;
}

REGION goliath_geheimtuer2 {
	FLOOR_HGT	-41;
	CEIL_HGT		-41;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	SKILL3		-41;
	SKILL4		-31;
	FLAGS			FLAG3,FLAG4,FLAG6,SAVE;
	CLIP_DIST	220;
	AMBIENT		0;
	IF_ENTER		helterskelter;
}

ACTION open_secret_door {
	SET goliath_geheimtuer.EACH_TICK, gate_up;
}

ACTION open_door2 {
   SET goliath_geheimtuer2.EACH_TICK, gate_up;
}

REGION goliath_opgang {
	FLOOR_HGT	-42;
	CEIL_HGT		-34;
	SKILL3		-52;
	SKILL4		-42;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	270;
	AMBIENT		0;
	FLAGS			FLAG4,FLAG6,SAVE;
	IF_ENTER		lift_start;
}

REGION goliath_opgang2 {
	FLOOR_HGT	-52;
	CEIL_HGT		-44;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	SKILL3		-62;
	SKILL4		-52;
	CLIP_DIST	200;
	AMBIENT		0;
	FLAGS			FLAG4,FLAG6,SAVE;
	IF_ENTER		lift_start;
}
ACTION opnosterstart1 {
	SET goliath_opgang.EACH_TICK, lift_start;
}
ACTION opnosterstart2 {
	SET goliath_opgang2.EACH_TICK, lift_start;
}
REGION goliath_opgang3 {
	FLOOR_HGT	-62;
	CEIL_HGT		-54;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	210;
	AMBIENT		0;
	FLAGS			SAVE;
	IF_ENTER		quetsche;
	IF_LEAVE		quetsche_stop;
}
REGION opquetsche1 {
	FLOOR_HGT	-63;
	CEIL_HGT		-54;
	SKILL3		-63;
	SKILL4		-54;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	SKILL6		0.8;
	FLAGS			FLAG5,FLAG6,SAVE;
	CLIP_DIST	210;
	AMBIENT		0.5;
}
REGION opquetsche2 {
	FLOOR_HGT	-63;
	CEIL_HGT		-54;
	SKILL3		-63;
	SKILL4		-55;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	SKILL6		0.6;
	FLAGS			FLAG5,FLAG6,SAVE;
	CLIP_DIST	210;
	AMBIENT		0.6;
}


ACTION quetsche {
	SET opquetsche1.EACH_TICK, lift_start;
	SET opquetsche2.EACH_TICK, lift_start;
}
ACTION quetsche_stop {
	SET opquetsche1.EACH_TICK, NULL;
	SET opquetsche2.EACH_TICK, NULL;
}

REGION goliath_opraum {
	FLOOR_HGT	-63;
	CEIL_HGT		-51;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	200;
	AMBIENT		0;
	IF_ENTER		helterskelter;
	IF_LEAVE		sqarestander;
	FLAGS		SAVE;
}
REGION opraum_schwelle {
	FLOOR_HGT	-62;
	CEIL_HGT		-52;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	200;
	AMBIENT		1;
}
REGION opraum_sockel {
	FLOOR_HGT	-57.6;
	CEIL_HGT		-51;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	200;
	AMBIENT		1;
}
#ACTION hymne {	SET PLAYER_LIGHT, 0.7;}
REGION goliath_opraumsims {
	FLOOR_HGT	-62;
	CEIL_HGT		-51;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	220;
	AMBIENT		0.2;
}

REGION opferbecken {
	FLOOR_HGT	-0.5;
	CEIL_HGT		60;
	FLOOR_TEX	rotwand_tex;
	CEIL_TEX		domdecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.8;
	IF_ENTER		chor_on;
}

ACTION chor_on {
	SET Kapelle.EACH_TICK, Choral_play1;
	SET Empore.EACH_TICK, Choral_play2;
}
REGION opferRippen {
	FLOOR_HGT	0;
	CEIL_HGT		55;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	400;
	AMBIENT		0.4;
	IF_ENTER		HelterSkelter;
}

REGION armaggeddon {
	FLOOR_HGT	1;
	CEIL_HGT		50;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		pixeldecke_tex;
	CLIP_DIST	350;
	AMBIENT		0.1;
	IF_ENTER		gna_lift_stop;
	FLAGS		SAVE;
}
REGION armaglifter {
	FLOOR_HGT	1;
	CEIL_HGT		50;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		pixeldecke_tex;
	CLIP_DIST	350;
	AMBIENT		0.1;
	IF_ENTER		gnaden_lift;
	FLAGS		SAVE;
}
REGION armag_enter {
	FLOOR_HGT	1;
	CEIL_HGT		50;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		pixeldecke_tex;
	CLIP_DIST	350;
	AMBIENT		0.1;
	IF_ENTER		helterskelter;
}

REGION simsdergnade {
	FLOOR_HGT	14;
	CEIL_HGT		40;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.3;
	IF_ENTER		HelterSkelter;
}
REGION simsdergnade_sims {
	FLOOR_HGT	15;
	CEIL_HGT		39;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	450;
	AMBIENT		0.2;
	IF_ENTER		HelterSkelter;
}
REGION gnadenlift {
	FLOOR_HGT	1.5;
	CEIL_HGT		40;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		pixeldecke_tex;
	SKILL3		1.5;
	SKILL4		14;
	SKILL6		0.4;
	FLAGS			FLAG5,FLAG6,SAVE;
	CLIP_DIST	350;
	AMBIENT		0.2;
	IF_LEAVE		helterskelter;
}

ACTION gnaden_lift {
	SET gnadenlift.EACH_TICK, lift_start;
}
ACTION gna_lift_stop {
	SET gnadenlift.EACH_TICK, NULL;
}

REGION transmitterraum {
	FLOOR_HGT	0.5;
	CEIL_HGT		30;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	350;
	AMBIENT		0;
	IF_ENTER		HelterSkelter;
}
REGION transmitterdiasims {
	FLOOR_HGT	1.5;
	CEIL_HGT		27.5;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		jaunedecke_tex;
	CLIP_DIST	200;
	AMBIENT		0.1;
}
REGION transmitterraum_sims {
	FLOOR_HGT	6.5;
	CEIL_HGT		9;
	FLOOR_TEX	rotboden_tex;
	CEIL_TEX		rotdecke_tex;
	CLIP_DIST	200;
	AMBIENT		0.5;
}

REGION Transmitter_Angelo {
	FLOOR_HGT	-1300;
	CEIL_HGT		 200;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0;
	IF_ENTER		warnung;
	FLAGS		SAVE;
}


ACTION transmit {
	CALL	schluss_aus;
}

REGION Trans_Ang_aussen {
	FLOOR_HGT	1;
	CEIL_HGT		20;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0.6;
}
REGION Transmitter_Diabolo {
	FLOOR_HGT	-80;
	CEIL_HGT		 200;
	FLOOR_TEX	jauneboden_tex;
	CEIL_TEX		balkendecke_tex;
	CLIP_DIST	200;
	AMBIENT		0;
	IF_ENTER		wegblas;
	FLAGS		SAVE;
}

ACTION wegblas {
	PLAY_SOUND harhar, 0.5;
	SET screen_msg.STRING,ciao;
	SET Transmitter_diabolo.EACH_TICK, ciao_babe;
	BRANCH show_message;
}
ACTION ciao_babe {
	WAITT 50;
	SET EACH_TICK.16, skaph_die;
}

////////////////////////////////////////////////////////////////////////
/////////////                ACTIONS                      /////////////
////////////////////////////////////////////////////////////////////////
/*
ACTION palette {
	FADE_PAL	pal1,1;
	PLAY_SOUND	HolterDiePolter,0.2;
}
*/
ACTION set_light {
	 PLAY_SOUND beamer,0.4;
#	 ADD raffael.AMBIENT, 0.5;
#	 SET MY.IF_NEAR, NULL;
}

SKILL	LIGHT_ON			{ VAL 0;	} #setzt den Lichtcounter
SKILL	LIGHT_CTDWN		{ VAL 2;	} #das ist der Lichtcounter

ACTION Flicker {
	IF_BELOW LIGHT_ON,0.5;	SET EACH_SEC.3,LightUp;
	IF_ABOVE LIGHT_ON,0.5;	SET EACH_SEC.3,LightOff; }

 ACTION LightUp  {
	  	SET 	diChirico.AMBIENT, 1;
		SET 	EACH_SEC.3,LightDwn; }

 ACTION LightDwn {
	  	SET 	diChirico.AMBIENT, 0;
	  	SET 	EACH_SEC.3,LightUp; }

 ACTION LightOff {
 	  	SET EACH_SEC.3,NULL;}

//////////////////////////////
SKILL	light_counter { VAL 0; }

ACTION LightUp1  {
	ADD		light_counter,1;
	SET 		diChirico.AMBIENT, 0;
	SET 		Goliath_opcenter.AMBIENT, 0;
	IF_BELOW	light_counter,10;
		END;
	SET 		diChirico.AMBIENT, 1;
	SET 		Goliath_opcenter.AMBIENT, 1;
	SET		light_counter,0;
}

//////////////////////////orgel-Actions//////////////////////

ACTION well_done {
	PLAY_SOUND halleluja, 0.2;
	ADD points,100;
	SET orgel_trigger.TEXTURE, M_SwitchTex2;
	SET orgel_trigger.IF_HIT, wellwell_done;
	SET op_schlange2.TEXTURE, drahtmodelltex;
	SET screen_msg.STRING,byby;
	SET_ALL trans_outside_wall.IF_NEAR, NULL;
	SET transmitter_angelo.IF_ENTER, transmit;
		BRANCH show_text;
}
ACTION wellwell_done {
	PLAY_SOUND halleluja, 0.2;
	ADD points,100;
	SET orgel_trigger.TEXTURE, M_SwitchTex1;
	SET orgel_trigger.IF_HIT, well_done;
	SET op_schlange2.TEXTURE, drahtmodelltex;
	SET screen_msg.STRING,byby;
	SET_ALL trans_outside_wall.IF_NEAR, NULL;
	SET transmitter_angelo.IF_ENTER, transmit;
		BRANCH show_text;
}

ACTION	display_note {
	PLAY_SOUND trigger, 0.5;
	SET	screen_msg.STRING,orgel;
	BRANCH show_text;
}

/////////////////////////////////////////////////////////
/*
ACTION test {
	SET	MOVE_MODE,0.5;
}

IF_M test;
*/
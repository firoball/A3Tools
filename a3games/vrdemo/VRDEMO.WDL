///////////////////////////////////////////////
// oP-Demo Nr. 2 - Demo Level for ACKNEX
// adapted to new release May 1998 (JCL)
///////////////////////////////////////////////
#DEFINE 	SVGA;
#DEFINE 	GUARD;
#DEFINE 	DEBUG;
///////////////////////////////////////////////
IFDEF 	SVGA;
#	VIDEO	S800x600;
	VIDEO	S640x480;
IFELSE;
#	VIDEO	X320x400;
	VIDEO	320x200;
ENDIF;

///////////////////////////////////////////////
NEXUS			40;
LIGHT_ANGLE	1.5;
SKILL 	my_val { VAL 0; }

FONT	standard_font,<panfont.bbm>,8,10;

MAPFILE	<vrdemw.WMP>;
BIND		<vrdemo.WDL>;

INCLUDE	<move.wdl>;
INCLUDE	<debug.wdl>;
INCLUDE	<info.wdl>;
INCLUDE	<adjust.wdl>;
INCLUDE	<menu.wdl>;
INCLUDE 	<mouse.wdl>;
//////////////////////////////////////////////////////////
// Startwerte
//////////////////////////////////////////////////////////
SKILL		MOTION_BLUR { VAL 0; }	// change with [F5]
#SKILL	BLUR_MODE 	{ VAL 1; }
#SKILL	AMBIENT		{ VAL 0.3; }
SKILL		PSOUND_VOL	{ VAL 1; }

SKILL 	COLOR_WALLS		{ VAL 16; }
SKILL 	COLOR_BORDER	{ VAL 32; }
SKILL 	COLOR_PLAYER	{ VAL 166; }
SKILL 	COLOR_WAYS 		{ VAL 179; }

//////////////////////////////////////////////////////////
// Sounds & Musik
//////////////////////////////////////////////////////////
SOUND 	Auftauch, <luft2.wav>;
SOUND 	WasserNorm, <water.wav>;
SOUND   	TapTap, <tap.wav>;
SOUND		Unterwasser_snd, <blubb.wav>;
SOUND		Lochwand, <ausfluss.wav>;
SOUND		stonedoor, <stdoor.wav>;
SOUND		stonelift, <stlift.wav>;

MUSIC		DemoSong, <ribanna.mid>;
#MUSIC		DemoSong, <bird2.mid>;
#IBANK		<rod.ibk>;

//////////////////////////////////////////////////////////
// PALETTEN
//////////////////////////////////////////////////////////

PALETTE black_pal {
	PALFILE <black.bbm>;
	RANGE 	16,16;
	RANGE 	32,16;
	RANGE 	48,16;
	RANGE 	64,16;
	RANGE 	80,16;
	RANGE 	96,16;
	RANGE 	112,16;
	RANGE 	128,8;
	RANGE 	136,8;
	RANGE 	144,8;
	RANGE 	152,8;
	RANGE 	160,16;
	RANGE 	176,16;
	RANGE 	192,16;
	RANGE 	208,16;
	RANGE 	226,16;
}
// Diese Palette muss die letzte sein (zum Einblenden!

PALETTE pal1 {
	PALFILE <vrpal.pcx>;
	RANGE 	16,16;
	RANGE 	32,16;
	RANGE 	48,16;
	RANGE 	64,16;
	RANGE 	80,16;
	RANGE 	96,16;
	RANGE 	112,16;
	RANGE 	128,8;
	RANGE 	136,8;
	RANGE 	144,8;
	RANGE 	152,8;
	RANGE 	160,16;
	RANGE 	176,16;
	RANGE 	192,16;
	RANGE 	208,16;
	RANGE 	226,16;
	FLAGS		BLUR;
}

#SKILL PALANIM_DELAY { VAL 4; }

/////////////////////////////////////////////////////////////
// Hilfs-Aktionen
/////////////////////////////////////////////////////////////
SKILL	fade { VAL 0; }

ACTION fade_in {
	SET		fade,0;
	WHILE  (fade<1) {
		RULE 	fade+=0.1;
		FADE_PAL	pal1,fade;
		WAIT	1;
	}
	FADE_PAL	pal1,3;
}

ACTION fade_out {
	SET		fade,0;
	WHILE  (fade<1) {
		RULE 	fade+=0.1;
		FADE_PAL	black_pal,fade;
		WAIT	1;
	}
	FADE_PAL	black_pal,1;
	EXIT	"Demo terminated.  (c) oP group / conitec 1996,1997,1998\n";
}

ACTION vrdemo_start {
	PLAY_SONG  DemoSong,0.5;
	CALL		set_walking;
IFDEF DEBUG;
	CALL		set_debug;
ENDIF;
	SET		my_size,5;	// Player sinks a little into the floor
	SET		set_overwater,dive_up;
}

IF_START	vrdemo_start;
IF_F10 	fade_out;


ACTION enter_water {
	PLAY_SOUND WasserNorm,0.8;
	CALL	set_swimming;
}

ACTION leave_water {
	CALL	set_walking;
}

ACTION dive_up {
	PLAY_SOUND Auftauch,0.8;
	CALL	reset_blue;
}
////////////////////////////////////////////////////////////////////
BMAP	dummy,<dummy.lbm>,0,0,4,4;
BMAP  opinfo,			<opinfo.lbm>;
BMAP  WasserWand1,	<wandtex.lbm>,0,0,64,128; #animierte Lochbogenwand
BMAP  WasserWand2,	<wandtex.lbm>,64,0,64,128;
BMAP  WasserWand3,	<wandtex.lbm>,128,0,64,128;
BMAP  WasserWand4,	<wandtex.lbm>,192,0,64,128;
BMAP  opgroup, 		<wandtex.lbm>,256,0,64,128;
BMAP  oPWerbung,	<wandtex.lbm>,256,128,192,128;
BMAP  BOGENWAND_map,	<wandtex.lbm>,320,0,64,128;
BMAP  Lochbogenwand,<wandtex.lbm>,384,0,64,128;
BMAP  Gitter, 		<wandtex.lbm>,0,128,64,64;
BMAP  Saeulen, 		<wandtex.lbm>,64,128,128,128;
BMAP  RandStreifen1_map,<wandtex.lbm>,192,128,16,128;
BMAP  TreppenStufe, <wandtex.lbm>,0,192,64,64;
BMAP  Inka1,		<wandtex.lbm>,192,128,128,128;

BMAP  wass1, 		<wasser.lbm>,0,0,64,64; # Wasseroberflaeche 10 Phasen
BMAP  wass2, 		<wasser.lbm>,64,0,64,64;
BMAP  wass3, 		<wasser.lbm>,128,0,64,64;
BMAP  wass4, 		<wasser.lbm>,192,0,64,64;
BMAP  wass5, 		<wasser.lbm>,256,0,64,64;
BMAP  wass6, 		<wasser.lbm>,0,64,64,64;
BMAP  wass7, 		<wasser.lbm>,64,64,64,64;
BMAP  wass8, 		<wasser.lbm>,128,64,64,64;
BMAP  wass9, 		<wasser.lbm>,192,64,64,64;
BMAP  wass10,		<wasser.lbm>,256,64,64,64;
BMAP  Bachwasser1, 	<wasser.lbm>,0,128,64,64;
BMAP  Bachwasser2, 	<wasser.lbm>,64,128,64,64;
BMAP  Bachwasser3, 	<wasser.lbm>,128,128,64,64;
BMAP  Bachwasser4, 	<wasser.lbm>,192,128,64,64;
BMAP  OberWASSER1, 	<Oberwass.lbm>,0,0,64,64;
BMAP  OberWASSER2, 	<Oberwass.lbm>,64,0,64,64;
BMAP  OberWASSER3, 	<Oberwass.lbm>,128,0,64,64;
BMAP  OberWASSER4, 	<Oberwass.lbm>,192,0,64,64;
BMAP  OberWASSER5, 	<Oberwass.lbm>,0,64,64,64;
BMAP  OberWASSER6, 	<Oberwass.lbm>,64,64,64,64;
BMAP  OberWASSER7, 	<Oberwass.lbm>,128,64,64,64;
BMAP  OberWASSER8, 	<Oberwass.lbm>,192,64,64,64;
BMAP  OberWASSER9, 	<Oberwass.lbm>,0,128,64,64;
BMAP  OberWASSER10, <Oberwass.lbm>,64,128,64,64;

BMAP  Kassettendeck, 	<bodentex.lbm>,0,0,128,128;
BMAP  HarryBoden, 		<bodentex.lbm>,128,0,128,128;
BMAP  Erddecke, 		<bodentex.lbm>,0,128,128,128;
BMAP  Inkadecke,		<wandtex.lbm>,192,128,192,128;

BMAP  Platten,	<boden1.lbm>,0,0,256,256;

BMAP  Rumpelkammerwand, <rumpwand.lbm>,0,0,256,256;
BMAP  Standardgangwand, <gang1.lbm>,0,0,256,256;
BMAP  HolzDecke, <bodentex.lbm>,0,128,128,128;
BMAP  SchlammBoden, <schlamm.lbm>,0,0,256,256;
BMAP  Kachelboden, <wabdreck.lbm>,0,0,128,128;
BMAP  KachelDreck, <wabdreck.lbm>,0,0,128,128;
BMAP  RostigeMauer, <rostmau.lbm>,0,0,256,256;
BMAP  RostigeDecke, <rostmau.lbm>,0,0,256,256;
BMAP  RissigeWand, <rostmau.lbm>,0,0,256,256;
/*
BMAP  WasserRadL1, <radwl1.lbm>,0,0,369,256;
BMAP  WasserRadL2, <radwl2.lbm>,0,0,369,256;
BMAP  WasserRadL3, <radwl3.lbm>,0,0,369,256;
BMAP  WasserRadL4, <radwl4.lbm>,0,0,369,256;
BMAP  WasserRadL5, <radwl5.lbm>,0,0,369,256;
BMAP  WasserRadL6, <radwl6.lbm>,0,0,369,256;
BMAP  WasserRadL7, <radwl7.lbm>,0,0,369,256;
BMAP  WasserRadL8, <radwl8.lbm>,0,0,369,256;
BMAP  WasserRadL9, <radwl9.lbm>,0,0,369,256;
BMAP  WasserRadL10, <radwl10.lbm>,0,0,369,256;
BMAP  WasserRadL11, <radwl11.lbm>,0,0,369,256;
BMAP  WasserRadL12, <radwl12.lbm>,0,0,369,256;
*/
BMAP  Frankfurt, <bigcity5.lbm>; #HintergrundBild, Panorama
#Objekte
////////////////////////////////////////////////////////
WAY  tourguide;
BMAP Skelett, <skelett.lbm>,1,1,179,121;
BMAP Ring, <ring.lbm>,0,1,65,165;

IFDEF GUARD;
	MODEL hero_mod,<guardemo.mdl>;
	SKILL ACTOR_WIDTH { VAL 0.3; }

	TEXTURE guard_tex {
		SCALE_XY	12,12;
		MODEL 	hero_mod;
	#	FLAGS		CLUSTER;
	#	FLAGS		WIRE;

		FONT		standard_font;
		TOUCH		"Follow me!";

		DELAY		2;
		AMBIENT	0.5;

		SOUND   	TapTap;
		SCYCLE	2;
		SVOL		0.4;
		SDIST		100;
	}

IFELSE;
	BMAP sphere_map, <kugeli.lbm>,0,0,81,69;
	TEXTURE guard_tex {
		SCALE_XY	40,40;
		BMAPS 	sphere_map;
	#	FLAGS		DIAPHANOUS;
		FONT		standard_font;
		TOUCH		"Follow me!";

		AMBIENT	0.5;
	}
ENDIF;

	// shadow
	BMAP shd_h1_map,<shd_h.pcx>,0,0,94,13;
	TEXTURE guard_shd {
		SCALE_XY	20,14;
		BMAPS		shd_h1_map;
#		POS_Y		-5;
		POS_X		20;
		FLAGS		DIAPHANOUS,BEHIND,SHADOW;
	}

/*TEXTURE sphere_atex {
	SCALE_XY	80,80;
	BMAPS 	sphere_map;	//ring;#,Kugel2,Kugel3,Kugel2;
	POS_X		0;
	POS_Y		0;
	AMBIENT	1;
	FLAGS		DIAPHANOUS,BEHIND,SHADOW;
}*/

ACTOR sphere {
	TEXTURE 		guard_tex;
IFDEF GUARD;
	FLAGS			GROUND;
	HEIGHT		-4;
	ATTACH		guard_shd;
	SPEED			0.15;
	ASPEED		0.15;
#	IF_ARRIVED	rest;
#	EACH_CYCLE	bep;
IFELSE;
	HEIGHT		3;
	SPEED			0.4;
	FLAGS			BERKELEY;
	EACH_TICK	Pulsup;
ENDIF;
	TARGET		Tourguide;
	FLAGS			CAREFULLY,MASTER,FAR;	//,IMPASSABLE;
#	ATTACH		sphere_atex;
#	IF_NEAR		change_body;
}

TEXTURE RingTex {
	SCALE_XY	32,24;
	BMAPS		Ring;
#	FONT		standard_font;
#	TOUCH		"Touchee!";
}

ACTOR brunnengeist {
	TEXTURE 		RingTex;
	FLAGS			BERKELEY;
}


ACTION Pulsup {
	ADD sphere.AMBIENT,0.1;
	IF_ABOVE sphere.AMBIENT,1;
		SET sphere.EACH_TICK,Pulsdown;
}

ACTION Pulsdown {
	ADD sphere.AMBIENT,-0.1;
	IF_BELOW sphere.AMBIENT,0;
		SET sphere.EACH_TICK,Pulsup;
}

///////////////////////////////////////////////

TEXTURE  dummyTex {
	SCALE_XY	16,16;
	BMAPS 		dummy;
}

TEXTURE  oPinfoTex {
	SCALE_XY	16,30;
	BMAPS 		opinfo;
	AMBIENT	1;
}


TEXTURE  oPTex {
	SCALE_XY	10,10;
	BMAPS 		oPWerbung;

}

TEXTURE  oPTexSolo {
	SCALE_XY	10,10;
	CYCLES	3;
	BMAPS 	opgroup,oPWerbung,opgroup;
	DELAY		2,2,2;
	FLAGS		ONESHOT;
}


# ALLES RAEDER ODER WASS?

TEXTURE BachWasserTex {
	SCALE_XY	10,10;
	CYCLES		4;
	BMAPS 		BachWasser1,BachWasser2,BachWasser3,BachWasser4;
	DELAY		1,1,1,1;
    SOUND		WasserNorm;
	SDIST		60;
}

TEXTURE  TreppenstufeTex {
	SCALE_XY	20,20;
	BMAPS		TreppenStufe;
}

TEXTURE  Randstreifen1Tex {
	SCALE_XY	20,20;
	BMAPS		Randstreifen1_map;
}

TEXTURE  SaeulenTex {
	SCALE_XY	55,55;
	BMAPS		Saeulen;
	AMBIENT 	0.3;
	ALBEDO	0.8;
}

TEXTURE  KassettendeckTex {
	SCALE_XY	16,16;
	BMAPS		Kassettendeck;
}

TEXTURE InkadeckeTex {
	SCALE_XY	5,5;
	BMAPS		KassettenDeck;
}


TEXTURE  SkelettTex {
	SCALE_XY	30,30;
	BMAPS		Skelett;
	AMBIENT	0.5;
}


TEXTURE  PlattenTex {
	SCALE_XY	16,16;
	SOUND		TapTap;
	BMAPS		Platten;
}

TEXTURE  BalkonBodTex {
	SCALE_XY	16,16;
	BMAPS		Platten;
}

TEXTURE  Wasseroberflaeche {
	SCALE_XY	10,10;
	CYCLES		10;
	BMAPS 		wass1,wass2,wass3,wass4,wass5,wass6,wass7,wass8,wass9,wass10;
	DELAY		2,2,2,2,2,2,2,2,2,2;
	SOUND		WasserNorm;
}


#FONT	title_font,<panfont.bbm>,8,10;
#FONT title_font,<sut_font.pcx>,25,32;

/*BMAP	light_map,<lightmap.bbm>;
TEXTURE	light_tex {
	SCALE_XY	16,16;
	CYCLES	4;
	BMAPS		light_map,light_map,light_map,light_map;
#	FLAGS		LIGHTMAP;
	POS_X		1463;
	POS_Y		42;
}*/

/*
TEXTURE	title_tex {
	SCALE_XY	16,16;
	FONT		title_font;
	TITLE		"Test1! \nTest2! \nTest3! \nTest4! ";	//title_str;
	POS_X		1240;
	POS_Y		0;
}
*/
TEXTURE  Ausflusswand{
	SCALE_XY		10,10;
	CYCLES		4;
	BMAPS 		Wasserwand1,Wasserwand2,Wasserwand3,Wasserwand4;
	DELAY			1,1,1,1;
   SOUND			Lochwand;
	FLAGS			SLOOP;
	SVOL			0.3;
	SDIST			100;
#	ATTACH		title_tex;
#	FONT			title_font;
#	TITLE			"Test1! \nTest2! \nTest3! \nTest4! ";	//title_str;
}


TEXTURE  FrankfurtTex {
	SIDES		6;
	BMAPS		Frankfurt,Frankfurt,Frankfurt,Frankfurt,Frankfurt,Frankfurt;
	FLAGS		SKY;
}

TEXTURE  Wasserunterflaeche {
	SCALE_XY		10,10;
	CYCLES		10;
	BMAPS 		OberWasser1,OberWasser2,OberWasser3,OberWasser4,OberWasser5,OberWasser6,OberWasser7,OberWasser8,OberWasser9,OberWasser10;
	DELAY		2,2,2,2,2,2,2,2,2,2;
	SOUND			Unterwasser_snd;
}


TEXTURE  InkaTex {
	SCALE_XY	20,20;
	BMAPS 		KassettenDeck;
	AMBIENT		-0.2;
}


TEXTURE  Bogenwand_tex {
	SCALE_XY	10,10;
	BMAPS 		Bogenwand_map;
}


TEXTURE  Speibogenwand {
	SCALE_XY	10,10;
	BMAPS 		Lochbogenwand;
}

TEXTURE  Rumpelwand {
	SCALE_XY	30,30;
	BMAPS 		Rumpelkammerwand;
}
TEXTURE  Rumpel_klein {
	SCALE_XY	40,40;
	BMAPS 		Rumpelkammerwand;
}

TEXTURE  Erdhimmel {
	SCALE_XY	10,10;
	BMAPS 		Erddecke;
}

TEXTURE  HolzDeckeTex {
	SCALE_XY	20,20;
	BMAPS 		HolzDecke;
}

TEXTURE  Unterwassermauer {
	SCALE_XY	40,40;
//	BMAPS 		Unterwasserwand;
	BMAPS 		Standardgangwand;
}

TEXTURE  Standardgang {
	SCALE_XY	50,48;
	BMAPS 		Standardgangwand;
}
TEXTURE  Standardgang_dunkel {
	SCALE_XY	50,48;
	BMAPS 		Standardgangwand;
	AMBIENT		-0.3;
}
TEXTURE  Standardgang_klein {
	SCALE_XY	70,88;
	BMAPS 		Standardgangwand;
}
TEXTURE  geheimtuer_tex {
	SCALE_XY	50,48;
	BMAPS 		Standardgangwand;
}

TEXTURE  GeheimeThermeTex {
	SCALE_XY		20,20;
	BMAPS 		RostigeMauer;
}


TEXTURE  galeriewand {
	SCALE_XY	50,48;
	BMAPS 		Standardgangwand;
}

TEXTURE  GangDeckeTex {
	SCALE_XY	120,120;
	BMAPS 		Standardgangwand;
}

TEXTURE TreppenAbsatzTex {
	SCALE_XY	100,100;
	BMAPS		Standardgangwand;
}

TEXTURE  SchlammbodenTex {
	SCALE_XY	20,20;
	SOUND		Unterwasser_snd;
	BMAPS 		SchlammBoden;
}
TEXTURE  Schlammboden_dunkelTex {
	SCALE_XY		30,30;
	BMAPS 		SchlammBoden;
}
TEXTURE  Schlammboden_sehrdunkel {
	SCALE_XY		30,30;
	BMAPS 		SchlammBoden;
	AMBIENT		-0.6;
}

TEXTURE  Kachelfussboden {
	SCALE_XY	15,15;
	SOUND		TapTap;
	BMAPS 		Kachelboden;
}

TEXTURE  SchmutzKachelboden {
	SCALE_XY	20,20;
	SOUND		TapTap;
	BMAPS 		KachelDreck;
}

TEXTURE  HarryBodenTex {
	SCALE_XY	20,20;
	SOUND		TapTap;
	BMAPS 		HarryBoden;
}

TEXTURE  RostigeMauerTex {
	SCALE_XY	20,20;
	BMAPS 		RostigeMauer;
}

TEXTURE  RostigeDeckeTex {
	SCALE_XY	20,20;
	BMAPS 		RostigeMauer;
}

TEXTURE  RostigeMauerKlein {
	SCALE_XY	45,45;
	BMAPS 		RostigeMauer;
	AMBIENT		-0.1;
}

TEXTURE  RostigeDeckeKlein {
	SCALE_XY	45,45;
	BMAPS 		RostigeMauer;
}

TEXTURE  RumpelkammerSockelBoden {
	SCALE_XY	20,20;
	BMAPS 		RostigeMauer;
}

TEXTURE  ThermeBoden {
	SCALE_XY	20,20;
	SOUND	TapTap;
	BMAPS 		RostigeMauer;
}

TEXTURE  RissigeWandTex {
	SCALE_XY	20,20;
	BMAPS 		RostigeMauer;
}

TEXTURE  GitterTex {
	SCALE_XY	30,30;
	BMAPS 		Gitter;
}


///////////////////////////////////////////////

REGION Border {
	FLOOR_HGT	40;
	CEIL_HGT		40;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		PlattenTex;
	CLIP_DIST	0;
}

REGION Therme {
	FLOOR_HGT	1.0;
	CEIL_HGT		13.5;
	AMBIENT		0.2;
	FLOOR_TEX	ThermeBoden;
	CEIL_TEX		RostigeMauerTex;
	IF_ENTER 	leave_water;
	CLIP_DIST	250;
}
REGION Geheimgang2 {
	FLOOR_HGT	0;
	CEIL_HGT		6.0;
	FLOOR_TEX	ThermeBoden;
	CEIL_TEX		RostigeMauerTex;
	CLIP_DIST	200;
}

REGION Geheimgang1 {
	FLOOR_HGT	0;
	CEIL_HGT		10.0;
	FLOOR_TEX	ThermeBoden;
	CEIL_TEX		RostigeMauerTex;
	CLIP_DIST	200;
}

REGION GeheimTuer {
	FLOOR_HGT	2.3;
	CEIL_HGT		2.3;
	FLOOR_TEX	ThermeBoden;
	CEIL_TEX		RostigeMauerTex;
	CLIP_DIST	200;
}


REGION ThermenSims {
	FLOOR_HGT	2.6;
	CEIL_HGT		13.5;
	AMBIENT		0;
	FLOOR_TEX	RostigeMauerTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	200;
}

BMAP light_fmap,<lightmap.pcx>;
TEXTURE	light_ftex {
	BMAPS	light_fmap;
	FLAGS	LIGHTMAP;
}

REGION MoreoE3 {
	FLOOR_HGT	0.8;
	CEIL_HGT		12.5;
#	FLOOR_TEX	light_ftex;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		KassettendeckTex;
#	TEXTURE1		light_ftex;
#	TEXTURE2		light_ftex;
	IF_ENTER 	leave_water;
	CLIP_DIST	250;
}
REGION MoreoE3Schraegen {
	FLOOR_HGT	0.9;
	CEIL_HGT		12.5;
	FLOOR_TEX	Schlammboden_dunkelTex;
	CEIL_TEX		KassettendeckTex;
	FLAGS			FLOOR_LIFTED;
}
REGION GrosseHalle {
	FLOOR_HGT	1.0;
	CEIL_HGT		16.0;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	600;
}
REGION HallenTore {
	FLOOR_HGT	1.0;
	CEIL_HGT		9.0;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	600;
}

REGION GrosserGraben {
	FLOOR_HGT	-100.0;
	CEIL_HGT		80.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	200;
}


REGION E5Pavillon {
	FLOOR_HGT	15.5;
	CEIL_HGT		32.0;
	AMBIENT		0.5;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	200;
#	IF_ENTER		nojump;
#	IF_LEAVE		jump_again;
}

REGION E5PavillonStufe {
	FLOOR_HGT	14.0;
	CEIL_HGT		32.0;
	AMBIENT		0.4;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	200;
}

REGION Rumpelkammer{
	FLOOR_HGT	15.5;
	CEIL_HGT		28.5;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		HolzDeckeTex;
	CLIP_DIST	200;
}
REGION Rumpelkammertuer{
	FLOOR_HGT	16.5;
	CEIL_HGT		21.5;
	FLOOR_TEX	SchmutzKachelBoden;
	CEIL_TEX		PlattenTex;
	AMBIENT		0.1;
	CLIP_DIST	200;
}

REGION RumpelkammerBalkon{
	FLOOR_HGT	15.5;
	CEIL_HGT		52.5;
	CEIL_OFFS_Y	25;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		FrankfurtTex;
	AMBIENT		1;
	CLIP_DIST	200;
}

REGION BalkonBruestung{
	FLOOR_HGT	18.8;
	CEIL_HGT		52.5;
	CEIL_OFFS_Y	25;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		FrankfurtTex;
	AMBIENT		1;
	CLIP_DIST	200;
#	IF_ENTER		suizid;
}

#ACTION suizid { DO	skaph_exit; }
////////////Wasser/////////////////////////
REGION under_watertank {
	FLOOR_HGT	-51;
	CEIL_HGT		-4;
	FLOOR_TEX	SchlammbodenTex;
	CEIL_TEX		Wasserunterflaeche;
	IF_ARISE 	regio_arise;
}

REGION WasserTank{
	FLOOR_HGT	-4;
	CEIL_HGT		40;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	500;
	BELOW			under_watertank;
	IF_DIVE 		regio_dive;
}

REGION water_base {
	FLOOR_HGT	-51;
	CEIL_HGT		40;
	FLOOR_TEX	SchlammbodenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	500;
}

REGION under_waterbridge {
	FLOOR_HGT	-51;
	CEIL_HGT		-4;
	FLOOR_TEX	SchlammbodenTex;
	CEIL_TEX		Wasserunterflaeche;
	IF_ARISE 	regio_arise;
}

REGION under_bridge {
	FLOOR_HGT	-4;
	CEIL_HGT		3;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	500;
	BELOW			under_waterbridge;
	IF_DIVE 		regio_dive;
}

REGION bridge {
	FLOOR_HGT	5;
	CEIL_HGT		40;
	FLOOR_TEX	KassettendeckTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	500;
	BELOW			under_bridge;
}

REGION under_KerkerWass2{
	FLOOR_HGT	-8;
	CEIL_HGT		0.2;
	FLOOR_TEX	SchlammbodenTex;
	CEIL_TEX		Wasserunterflaeche;
	CLIP_DIST	200;
	IF_ARISE 	regio_arise;
}

REGION KerkerWass2{
	FLOOR_HGT	0.2;
	CEIL_HGT		4.0;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	200;
	BELOW			under_KerkerWass2;
	IF_DIVE 		regio_dive;
}

REGION under_Pool {
	FLOOR_HGT	-8;
	CEIL_HGT		0.2;
	FLOOR_TEX	SchlammbodenTex;
	CEIL_TEX		Wasserunterflaeche;
	AMBIENT		0.4;
	CLIP_DIST	200;
	IF_ARISE 	regio_arise;
}

REGION Pool {
	FLOOR_HGT	0.2;
	CEIL_HGT		15.5;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		KassettendeckTex;
	AMBIENT		0.7;
	CLIP_DIST	200;
	BELOW			under_Pool;
	IF_DIVE 		regio_dive;
}

REGION under_MoreoE2{
	FLOOR_HGT	-7.6;
	CEIL_HGT		0.2;
	FLOOR_TEX	SchlammbodenTex;
	CEIL_TEX		Wasserunterflaeche;
	CLIP_DIST	300;
	IF_ARISE 	regio_arise;
}

REGION MoreoE2{
	FLOOR_HGT	0.2;
	CEIL_HGT		12.5;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;
	BELOW			under_MoreoE2;
	IF_DIVE 		regio_dive;
}

REGION BlubberMeile {
	FLOOR_HGT	-7.5;
	CEIL_HGT		-2.0;
	FLOOR_TEX	RostigeDeckeKlein;
	CEIL_TEX		RostigeDeckeKlein;
	CLIP_DIST	300;
}
REGION BlubberMeile_Entree {
	FLOOR_HGT	-7;
	CEIL_HGT		-2.5;
	FLOOR_TEX	Schlammboden_dunkelTex;
	CEIL_TEX		Schlammboden_sehrdunkel;
	CLIP_DIST	300;
	AMBIENT		0;
}
REGION BlubberMeile_rechts1 {
	FLOOR_HGT	-7;
	CEIL_HGT		-2.5;
	FLOOR_TEX	Schlammboden_dunkelTex;
	CEIL_TEX		Schlammboden_dunkelTex;
	CLIP_DIST	200;
	FLAGS			FLOOR_LIFTED;
	FLAGS			CEIL_LIFTED;
}
REGION BlubberMeile_rechts {
	FLOOR_HGT	-7.5;
	CEIL_HGT		-2.0;
	FLOOR_TEX	RostigeDeckeKlein;
	CEIL_TEX		RostigeDeckeKlein;
	CLIP_DIST	200;
	FLAGS			FLOOR_LIFTED;
	FLAGS			CEIL_LIFTED;
}
REGION BlubberMeile_links1 {
	FLOOR_HGT	-7;
	CEIL_HGT		-2.5;
	FLOOR_TEX	Schlammboden_dunkelTex;
	CEIL_TEX		Schlammboden_dunkelTex;
	CLIP_DIST	200;
	FLAGS			FLOOR_LIFTED;
	FLAGS			CEIL_LIFTED;
}
REGION BlubberMeile_links {
	FLOOR_HGT	-7.5;
	CEIL_HGT		-2.0;
	FLOOR_TEX	RostigeDeckeKlein;
	CEIL_TEX		RostigeDeckeKlein;
	CLIP_DIST	200;
	FLAGS			FLOOR_LIFTED;
	FLAGS			CEIL_LIFTED;
}

REGION LichtschachtWasser {
	FLOOR_HGT	2.0;
	CEIL_HGT		5.0;
	AMBIENT		0.2;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		PlattenTex;
}

REGION BachWasser {
	FLOOR_HGT	0.9;
	CEIL_HGT		16.0;
	FLOOR_TEX	BachwasserTex;
	CEIL_TEX		KassettendeckTex;
}

///////////////G„nge/////////////////

REGION GangE4Monty {
	FLOOR_HGT	9;
	CEIL_HGT	22.0;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		HolzdeckeTex;
	CLIP_DIST	200;
}

REGION GangE4Schwelle {
	FLOOR_HGT	15;
	CEIL_HGT		21;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		PlattenTex;
	AMBIENT		1;
	CLIP_DIST	200;
}


REGION GangE4Dizzy {
	FLOOR_HGT	15;
	CEIL_HGT		26.0;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		Erdhimmel;
	CLIP_DIST	200;
}

REGION GangE3Felix {
	FLOOR_HGT	1.5;
	CEIL_HGT		11.0;
	FLOOR_TEX	SchmutzKachelboden;
	CEIL_TEX		Erdhimmel;
	CLIP_DIST	350;
}

REGION GangE3Niko {
	FLOOR_HGT	0;
	CEIL_HGT	8.0;
	FLOOR_TEX	SchmutzKachelBoden;
	CEIL_TEX		Erdhimmel;
	CLIP_DIST	350;
}

REGION GangE4Galeria {
	FLOOR_HGT	5;
	CEIL_HGT		22.0;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		KassettendeckTex;
	AMBIENT		0.2;
	CLIP_DIST	350;

}
REGION GaleriaRand {
	FLOOR_HGT	5.5;
	CEIL_HGT		22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		KassettendeckTex;
	AMBIENT		0.4;
	CLIP_DIST	350;

}
REGION GaleriaRandS {
	FLOOR_HGT	5.5;
	CEIL_HGT		22.0;
	FLOOR_TEX	Schlammboden_dunkelTex;
	CEIL_TEX		KassettendeckTex;
	AMBIENT		0;
	FLAGS			FLOOR_LIFTED;

}
REGION DunkelGang {
	FLOOR_HGT	-1.0;
	CEIL_HGT		6.0;
	FLOOR_TEX	Schmutzkachelboden;
	CEIL_TEX		RostigeDeckeTex;
	CLIP_DIST	300;
}
REGION DunkelGangSperre {
	FLOOR_HGT	-1.0;
	CEIL_HGT		-2.0;
	FLOOR_TEX	Schmutzkachelboden;
	CEIL_TEX		RostigeDeckeTex;
	CLIP_DIST	200;
}


////////////Licht+Fenster//////////////////////

REGION HallenFensterLicht {
	FLOOR_HGT	1.0;
	CEIL_HGT		16.0;
	AMBIENT		0.5;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;
}

REGION Fenster {
	FLOOR_HGT	2.2;
	CEIL_HGT		6.6;
	AMBIENT		0.5;
	FLOOR_TEX	Standardgang;
	CEIL_TEX		Standardgang;
	CLIP_DIST	300;
}

REGION FensterLicht {
	FLOOR_HGT	0;
	CEIL_HGT		8;
	AMBIENT		0.5;
	FLOOR_TEX	SchmutzKachelBoden;
	CEIL_TEX		Erdhimmel;
	CLIP_DIST	300;
}


REGION GangE3Fenster {
	FLOOR_HGT	0;
	CEIL_HGT	8.0;
	FLOOR_TEX	SchmutzKachelBoden;
	CEIL_TEX	Erdhimmel;
	CLIP_DIST	300;
}

REGION GangE3Fenster2 {
	FLOOR_HGT	1;
	CEIL_HGT	8.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	Erdhimmel;
	CLIP_DIST	300;
}


REGION RumpelFenster {
	FLOOR_HGT	17.5;
	CEIL_HGT		22.5;
	FLOOR_TEX	Standardgang;
	CEIL_TEX		Standardgang;
	CLIP_DIST	200;
}
REGION RumpelFenster_links {
	FLOOR_HGT	18.5;
	CEIL_HGT		22;
	FLOOR_TEX	Standardgang;
	CEIL_TEX		Standardgang;
	CLIP_DIST	200;
#	FLAGS			CEIL_LIFTED;
}
REGION RumpelFenster_rechts {
	FLOOR_HGT	18.5;
	CEIL_HGT		22;
	FLOOR_TEX	Standardgang;
	CEIL_TEX		Standardgang;
	CLIP_DIST	200;
#	FLAGS			CEIL_LIFTED;
}

REGION RumpelFensterLicht {
	FLOOR_HGT	15.5;
	CEIL_HGT		26.5;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		HolzDeckeTex;
	AMBIENT		0.8;
	CLIP_DIST	200;
}


///////////////šberg„nge+Sockel//////////////////////

REGION HallenSockel {
	FLOOR_HGT	2.6;
	CEIL_HGT		16.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	250;
}

REGION HallenSockelLicht {
	FLOOR_HGT	2.6;
	CEIL_HGT		10.0;
	AMBIENT		1;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		SchmutzKachelBoden;
	CLIP_DIST	250;
}

REGION SaeulenKreis {
	FLOOR_HGT	2.0;
	CEIL_HGT	30.0;
	AMBIENT		0.5;
	FLOOR_TEX	Wasseroberflaeche;
	CEIL_TEX		KassettendeckTex;
	AMBIENT		0;
	CLIP_DIST	250;
}

REGION SaeulenRand {
	FLOOR_HGT	2.8;
	CEIL_HGT	30.0;
	FLOOR_TEX	GangDeckeTex;
	CEIL_TEX		KassettendeckTex;
	AMBIENT		0.1;
	CLIP_DIST	250;
#	GENIUS		brunnengeist;
}

REGION Lichtschacht {
	FLOOR_HGT	2.0;
	CEIL_HGT	5.0;
	AMBIENT		1;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	PlattenTex;
	CLIP_DIST	250;
}



REGION oP_Schwelle {
	FLOOR_HGT	5;
	CEIL_HGT	16.5;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		HarryBodenTex;
	CLIP_DIST	350;

}

REGION Secret_Door {
	FLOOR_HGT	5;
	CEIL_HGT		5;
	FLOOR_TEX	HarryBodenTex;
	CEIL_TEX		HarryBodenTex;
	CLIP_DIST	350;
}


REGION E5Sockel {
	FLOOR_HGT	17.5;
	CEIL_HGT		34.0;
	AMBIENT		0.8;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	250;
}

REGION E5PavillonSims {
	FLOOR_HGT	18.9;
	CEIL_HGT		29.0;
	AMBIENT		0.9;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	250;
#	IF_ENTER		suizid;
}

REGION Schlangenplattform{
	FLOOR_HGT	-3.5;
	CEIL_HGT	40.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		InkadeckeTex;
	CLIP_DIST	300;
}


REGION RumpelkammerSockel{
	FLOOR_HGT	15.5;
	CEIL_HGT		26.5;
	FLOOR_TEX	RumpelKammerSockelBoden;
	CEIL_TEX		HolzDeckeTex;
	AMBIENT		0.3;
	IF_ENTER 	falltuer;
	CLIP_DIST	200;
}

ACTION falltuer {
	SET RumpelKammerSockel.EACH_TICK lift_down;
}
ACTION arschtritt {
	SET RumpelKammerSockel.EACH_TICK lift_up;
}
ACTION lift_down {
	ADD		RumpelKammerSockel.FLOOR_HGT, -0.3;
	PLAY_SOUND stonelift, 0.3;
	ADD		PLAYER_Z, -0.3;
	SET		RENDER_MODE,1;
	IF_ABOVE RumpelKammerSockel.FLOOR_HGT, 0;
		END;
	SET		RumpelKammerSockel.FLOOR_HGT,0;
	SET		RumpelKammerSockel.EACH_TICK,NULL;
	SET		RumpelKammerSockel.IF_ENTER, arschtritt;
	SET 		DunkelGangSperre.CEIL_HGT 6.0;
}

ACTION lift_up {
	ADD		RumpelKammerSockel.FLOOR_HGT, 0.3;
	ADD		PLAYER_Z, 0.3;
	SET		RENDER_MODE,1;
	PLAY_SOUND stonelift, 0.3;
	IF_BELOW RumpelKammerSockel.FLOOR_HGT, 15.5;
		END;
	SET		RumpelKammerSockel.FLOOR_HGT, 15.5;
	SET		RumpelKammerSockel.EACH_TICK,NULL;
	SET		RumpelKammerSockel.IF_ENTER, falltuer;
}




///////////////////Treppen////////////////////////////////
REGION GangE3Treppenstufe1 {
	FLOOR_HGT	1;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE3Treppenstufe2 {
	FLOOR_HGT	2;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE3Treppenstufe3 {
	FLOOR_HGT	3;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE3Treppenstufe4 {
	FLOOR_HGT	4;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE3Treppenstufe5 {
	FLOOR_HGT	5;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE3Treppenstufe6 {
	FLOOR_HGT	6;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE3Treppenstufe7 {
	FLOOR_HGT	7;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	KassettendeckTex;
	CLIP_DIST	300;
}

REGION GangE3Treppenstufe8 {
	FLOOR_HGT	8;
	CEIL_HGT	22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;


}

REGION GangE4Treppenstufe1 {
	FLOOR_HGT	9.5;
	CEIL_HGT		22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		Erdhimmel;
	CLIP_DIST	300;
}

REGION GangE4Treppenstufe2 {
	FLOOR_HGT	11.0;
	CEIL_HGT		22.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		Erdhimmel;
	CLIP_DIST	300;
}

REGION GangE4Treppenstufe3 {
	FLOOR_HGT	12.5;
	CEIL_HGT		23.0;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX	Erdhimmel;
	CLIP_DIST	300;
}

REGION GangE4Treppenstufe4 {
	FLOOR_HGT	14.0;
	CEIL_HGT		23.5;
	FLOOR_TEX	PlattenTex;
	CEIL_TEX		Erdhimmel;
	IF_ENTER		leave_water;
	CLIP_DIST	300;
}

REGION GangE3Treppab1 {
	FLOOR_HGT	0;
	CEIL_HGT		16.0;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;
}

REGION GangE3Treppab2 {
	FLOOR_HGT	-0.9;
	CEIL_HGT	16.0;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;
}

REGION GangE3Treppab3 {
	FLOOR_HGT	-1.8;
	CEIL_HGT		16.0;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;
}

REGION GangE3Treppab4 {
	FLOOR_HGT	-2.7;
	CEIL_HGT		16.0;
	FLOOR_TEX	Kachelfussboden;
	CEIL_TEX		KassettendeckTex;
	CLIP_DIST	300;

}




///////////////////////////////////////////////
WALL dummywand {
	TEXTURE		dummyTex;
}

WALL Gangwand {
	TEXTURE		Standardgang;
}
WALL bridge_wall {
	TEXTURE		Standardgang;
#	FLAGS			BETWEEN;
}
WALL Gangwand_dunkel {
	TEXTURE		Standardgang_dunkel;
}
WALL Zementwand {
	TEXTURE		Schlammboden_dunkelTex;
}
WALL Galeria {
	TEXTURE		galeriewand;
	FLAGS			PORTCULLIS;
	POSITION		0;
}

WALL SecretWand {
	TEXTURE		geheimtuer_tex;
	IF_NEAR		check_open;
	DIST			20;
	FLAGS			PORTCULLIS;
	POSITION		0;
}
WALL GeheimeTuer {
	TEXTURE		GeheimeThermeTex;
	IF_NEAR		ist_open;
	DIST			18;
	FLAGS			PORTCULLIS;
	POSITION		0;
}

WALL oPInfoWand {
OFFSET_X	40;
TEXTURE		oPinfoTex;
FLAGS			TRANSPARENT,PASSABLE;
}


WALL oPWerbeWand {
TEXTURE		oPTex;
}

WALL oPWand {
TEXTURE		oPTexSolo;
}


WALL Sockelwand {
TEXTURE		SaeulenTex;
}

WALL GangDecke {
TEXTURE		GangDeckeTex;
}

WALL Saeule {
	TEXTURE		SaeulenTex;
}

WALL Gitterstaebe {
	TEXTURE	GitterTex;
	FLAGS		TRANSPARENT;
}

WALL RostigeWand {
TEXTURE		RostigeMauerTex;
}

WALL RissWand {
TEXTURE		RissigeWandTex;
}


WALL InkaWand {
TEXTURE		InkaTex;
}

WALL Bogenwand {
	TEXTURE		Bogenwand_tex;
#	FLAGS			PORTCULLIS;
}


WALL Kreisbogenwand {
	TEXTURE		Speibogenwand;
#	FLAGS			PORTCULLIS;
}

WALL Wasserbogenwand {
	TEXTURE		Ausflusswand;
#	OFFSET_Y		50;
	POSITION		1;
	FLAGS			PORTCULLIS;
#	ATTACH		title_tex;
}
WALL Wasserbogenwand_2 {
	TEXTURE		Ausflusswand;
	POSITION		1;
	FLAGS			PORTCULLIS;
}

WALL Rumpel {
	TEXTURE		Rumpelwand;
}

WALL Rumpelfence {
	TEXTURE		Rumpelwand;
#	POSITION		1.5;
	FLAGS			TRANSPARENT,FENCE;
}

WALL Unterwasser {
	TEXTURE		Unterwassermauer;
}

WALL Treppenabsatz {
	TEXTURE		TreppenstufeTex;
}

WALL special_absatz {
	TEXTURE	TreppenstufeTex;
#	FLAGS		CURTAIN,PASSABLE;
}

WALL Randstreifen1 {
	TEXTURE		Randstreifen1Tex;
}

WALL FrankfurtM {
	OFFSET_Y	60;
	TEXTURE		FrankfurtTex;
}
WALL FFM_NoSound {
	OFFSET_Y	60;
	TEXTURE		FrankfurtTex;
}

////////////////////////////////////////////////

THING Skel {
	HEIGHT  	-0.2;
	TEXTURE		SkelettTex;
}

THING uw_skelett {
	HEIGHT  	-51;
	TEXTURE	SkelettTex;
	FLAGS		GROUND;
}

THING RumpelRing {
	TEXTURE	RingTex;
	FLAGS		CANDELABER;
}

///////////////////////////////////////////////

ACTION check_open {
	IF_BELOW Secret_Door.CEIL_HGT 8;
	SET 		EACH_TICK.10, opendoor;
	IF_BELOW Secret_Door.CEIL_HGT 5.1;
	PLAY_SOUND stonedoor,0.7;
}

ACTION opendoor {
	ADD 		secret_door.CEIL_HGT 0.3;
	SET		RENDER_MODE,1;
	#ADD 		SecretWand.OFFSET_Y 10; #scale x 0.2
	IF_ABOVE secret_door.CEIL_HGT 16;
	SET 		EACH_TICK.10,NULL;
}


ACTION 	ist_open {
	IF_BELOW 	GeheimTuer.CEIL_HGT 8;
	SET 			EACH_TICK.11, aufgeh;
	IF_BELOW 	GeheimTuer.CEIL_HGT 2.7;
	PLAY_SOUND 	stonedoor,0.5;
}

ACTION 	aufgeh {
	ADD 		GeheimTuer.CEIL_HGT 0.3;
	SET		RENDER_MODE,1;
	#ADD 		GeheimeTuer.OFFSET_Y 10; #scale x 0.2
	IF_ABOVE GeheimTuer.CEIL_HGT 12.0;
	SET 		EACH_TICK.11,NULL;
}

////////////////////////////////////////////////
//actors for 2-player mode
ACTOR player_1 {
	TEXTURE	guard_tex;
	HEIGHT	1.5;
   TARGET 	NODE0;
}

ACTOR player_2 {
	TEXTURE	guard_tex;
	HEIGHT	2;
   TARGET 	NODE1;
}

#INCLUDE	<testing.wdl>;

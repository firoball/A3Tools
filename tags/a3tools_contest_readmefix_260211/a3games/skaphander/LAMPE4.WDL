///////////////////////////////////////////////////////////////////////////
////////////-Steh- und H„ngelampe zur Verzierung
/////////// Skaphander - oP-group/Navigo
//////////  F.O. Juli `95
///////////////////////////////////////////////////////////////////////////
SOUND sum_sum,<lamp4.wav>;

BMAP la_st_an, <lam_4.lbm>,0,0,59,121;
BMAP la_st_au_1,<lam_4.lbm>,60,0,59,121;
BMAP la_st_au_0,<lam_4.lbm>,121,0,59,121;
BMAP la_hang_an,<lam_4.lbm>,187,0,59,78;
BMAP la_hang_au_1,<lam_4.lbm>,250,0,59,78;
BMAP la_hang_au_0,<lam_4.lbm>,313,0,59,78;




TEXTURE	lamp4_hang_austex {
	SCALE_XY	14,16;
	BMAPS		la_hang_au_0;
	TOUCH		lamp4_touch;
	AMBIENT	0.5;
		FLAGS 		CLIP;
}


TEXTURE	lamp4_hang_antex {
	SCALE_XY	14,16;
	BMAPS		la_hang_an;
	TOUCH		lamp4_touch;
	AMBIENT	1;
#	SOUND 	sum_sum;
#	SVOL		0.3;
#	SDIST		40;
#	FLAGS		SLOOP;
	FLAGS 		CLIP;
}

TEXTURE	lamp4_hang_flacktex {
	SCALE_XY	14,16;
	CYCLES	4;
	BMAPS		la_hang_an,la_hang_au_1,la_hang_au_0,la_hang_au_1;
	DELAY		1,2,4,3;
	TOUCH		lamp4_touch;
	SOUND 	sum_sum;
	SVOL		0.3;
	SDIST		40;
	SCYCLES	1,0,0,0;
	AMBIENT	1;
		FLAGS 		CLIP;
}


THING lamp4_hang_an {
	HEIGHT		0.01;
	TEXTURE	lamp4_hang_antex;
	FLAGS		SAVE,CANDELABER;
	SKILL1	2;
	IF_HIT	treffer_hang;
}
THING lamp4_hang_an_u {
	TEXTURE	lamp4_hang_antex;
	FLAGS		SAVE,GROUND;
	SKILL1	2;
	IF_HIT	treffer_hang;
	EACH_TICK init_lampe;
}

THING lamp4_hang_flack {
	TEXTURE	lamp4_hang_flacktex;
	FLAGS		SAVE,CANDELABER;
	SKILL1	1;
	IF_HIT	treffer_hang;
}
THING lamp4_hang_flack_u {
	TEXTURE	lamp4_hang_flacktex;
	FLAGS		SAVE,GROUND;
	SKILL1	1;
	IF_HIT	treffer_hang;
	EACH_TICK init_lampe;
}

ACTION	init_lampe {
SET MY.HEIGHT,THERE.CEIL_HGT;
ADD	MY.HEIGHT,-4.8;
SET	MY.EACH_TICK,NULL;}

ACTION treffer_hang {
 	IF_EQUAL	SHOOT_RANGE,14;
			END;

	SUB		MY.SKILL1,1;
	IF_BELOW
		MY.SKILL1,0;
			END;

	IF_EQUAL	MY.SKILL1,1;
   	SET		MY.TEXTURE,lamp4_hang_flacktex;
	IF_EQUAL	MY.SKILL1,0;
		SET		MY.TEXTURE,lamp4_hang_austex;
}

TEXTURE	lamp4_steh_austex {
	SCALE_XY	14,12;
	BMAPS		la_st_au_0;
	TOUCH		lamp4a_touch;
	AMBIENT	1;
}


TEXTURE	lamp4_steh_antex {
	SCALE_XY	14,12;
	BMAPS		la_st_an;
	TOUCH		lamp4a_touch;
	AMBIENT	1;
	SOUND 	sum_sum;
#	SVOL		0.3;
#	SDIST		60;
#	FLAGS		SLOOP;
}

TEXTURE	lamp4_steh_flacktex {
	SCALE_XY	14,12;
	CYCLES	4;
	BMAPS		la_st_an,la_st_au_1,la_st_au_0,la_st_au_1;
	DELAY		1,2,4,3;
	TOUCH		lamp4a_touch;
	SOUND 	sum_sum;
	SVOL		0.3;
	SDIST		60;
	SCYCLES	1,0,0,0;
	AMBIENT	1;
}


THING lamp4_steh_an {
	TEXTURE	lamp4_steh_antex;
	HEIGHT	-0.5;
	SKILL1	2;
	FLAGS		SAVE;
	IF_HIT	treffer_stand;
}

THING lamp4_steh_flack {
	TEXTURE	lamp4_steh_flacktex;
	HEIGHT	-0.5;
	SKILL1	1;
	FLAGS		SAVE;
	IF_HIT	treffer_stand;
}

ACTION treffer_stand {
 	IF_EQUAL	SHOOT_RANGE,14;
			END;

	SUB		MY.SKILL1,1;
	IF_BELOW
		MY.SKILL1,0;
			END;

	IF_EQUAL	MY.SKILL1,1;
   	SET		MY.TEXTURE,lamp4_steh_flacktex;
	IF_EQUAL	MY.SKILL1,0;
		SET		MY.TEXTURE,lamp4_steh_austex;
}


#TÅren

BMAP	Standard_Tuer_Zu1, <grauxit2.lbm>,0,0,256,256;

BMAP	Standard_Tuer_Auf1, <grauxit2.lbm>,0,0,256,256;
BMAP	Standard_Tuer_Auf2, <grauxit3.lbm>,0,0,256,256;
BMAP	Standard_Tuer_Auf3, <grauxit4.lbm>,0,0,256,256;
BMAP	Standard_Tuer_Auf4, <grauxit5.lbm>,0,0,256,256;
BMAP	Standard_Tuer_Auf5, <grauxit6.lbm>,0,0,256,256;
BMAP	Standard_Tuer_Auf6, <grauxit7.lbm>,0,0,256,256;
BMAP	Standard_Tuer_Auf7, <grauxit8.lbm>,0,0,256,256;

TEXTURE  Standard_Tuer_Tex {
	SCALE_XY		18,18;
	BMAPS			Standard_Tuer_Zu1;
}

TEXTURE  Standard_Tuer_Auf_Tex {
	SCALE_XY		18,18;
	CYCLES		7;
	BMAPS 		Standard_Tuer_Auf1,Standard_Tuer_Auf2,Standard_Tuer_Auf3,
					Standard_Tuer_Auf4,Standard_Tuer_Auf5,Standard_Tuer_Auf6,
					Standard_Tuer_Auf7;
	DELAY			1,1,1,1,1,1,1;
	FLAGS			ONESHOT;
	SOUND			door_open;
	SVOL			0.5;
	SDIST			50;
	SCYCLE		1;
}

TEXTURE  Standard_Tuer_Zu_Tex {
	SCALE_XY		18,18;
	CYCLES		8;
	BMAPS 		Standard_Tuer_Auf7,Standard_Tuer_Auf6,Standard_Tuer_Auf5,
					Standard_Tuer_Auf4,Standard_Tuer_Auf3,Standard_Tuer_Auf2,
					Standard_Tuer_Auf1,Standard_Tuer_Zu1;
	DELAY			1,1,1,1,1,1,1,1;
	FLAGS			ONESHOT;
	SOUND			door_open;
	SVOL			0.5;
	SDIST			50;
	SCYCLE		1;
}

WALL Standard_Tuer {
	TEXTURE		Standard_Tuer_Tex;
	FLAGS			PORTCULLIS,SAVE;
	DIST			25;
	IF_NEAR		Standard_Tuer_Auf;
	IF_FAR		Standard_Tuer_Zu;
}


BMAP	tuer_rahmen, <michels.lbm>,384,192,24,64;
TEXTURE tuer_rahmen_tex {
	SCALE_XY 21,9;
	BMAPS	tuer_rahmen;
	AMBIENT	-0.1;
}

WALL TuerHolm {
	TEXTURE tuer_rahmen_tex;
}

ACTION Standard_Tuer_Auf {
	IF_EQUAL		MY.TRANSPARENT,1;	// schon auf?
		END;
#	PLAY_SOUND	door_open, 0.3;
	SET			MY.TEXTURE,Standard_Tuer_Auf_Tex;
	BRANCH		texdoor_open;
}

ACTION Standard_Tuer_Zu {
	IF_EQUAL		MY.PASSABLE,0;		// schon zu?
		END;
#	PLAY_SOUND	door_open, 0.3;
	SET			MY.TEXTURE,Standard_Tuer_Zu_Tex;
	BRANCH		texdoor_close;
}



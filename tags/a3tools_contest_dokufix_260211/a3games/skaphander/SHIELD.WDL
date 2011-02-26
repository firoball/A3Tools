/////////////////////////////////////////////////////////////
BMAP  shield_generator, <can_obj.lbm>,171,49,81,65;

TEXTURE	generator_tex {
	SCALE_XY	18,18;
	BMAPS		shield_generator;
	TOUCH		protec_touch;
}

THING protector {
	TEXTURE	generator_tex;
	IF_NEAR	add_shield;
	IF_HIT	hit_shield;
}


ACTION hit_shield {
	IF_EQUAL	SHOOT_RANGE,14;
		DO	add_shield;
}

ACTION add_shield {
	PLAY_SOUND	beamer,0.3;
	SET 	MY.INVISIBLE,1;
	SET 	shield,1500;// haelt ca. 1.5 Minuten
	SET 	screen_msg.STRING,shielder;
	DO 	show_message;
}


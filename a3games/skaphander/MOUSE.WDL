OVLY		mouse_ovr,<arrow.pcx>;
OVERLAY	mouse_sprite { OVLYS mouse_ovr; }
MSPRITE	mouse_sprite;

ACTION mouse_on {
	SET   MOUSE_MODE,2;
loop:
	WAIT   1;
	RULE  MOUSE_X = MOUSE_X + 2*MICKEY_X;
	RULE  MOUSE_Y = MOUSE_Y + 2*MICKEY_Y;
	IF_ABOVE MOUSE_MODE,0;
		GOTO loop;
};

ACTION mouse_toggle {
	ADD 		MOUSE_MODE,2;
	IF_ABOVE	MOUSE_MODE,2;
		SET	MOUSE_MODE,0;
	IF_EQUAL	MOUSE_MODE,0;
		END;

loop:
	WAIT 		1;
	RULE		MOUSE_X = MOUSE_X + 2*MICKEY_X;
	RULE		MOUSE_Y = MOUSE_Y + 2*MICKEY_Y;
	IF_ABOVE	MOUSE_MODE,0;
		GOTO	loop;
};




OVLY		mouse_ovr,<arrow.pcx>;
OVERLAY	mouse_sprite { OVLYS mouse_ovr; }
MSPRITE	mouse_sprite;

ACTION mouse_toggle { 		// switches the mouse on and off
	RULE MOUSE_MODE += 2;
	IF (MOUSE_MODE > 2) {	// was it alread on?
		RULE	MOUSE_MODE=0;
		END;
	}
	WHILE (MOUSE_MODE > 0) {
		WAIT	1; 		      // now move it over the screen
		RULE	MOUSE_X += 2*MICKEY_X;
		RULE	MOUSE_Y += 2*MICKEY_Y;
	}
};


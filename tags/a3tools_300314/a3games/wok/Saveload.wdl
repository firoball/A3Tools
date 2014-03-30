STRING saveerr_str,"SAVE ERROR";
STRING empty_str,"Empty Slot";
SKILL slot {TYPE LOCAL; VAL 1;}
//////////Spielstand speichern & laden//////////

ACTION save_game {
	CALL show_slots; 
        SET info_txt.STRING,save_str;
        SET info_txt.VISIBLE,1;
	WAIT 1;
        SET RESULT,0;
        SET info_txt.VISIBLE,0;
	SAVE "MASS0",slot;
        IF_BELOW RESULT,0;
                SKIP 1;
        END;
        SET newstring,1;
        SET info_str,saveerr_str;
        }

ACTION load_game {
	IF_EQUAL PANELS.10,title_pan;
		SET load_me,1;
	CALL show_slots;
        SET load_me,0;
	SET info_txt.STRING,load_str;
        SET info_txt.VISIBLE,1;
	WAIT 1;
	SAVE_INFO "MASS0",0;
	LOAD "MASS0",slot;
	SET info_txt.VISIBLE,NULL;
	IF_EQUAL slot,1;
		SET_STRING slot1_str,empty_str;
	IF_EQUAL slot,2;
		SET_STRING slot2_str,empty_str;
	IF_EQUAL slot,3;
		SET_STRING slot3_str,empty_str;
	IF_EQUAL slot,4;
		SET_STRING slot4_str,empty_str;
	IF_EQUAL slot,5;
		SET_STRING slot5_str,empty_str;
	IF_EQUAL slot,6;
		SET_STRING slot6_str,empty_str;
	IF_NEQUAL PANELS.10,title_pan;
		END;
	WAIT 1;
	CALL show_menu;
}

IF_LOAD set_clear;
ACTION set_clear {
	SET newstring,1;
        SET info_str,nix_str;	
	FADE_PAL nebel_pal,gamma;
}

//////////Levelwechsel//////////

ACTION changelev {
	CALL reset_controls;
	FADE_PAL nebel_pal,0;
	SET info_txt.STRING,load_str;
	SET info_txt.VISIBLE,1;
	WAIT 1;
	SAVE_INFO "MASS0",0;
	IF_EQUAL levelnr,1;
	        MAP <forest.wmp>;
	IF_EQUAL levelnr,2;
		MAP <forest2.wmp>;
	IF_EQUAL levelnr,3;
		MAP <forest3.wmp>;
	}

ACTION startlev {
	LOAD_INFO "MASS0",0;
	SET BLUR_MODE,1;
	SET_ALL THERE.EACH_TICK,NULL;
	FADE_PAL nebel_pal,gamma;
	CALL stop_moving;
	SET last_reg,HERE;
	CALL set_moving;
	CALL set_controls;
	SET disp_txt.VISIBLE,1;
	IF_EQUAL q_item,0; SET LAYERS.5,qinv_ovr;
	IF_EQUAL a_item,0; SET LAYERS.7,ainv_ovr;
	IF_EQUAL LAYERS.1,spellbook_ovr;
		SET spell_txt.VISIBLE,1;
	IF_EQUAL LAYERS.2,character_ovr;
		SET char_txt.VISIBLE,1;
	IF_NEQUAL LAYERS.3,inventory_ovr; SKIP 2;
	SET inv_txt.VISIBLE,1;
	SET i_item_txt.VISIBLE,1;	

	IF_EQUAL levelnr,1;
	        CALL enter_forest;
	IF_EQUAL levelnr,2;
		CALL enter_forest;
	IF_EQUAL levelnr,3;
		CALL enter_forest;
	SET info_txt.VISIBLE,0;
	SET newstring,1;
	SET info_str,nix_str;
	IF_NEQUAL cur_wpn,0;CALL update_weapon;
}


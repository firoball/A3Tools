//////////Inventory//////////

SOUND collect_snd, <collect.wav>;
SOUND use_snd, <invuse.wav>;
SOUND use2_snd, <invuse2.wav>;
SOUND select_snd, <invent.wav>;
STRING no_setitem_str,"i cannot carry anymore";

SYNONYM inv_item {TYPE OVERLAY;}

SKILL free_item {VAL 1; MAX 21;}
SKILL no_new_item {VAL 0;}
SKILL cur_item {VAL 0;}
SKILL new_amount {VAL 0;}
SKILL cur_weight {VAL 0;}
SKILL new_weight {VAL 0;}
SKILL ID {VAL 0;}
SKILL ID_ok {VAL 0;}
SKILL i_amount {VAL 0; MIN 0;}
SKILL i_weight {VAL 0;}
SKILL sel_item {VAL 1;}
SKILL tot_amount {VAL 0;}
SKILL no_set {VAl 0;}
SKILL q_weight {VAL 0;}
SKILL a_weight {VAL 0;}
SKILL cur_wpn {VAL 1;}
SKILL cur_amount {VAL 0;}
SKILL armAC {VAL 0;}
SKILL hk {VAL 0;}

SKILL i_item1 {VAL 0; MIN 0;}
SKILL i_item2 {VAL 0; MIN 0;}
SKILL i_item3 {VAL 0; MIN 0;}
SKILL i_item4 {VAL 0; MIN 0;}
SKILL i_item5 {VAL 0; MIN 0;}
SKILL i_item6 {VAL 0; MIN 0;}
SKILL i_item7 {VAL 0; MIN 0;}
SKILL i_item8 {VAL 0; MIN 0;}
SKILL i_item9 {VAL 0; MIN 0;}
SKILL i_item10 {VAL 0; MIN 0;}
SKILL i_item11 {VAL 0; MIN 0;}
SKILL i_item12 {VAL 0; MIN 0;}
SKILL i_item13 {VAL 0; MIN 0;}
SKILL i_item14 {VAL 0; MIN 0;}
SKILL i_item15 {VAL 0; MIN 0;}
SKILL i_item16 {VAL 0; MIN 0;}
SKILL i_item17 {VAL 0; MIN 0;}
SKILL i_item18 {VAL 0; MIN 0;}
SKILL i_item19 {VAL 0; MIN 0;}
SKILL i_item20 {VAL 0; MIN 0;}

SKILL h_item1 {VAL 0; MIN 0;}
SKILL h_item2 {VAL 0; MIN 0;}
SKILL h_item3 {VAL 0; MIN 0;}
SKILL h_item4 {VAL 0; MIN 0;}
SKILL h_item5 {VAL 0; MIN 0;}

SKILL i_itemx {VAL 0;}
SKILL q_item {VAL 0; MIN 0;}
SKILL a_item {VAL 0; MIN 0;}

OVLY inv0_ovl <invent.pcx>,0,0,25,38;
OVLY inv10050_ovl <invent.pcx>,25,0,25,38;
OVLY inv10100_ovl <invent.pcx>,50,0,25,38;
OVLY inv10150_ovl <invent.pcx>,75,0,25,38;
OVLY inv10200_ovl <invent.pcx>,100,0,25,38;
OVLY inv250_ovl <invent.pcx>,125,0,25,38;
OVLY inv300_ovl <invent.pcx>,150,0,25,38;
OVLY inv350_ovl <invent.pcx>,175,0,25,38;
OVLY inv400_ovl <invent.pcx>,200,0,25,38;
OVLY inv450_ovl <invent.pcx>,25,38,25,38;
OVLY inv500_ovl <invent.pcx>,75,38,25,38;
OVLY inv550_ovl <invent.pcx>,50,38,25,38;
OVLY inv600_ovl <invent.pcx>,0,38,25,38;
OVLY inv15050_ovl <invent.pcx>,100,38,25,38;

OVERLAY qinv_ovr {POS_X 83; POS_Y 353; OVLYS inv0_ovl;}
OVERLAY ainv_ovr {POS_X 210; POS_Y 353; OVLYS inv0_ovl;}
OVERLAY inv0_ovr {POS_X 9; POS_Y 142; OVLYS inv0_ovl;}
OVERLAY inv10050_ovr {POS_X 9; POS_Y 142; OVLYS inv10050_ovl;}
OVERLAY inv10100_ovr {POS_X 9; POS_Y 142; OVLYS inv10100_ovl;}
OVERLAY inv10150_ovr {POS_X 9; POS_Y 142; OVLYS inv10150_ovl;}
OVERLAY inv10200_ovr {POS_X 9; POS_Y 142; OVLYS inv10200_ovl;}
OVERLAY inv250_ovr {POS_X 9; POS_Y 142; OVLYS inv250_ovl;}
OVERLAY inv300_ovr {POS_X 9; POS_Y 142; OVLYS inv300_ovl;}
OVERLAY inv350_ovr {POS_X 9; POS_Y 142; OVLYS inv350_ovl;}
OVERLAY inv400_ovr {POS_X 9; POS_Y 142; OVLYS inv400_ovl;}
OVERLAY inv450_ovr {POS_X 9; POS_Y 142; OVLYS inv450_ovl;}
OVERLAY inv500_ovr {POS_X 9; POS_Y 142; OVLYS inv500_ovl;}
OVERLAY inv550_ovr {POS_X 9; POS_Y 142; OVLYS inv550_ovl;}
OVERLAY inv600_ovr {POS_X 9; POS_Y 142; OVLYS inv600_ovl;}
OVERLAY inv15050_ovr {POS_X 9; POS_Y 142; OVLYS inv15050_ovl;}

BMAP inv_map <inv.pcx>,30,0,60,248;
PANEL inv_pan {
	POS_X 30;
	POS_Y 78;
	FLAGS REFRESH;
	PAN_MAP inv_map;
	DIGITS 0,42,2,small_font,1,sel_item;
	DIGITS 0,102,2,inv_font,1,cur_amount;
	DIGITS -20,102,3,inv_font,1,cur_weight;
	DIGITS 35,222,4,small_font,1,weight.MAX;
	DIGITS 5,222,4,small_font,1,weight;}

//Rucksack anzeigen/verbergen

ACTION show_inventory {
	PLAY_SOUND menu_snd,1;
	IF_EQUAL LAYERS.3,inventory_ovr;
		GOTO no_inventory;
	IF_EQUAL LAYERS.1,spellbook_ovr;//falls sichtbar, Zauberbuch schliessen
		CALL show_spells;
	IF_EQUAL LAYERS.2,character_ovr;//falls sichtbar, Charakterblatt schliessen
		CALL show_character;
	SET LAYERS.3,inventory_ovr;
	SET inv_txt.VISIBLE,1;
	SET i_item_txt.VISIBLE,1;
	SET PANELS.4,inv_pan;
	CALL update_inv;
	SET LAYERS.6,inv_item;
	SET IF_INS, inv_up;
	SET IF_DEL, inv_down;
	SET IF_HOME, inv_use;
	SET EACH_TICK.8,hotkey_setup;
	END;
	
no_inventory:
	SET IF_INS,NULL;
	SET IF_DEL,NULL;
	SET IF_HOME,NULL;
	SET EACH_TICK.8,NULL;
	SET LAYERS.3,NULL;
	SET inv_txt.VISIBLE,0;
	SET i_item_txt.VISIBLE,0;
	SET PANELS.4,NULL;
	SET LAYERS.6,NULL;
}

//Rucksack updaten

ACTION update_inv {
	IF_EQUAL sel_item,1;
		CALL set_ID1;
	IF_EQUAL sel_item,2;
		CALL set_ID2;
	IF_EQUAL sel_item,3;
		CALL set_ID3;
	IF_EQUAL sel_item,4;
		CALL set_ID4;
	IF_EQUAL sel_item,5;
		CALL set_ID5;
	IF_EQUAL sel_item,6;
		CALL set_ID6;
	IF_EQUAL sel_item,7;
		CALL set_ID7;
	IF_EQUAL sel_item,8;
		CALL set_ID8;
	IF_EQUAL sel_item,9;
		CALL set_ID9;
	IF_EQUAL sel_item,10;
		CALL set_ID10;
	IF_EQUAL sel_item,11;
		CALL set_ID11;
	IF_EQUAL sel_item,12;
		CALL set_ID12;
	IF_EQUAL sel_item,13;
		CALL set_ID13;
	IF_EQUAL sel_item,14;
		CALL set_ID14;
	IF_EQUAL sel_item,15;
		CALL set_ID15;
	IF_EQUAL sel_item,16;
		CALL set_ID16;
	IF_EQUAL sel_item,17;
		CALL set_ID17;
	IF_EQUAL sel_item,18;
		CALL set_ID18;
	IF_EQUAL sel_item,19;
		CALL set_ID19;
	IF_EQUAL sel_item,20;
		CALL set_ID20;
	SET cur_amount,i_amount;
	SET LAYERS.6,inv_item;
	SET inv_item.POS_X,9;
	SET inv_item.POS_Y,142;
}

//Auswählen des Gegenstandes

ACTION inv_up {
	PLAY_SOUND select_snd,1;
	ADD sel_item,-1;
	IF_BELOW sel_item,1;
		SET sel_item,20;
	BRANCH update_inv;
}

ACTION inv_down {
	PLAY_SOUND select_snd,1;
	ADD sel_item,1;
	IF_ABOVE sel_item,20;
		SET sel_item,1;
	BRANCH update_inv;
}

//Und Tschüssi...weg mit dem Gegenstand!!!

ACTION drop_item {
	IF_NEQUAL LAYERS.3,inventory_ovr; BRANCH drop_qitem;
	CALL update_inv;
	IF_EQUAL sel_item,1; 
	SUB i_item1,1;//ausgewähltes Item ermitteln und 1 abziehen
	IF_EQUAL sel_item,2; 
	SUB i_item2,1;
	IF_EQUAL sel_item,3; 
	SUB i_item3,1;
	IF_EQUAL sel_item,4; 
	SUB i_item4,1;
	IF_EQUAL sel_item,5; 
	SUB i_item5,1;
	IF_EQUAL sel_item,6; 
	SUB i_item6,1;
	IF_EQUAL sel_item,7; 
	SUB i_item7,1;
	IF_EQUAL sel_item,8; 
	SUB i_item8,1;
	IF_EQUAL sel_item,9; 
	SUB i_item9,1;
	IF_EQUAL sel_item,10; 
	SUB i_item10,1;
	IF_EQUAL sel_item,11; 
	SUB i_item11,1;
	IF_EQUAL sel_item,12; 
	SUB i_item12,1;
	IF_EQUAL sel_item,13; 
	SUB i_item13,1;
	IF_EQUAL sel_item,14; 
	SUB i_item14,1;
	IF_EQUAL sel_item,15;
	SUB i_item15,1;
	IF_EQUAL sel_item,16; 
	SUB i_item16,1;
	IF_EQUAL sel_item,17; 
	SUB i_item17,1;
	IF_EQUAL sel_item,18; 
	SUB i_item18,1;
	IF_EQUAL sel_item,19; 
	SUB i_item19,1;
	IF_EQUAL sel_item,20; 
	SUB i_item20,1;
	IF_BELOW ID,50; END; //Falls Inventarplatz schon leer war, Abbruch
	CALL update_inv;
	RULE weight=weight-cur_weight;//Auch das Gewicht muß abgezogen werden
	IF_ABOVE i_amount,0; END;//wenn noch weitere Items vorhanden sind, fertig 
	CALL check_hotkeys;
	CALL replacer; //ansonsten leeren Platz mit letztem Item füllen
	IF_EQUAL sel_item,1; SET i_item1,i_itemx;//nochmal gewähltes Item ermitteln
	IF_EQUAL sel_item,2; SET i_item2,i_itemx;//und leeren Platz füllen
	IF_EQUAL sel_item,3; SET i_item3,i_itemx;
	IF_EQUAL sel_item,4; SET i_item4,i_itemx;
	IF_EQUAL sel_item,5; SET i_item5,i_itemx;
	IF_EQUAL sel_item,6; SET i_item6,i_itemx;
	IF_EQUAL sel_item,7; SET i_item7,i_itemx;
	IF_EQUAL sel_item,8; SET i_item8,i_itemx;
	IF_EQUAL sel_item,9; SET i_item9,i_itemx;
	IF_EQUAL sel_item,10; SET i_item10,i_itemx;
	IF_EQUAL sel_item,11; SET i_item11,i_itemx;
	IF_EQUAL sel_item,12; SET i_item12,i_itemx;
	IF_EQUAL sel_item,13; SET i_item13,i_itemx;
	IF_EQUAL sel_item,14; SET i_item14,i_itemx;
	IF_EQUAL sel_item,15; SET i_item15,i_itemx;
	IF_EQUAL sel_item,16; SET i_item16,i_itemx;
	IF_EQUAL sel_item,17; SET i_item17,i_itemx;
	IF_EQUAL sel_item,18; SET i_item18,i_itemx;
	IF_EQUAL sel_item,19; SET i_item19,i_itemx;
	IF_EQUAL sel_item,20; SET i_item20,i_itemx;
	CALL update_inv;}

//Dann für das Quick-Inventory...

ACTION drop_qitem {
	IF_BELOW q_item,50; END; //schon leer? Dann beenden
	SUB q_amount,1;
	SUB q_item,1;
	SUB weight,q_weight;
	IF_ABOVE q_amount,0; END;
	SET q_weight,0;
	SET q_item,0;
	SET LAYERS.5,qinv_ovr;
}
 
//Hotkeys und aktuelle Waffe überprüfen, wenn Gegenstand weggeworfen wird

ACTION check_hotkeys {
IF (sel_item==cur_wpn) {SET weapon_ovr,NULL; SET weapon_atk,NULL; SET weapon_hgt,0; CALL set_weapon; SET cur_wpn,0;}#update_weapon;}
IF (sel_item==h_item1) {SET h_item1,0;}
IF (sel_item==h_item2) {SET h_item2,0;}
IF (sel_item==h_item3) {SET h_item3,0;}
IF (sel_item==h_item4) {SET h_item4,0;}
IF (sel_item==h_item5) {SET h_item5,0;}
}
	
//Falls gegenstand weggeworfen wurde, Skills neu setzen
ACTION check_hotkeys2 {
IF ((free_item-1)==cur_wpn) {SET cur_wpn,sel_item;}
IF ((free_item-1)==h_item1) {SET h_item1,sel_item;}
IF ((free_item-1)==h_item2) {SET h_item2,sel_item;}
IF ((free_item-1)==h_item3) {SET h_item3,sel_item;}
IF ((free_item-1)==h_item4) {SET h_item4,sel_item;}
IF ((free_item-1)==h_item5) {SET h_item5,sel_item;}
}
//ID+Anzahl in entsprechendem Hotkey-Skill speichern

ACTION hotkey_setup {
IF_BELOW KEY_ALT,1; END; //[ALT] muss beim Setup gedrückt sein
CALL update_inv;
IF_EQUAL h_item1,sel_item; END;//Jedes Item kann nur einen Hotkey haben
IF_EQUAL h_item2,sel_item; END;
IF_EQUAL h_item3,sel_item; END;
IF_EQUAL h_item4,sel_item; END;
IF_EQUAL h_item5,sel_item; END;

IF_EQUAL KEY_1,1; SET h_item1,sel_item;
IF_EQUAL KEY_2,1; SET h_item2,sel_item;
IF_EQUAL KEY_3,1; SET h_item3,sel_item;
IF_EQUAL KEY_4,1; SET h_item4,sel_item;
IF_EQUAL KEY_5,1; SET h_item5,sel_item;
}
	

ACTION hotkey_use {
IF_ABOVE KEY_ALT,0; END;//Wenn [ALT] gedrückt ist, Hotkeys deaktivieren
IF (KEY_1==1) {IF (h_item1!=0){SET i_itemx,h_item1;GOTO update;}}
IF (KEY_2==1) {IF (h_item2!=0){SET i_itemx,h_item2;GOTO update;}}
IF (KEY_3==1) {IF (h_item3!=0){SET i_itemx,h_item3;GOTO update;}}
IF (KEY_4==1) {IF (h_item4!=0){SET i_itemx,h_item4;GOTO update;}}
IF (KEY_5==1) {IF (h_item5!=0){SET i_itemx,h_item5;GOTO update;}}
END;
update:
SET no_set,1;
CALL updater;//Inventarplatz ermitteln
}

//Überprüfen ob Platz im Rucksack ist. Wenn Ja, Item plazieren

ACTION collect_item {
	IF_EQUAL free_item,free_item.MAX;
		END;
	SET cur_item,MY.SKILL3;
	SET new_amount,1;
	SET ID,cur_item;
	CALL check_ID2;
	SET new_weight,cur_weight;
	RULE MY.SKILL5=weight.MAX-(weight+new_weight*new_amount);
	IF_ABOVE MY.SKILL5,0;
		SKIP 5;
	SET newstring,1;
	SET info_str,no_setitem_str;
	IF_EQUAL LAYERS.3,inventory_ovr;
	CALL update_inv;
	END;
	SET MY.INVISIBLE,1;
	PLAY_SOUND collect_snd,0.3;
	CALL inv_search;
	IF_EQUAL no_new_item,1;
		GOTO no_new_item;
	IF_NEQUAL free_item,1;
		SKIP 1;
	RULE i_item1=cur_item+new_amount;
	IF_NEQUAL free_item,2;
		SKIP 1;
	RULE i_item2=cur_item+new_amount;
	IF_NEQUAL free_item,3;
		SKIP 1;
	RULE i_item3=cur_item+new_amount;
	IF_NEQUAL free_item,4;
		SKIP 1;
	RULE i_item4=cur_item+new_amount;
	IF_NEQUAL free_item,5;
		SKIP 1;
	RULE i_item5=cur_item+new_amount;
	IF_NEQUAL free_item,6;
		SKIP 1;
	RULE i_item6=cur_item+new_amount;
	IF_NEQUAL free_item,7;
		SKIP 1;
	RULE i_item7=cur_item+new_amount;
	IF_NEQUAL free_item,8;
		SKIP 1;
	RULE i_item8=cur_item+new_amount;
	IF_NEQUAL free_item,9;
		SKIP 1;
	RULE i_item9=cur_item+new_amount;
	IF_NEQUAL free_item,10;
		SKIP 1;
	RULE i_item10=cur_item+new_amount;
	IF_NEQUAL free_item,11;
		SKIP 1;
	RULE i_item11=cur_item+new_amount;
	IF_NEQUAL free_item,12;
		SKIP 1;
	RULE i_item12=cur_item+new_amount;
	IF_NEQUAL free_item,13;
		SKIP 1;
	RULE i_item13=cur_item+new_amount;
	IF_NEQUAL free_item,14;
		SKIP 1;
	RULE i_item14=cur_item+new_amount;
	IF_NEQUAL free_item,15;
		SKIP 1;
	RULE i_item15=cur_item+new_amount;
	IF_NEQUAL free_item,16;
		SKIP 1;
	RULE i_item16=cur_item+new_amount;
	IF_NEQUAL free_item,17;
		SKIP 1;
	RULE i_item17=cur_item+new_amount;
	IF_NEQUAL free_item,18;
		SKIP 1;
	RULE i_item18=cur_item+new_amount;
	IF_NEQUAL free_item,19;
		SKIP 1;
	RULE i_item19=cur_item+new_amount;
	IF_NEQUAL free_item,20;
		SKIP 1;
	RULE i_item20=cur_item+new_amount;
	ADD free_item,1;
no_new_item:
	RULE weight=weight+new_amount*new_weight;
	SET no_new_item,0;
	IF_EQUAL LAYERS.3,inventory_ovr;
	CALL update_inv;
}

//Prüfen, ob das gleiche Item bereits vorhanden ist. Wenn ja, Anzahl um 1 erhöhen

ACTION inv_search {
	CALL set_ID1;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item1,new_amount;
	SET no_new_item,1;

	CALL set_ID2;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item2,new_amount;
	SET no_new_item,1;

	CALL set_ID3;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item3,new_amount;
	SET no_new_item,1;

	CALL set_ID4;
	IF_NEQUAL cur_item,ID;
		SKIP 5;	
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item4,new_amount;
	SET no_new_item,1;

	CALL set_ID5;
	IF_NEQUAL cur_item,ID;
		SKIP 5;	
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item5,new_amount;
	SET no_new_item,1;

	CALL set_ID6;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item6,new_amount;
	SET no_new_item,1;

	CALL set_ID7;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item7,new_amount;
	SET no_new_item,1;

	CALL set_ID8;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item8,new_amount;
	SET no_new_item,1;

	CALL set_ID9;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item9,new_amount;
	SET no_new_item,1;

	CALL set_ID10;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item10,new_amount;
	SET no_new_item,1;

	CALL set_ID11;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item11,new_amount;
	SET no_new_item,1;

	CALL set_ID12;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item12,new_amount;
	SET no_new_item,1;

	CALL set_ID13;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item13,new_amount;
	SET no_new_item,1;

	CALL set_ID14;
	IF_NEQUAL cur_item,ID;
		SKIP 5;	
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item14,new_amount;
	SET no_new_item,1;

	CALL set_ID15;
	IF_NEQUAL cur_item,ID;
		SKIP 5;	
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item15,new_amount;
	SET no_new_item,1;

	CALL set_ID16;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item16,new_amount;
	SET no_new_item,1;

	CALL set_ID17;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item17,new_amount;
	SET no_new_item,1;

	CALL set_ID18;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item18,new_amount;
	SET no_new_item,1;

	CALL set_ID19;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item19,new_amount;
	SET no_new_item,1;

	CALL set_ID20;
	IF_NEQUAL cur_item,ID;
		SKIP 5;
	RULE tot_amount=i_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-i_amount;
	ADD i_item20,new_amount;
	SET no_new_item,1;

	RULE ID=q_item-q_amount;
	IF_NEQUAL cur_item,ID;
		SKIP 6;
	RULE tot_amount=q_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-q_amount;
	ADD q_item,new_amount;
	ADD q_amount,new_amount;
	SET no_new_item,1;
	END;	

RULE ID=a_item-a_amount;
	IF_NEQUAL cur_item,ID;
		SKIP 6;
	RULE tot_amount=a_amount+new_amount;
	IF_ABOVE tot_amount,20; RULE new_amount=20-a_amount;
	ADD a_item,new_amount;
	ADD a_amount,new_amount;
	SET no_new_item,1;
	END;	

}

//Gewicht und Informationen anzeigen

ACTION check_ID2 {
	IF_EQUAL no_set,1; END;
	IF_NEQUAL ID,0; SKIP 3; 
	SET inv_item,inv0_ovr; SET cur_weight,0; SET i_item_txt.STRING,nix_str;
	IF_NEQUAL ID,10050; SKIP 3;
	SET inv_item,inv10050_ovr; SET cur_weight,14; SET i_item_txt.STRING,str_10050; 
	IF_NEQUAL ID,10100; SKIP 3;
	SET inv_item,inv10100_ovr; SET cur_weight,7; SET i_item_txt.STRING,str_10100;
	IF_NEQUAL ID,10150; SKIP 3;
	SET inv_item,inv10150_ovr; SET cur_weight,11; SET i_item_txt.STRING,str_10150; 
	IF_NEQUAL ID,10200; SKIP 3;
	SET inv_item,inv10200_ovr; SET cur_weight,3; SET i_item_txt.STRING,str_10200;
	IF_NEQUAL ID,250; SKIP 3;
	SET inv_item,inv250_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_250;
	IF_NEQUAL ID,300; SKIP 3;
	SET inv_item,inv300_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_300;
	IF_NEQUAL ID,350; SKIP 3;
	SET inv_item,inv350_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_350;
	IF_NEQUAL ID,400; SKIP 3;
	SET inv_item,inv400_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_400;
	IF_NEQUAL ID,450; SKIP 3;
	SET inv_item,inv450_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_450;
	IF_NEQUAL ID,500; SKIP 3;
	SET inv_item,inv500_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_500;
	IF_NEQUAL ID,550; SKIP 3;
	SET inv_item,inv550_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_550;
	IF_NEQUAL ID,600; SKIP 3;
	SET inv_item,inv600_ovr; SET cur_weight,1; SET i_item_txt.STRING,str_600;
	IF_NEQUAL ID,15050; SKIP 4;
	SET inv_item,inv15050_ovr; SET cur_weight,54; SET i_item_txt.STRING,str_15050; SET armAC,5; 
}

//ID überprüfen und dann auswerten, ob Item equipped wird oder ins Quick-Inventory kommt

ACTION inv_use {
	IF_EQUAL no_new_item,1; SKIP 2;//falls nichts am Rucksack selbst verändert wurde
	IF_EQUAL LAYERS.3,inventory_ovr; CALL update_inv;
	IF_ABOVE ID,40; PLAY_SOUND use_snd,0.8;
	IF_NEQUAL ID,10050; SKIP 3; 
	SET weapon_ovr,axe0_ovr; SET weapon_atk,axe_swing; SET weapon_hgt,5;
	IF_NEQUAL ID,10100; SKIP 3; 
	SET weapon_ovr,sword0_ovr; SET weapon_atk,sword_swing; SET weapon_hgt,0;
	IF_NEQUAL ID,10150; SKIP 3; 
	SET weapon_ovr,club0_ovr; SET weapon_atk,club_swing; SET weapon_hgt,0;
	IF_NEQUAL ID,10200; SKIP 3; 
	SET weapon_ovr,staff0_ovr; SET weapon_atk,staff_swing; SET weapon_hgt,115;
	IF (ID<10050 && ID>40) {SET no_new_item,0; BRANCH set_qinv; }
	IF (ID>15000) {SET no_new_item,0; BRANCH set_ainv; }
	BRANCH set_weapon;
}

//Waffen-Overlay setzen

ACTION set_weapon {
	SET hk,0;
	SET cur_wpn,sel_item;
	IF_EQUAL no_new_item,1; SET cur_wpn,i_itemx;
	SET no_new_item,0;
	IF_EQUAL ID,0; END;
	SET LAYERS.4,weapon_ovr;
	SET IF_CTRL, weapon_atk;
	SET IF_LEFT, weapon_atk;
}

//Gegenstand im Quick-Inventory plazieren durch Druck auf [HOME]

ACTION set_qinv {
	IF_EQUAL hk,0; SKIP 2; SET hk,0; END;
	SET i_itemx,q_item;
	RULE q_item=i_amount+ID;//q_item=Anzahl+ID
	RULE q_amount=i_amount;//q_amount=Anzahl
	RULE q_weight=cur_weight;//q_weight=Einzelgewicht
	SET inv_item.POS_X,83;
	SET inv_item.POS_Y,353;
	SET LAYERS.5,inv_item;
	IF_ABOVE i_itemx,49;
		GOTO replace;
	CALL replacer; //entstandene Lücke im Rucksack schließen, falls Q-Inv leer war
replace:
	IF_EQUAL q_item,i_item1; SET i_item1,i_itemx;
	IF_EQUAL q_item,i_item2; SET i_item2,i_itemx;
	IF_EQUAL q_item,i_item3; SET i_item3,i_itemx;
	IF_EQUAL q_item,i_item4; SET i_item4,i_itemx;
	IF_EQUAL q_item,i_item5; SET i_item5,i_itemx;
	IF_EQUAL q_item,i_item6; SET i_item6,i_itemx;
	IF_EQUAL q_item,i_item7; SET i_item7,i_itemx;
	IF_EQUAL q_item,i_item8; SET i_item8,i_itemx;
	IF_EQUAL q_item,i_item9; SET i_item9,i_itemx;
	IF_EQUAL q_item,i_item10; SET i_item10,i_itemx;
	IF_EQUAL q_item,i_item11; SET i_item11,i_itemx;
	IF_EQUAL q_item,i_item12; SET i_item12,i_itemx;
	IF_EQUAL q_item,i_item13; SET i_item13,i_itemx;
	IF_EQUAL q_item,i_item14; SET i_item14,i_itemx;
	IF_EQUAL q_item,i_item15; SET i_item15,i_itemx;
	IF_EQUAL q_item,i_item16; SET i_item16,i_itemx;
	IF_EQUAL q_item,i_item17; SET i_item17,i_itemx;
	IF_EQUAL q_item,i_item18; SET i_item18,i_itemx;
	IF_EQUAL q_item,i_item19; SET i_item19,i_itemx;
	IF_EQUAL q_item,i_item20; SET i_item20,i_itemx;
	CALL update_inv;
}

//Ruestung anlegen durch Druck auf [HOME]

ACTION unequip_ainv {
	IF_BELOW a_item, 15050; END;
	IF_ABOVE free_item,20; END;
	PLAY_SOUND use_snd,0.8;
	SET i_itemx,a_item;
	SET ainv_ovr.POS_X,210;
	SET ainv_ovr.POS_Y,353;
	SET LAYERS.7,ainv_ovr;
	IF_EQUAL free_item,1; SET i_item1,a_item;
	IF_EQUAL free_item,2; SET i_item2,a_item;
	IF_EQUAL free_item,3; SET i_item3,a_item;
	IF_EQUAL free_item,4; SET i_item4,a_item;
	IF_EQUAL free_item,5; SET i_item5,a_item;
	IF_EQUAL free_item,6; SET i_item6,a_item;
	IF_EQUAL free_item,7; SET i_item7,a_item;
	IF_EQUAL free_item,8; SET i_item8,a_item;
	IF_EQUAL free_item,9; SET i_item9,a_item;
	IF_EQUAL free_item,10; SET i_item10,a_item;
	IF_EQUAL free_item,11; SET i_item11,a_item;
	IF_EQUAL free_item,12; SET i_item12,a_item;
	IF_EQUAL free_item,13; SET i_item13,a_item;
	IF_EQUAL free_item,14; SET i_item14,a_item;
	IF_EQUAL free_item,15; SET i_item15,a_item;
	IF_EQUAL free_item,16; SET i_item16,a_item;
	IF_EQUAL free_item,17; SET i_item17,a_item;
	IF_EQUAL free_item,18; SET i_item18,a_item;
	IF_EQUAL free_item,19; SET i_item19,a_item;
	IF_EQUAL free_item,20; SET i_item20,a_item;
	ADD free_item,1;
	RULE a_item=0;
	RULE a_amount=0;
	RULE a_weight=0;
	RULE AC=0;
	IF_EQUAL LAYERS.3,inventory_ovr; CALL update_inv;
}
	
ACTION set_ainv {
	IF_EQUAL hk,0; SKIP 2; SET hk,0; END;
	SET i_itemx,a_item;
	RULE a_item=i_amount+ID;//a_item=Anzahl+ID
	RULE a_amount=i_amount;//a_amount=Anzahl
	RULE a_weight=cur_weight;//a_weight=Einzelgewicht
	RULE AC=armAC; #ADD armor,AC;
	SET inv_item.POS_X,210;
	SET inv_item.POS_Y,353;
	SET LAYERS.7,inv_item;
	IF_ABOVE i_itemx,49;
		GOTO replace;
	CALL replacer; //entstandene Lücke im Rucksack schließen, falls A-Inv leer war
replace:
IF_EQUAL a_item,i_item1; SET i_item1,i_itemx;
IF_EQUAL a_item,i_item2; SET i_item2,i_itemx;
IF_EQUAL a_item,i_item3; SET i_item3,i_itemx;
IF_EQUAL a_item,i_item4; SET i_item4,i_itemx;
IF_EQUAL a_item,i_item5; SET i_item5,i_itemx;
IF_EQUAL a_item,i_item6; SET i_item6,i_itemx;
IF_EQUAL a_item,i_item7; SET i_item7,i_itemx;
IF_EQUAL a_item,i_item8; SET i_item8,i_itemx;
IF_EQUAL a_item,i_item9; SET i_item9,i_itemx;
IF_EQUAL a_item,i_item10; SET i_item10,i_itemx;
IF_EQUAL a_item,i_item11; SET i_item11,i_itemx;
IF_EQUAL a_item,i_item12; SET i_item12,i_itemx;
IF_EQUAL a_item,i_item13; SET i_item13,i_itemx;
IF_EQUAL a_item,i_item14; SET i_item14,i_itemx;
IF_EQUAL a_item,i_item15; SET i_item15,i_itemx;
IF_EQUAL a_item,i_item16; SET i_item16,i_itemx;
IF_EQUAL a_item,i_item17; SET i_item17,i_itemx;
IF_EQUAL a_item,i_item18; SET i_item18,i_itemx;
IF_EQUAL a_item,i_item19; SET i_item19,i_itemx;
IF_EQUAL a_item,i_item20; SET i_item20,i_itemx;
	CALL update_inv;
}

//Leere Inventarplätze durch Items weiter hinten in der Liste ersetzen

ACTION replacer {
	IF_ABOVE sel_item,free_item; END;
	IF_EQUAL sel_item,free_item; END;
	CALL check_hotkeys2;
	IF_NEQUAL free_item,2; SKIP 2;
	SET i_itemx,i_item1; SET i_item1,0;
	IF_NEQUAL free_item,3; SKIP 2;
	SET i_itemx,i_item2; SET i_item2,0;
	IF_NEQUAL free_item,4; SKIP 2; 
	SET i_itemx,i_item3; SET i_item3,0;
	IF_NEQUAL free_item,5; SKIP 2;
	SET i_itemx,i_item4; SET i_item4,0;
	IF_NEQUAL free_item,6; SKIP 2;
	SET i_itemx,i_item5; SET i_item5,0;
	IF_NEQUAL free_item,7; SKIP 2;
	SET i_itemx,i_item6; SET i_item6,0;
	IF_NEQUAL free_item,8; SKIP 2;
	SET i_itemx,i_item7; SET i_item7,0;
	IF_NEQUAL free_item,9; SKIP 2;
	SET i_itemx,i_item8; SET i_item8,0;
	IF_NEQUAL free_item,10; SKIP 2;
	SET i_itemx,i_item9; SET i_item9,0;
	IF_NEQUAL free_item,11; SKIP 2;
	SET i_itemx,i_item10; SET i_item10,0;
	IF_NEQUAL free_item,12; SKIP 2;
	SET i_itemx,i_item11; SET i_item11,0;
	IF_NEQUAL free_item,13; SKIP 2;
	SET i_itemx,i_item12; SET i_item12,0;
	IF_NEQUAL free_item,14; SKIP 2; 
	SET i_itemx,i_item13; SET i_item13,0;
	IF_NEQUAL free_item,15; SKIP 2;
	SET i_itemx,i_item14; SET i_item14,0;
	IF_NEQUAL free_item,16; SKIP 2;
	SET i_itemx,i_item15; SET i_item15,0;
	IF_NEQUAL free_item,17; SKIP 2;
	SET i_itemx,i_item16; SET i_item16,0;
	IF_NEQUAL free_item,18; SKIP 2;
	SET i_itemx,i_item17; SET i_item17,0;
	IF_NEQUAL free_item,19; SKIP 2;
	SET i_itemx,i_item18; SET i_item18,0;
	IF_NEQUAL free_item,20; SKIP 2;
	SET i_itemx,i_item19; SET i_item19,0;
	IF_NEQUAL free_item,21; SKIP 2;
	SET i_itemx,i_item20; SET i_item20,0;
	ADD free_item,-1;
	IF_EQUAL free_item,sel_item; SET i_itemx,0;
}

//Routinen zum Ausrechnen von Anzahl und ID

ACTION set_ID1 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item1-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID2 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item2-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID3 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item3-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID4 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item4-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID5 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item5-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID6 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item6-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID7 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item7-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID8 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item8-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID9 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item9-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID10 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item10-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID11 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item11-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID12 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item12-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID13 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item13-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID14 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item14-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID15 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item15-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID16 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item16-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID17 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item17-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID18 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item18-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID19 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item19-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION set_ID20 {
	SET ID,0; SET ID_ok,0;
ID_loop:
	RULE i_amount=i_item20-ID;
	IF_BELOW i_amount,21;
		SET ID_ok,1;
	CALL check_ID2;
	IF_EQUAL ID_ok,1;
		END;
	ADD ID,50;
GOTO ID_loop;
}

ACTION update_weapon {SET no_set,1; SET i_itemx,cur_wpn; CALL updater;}
ACTION updater {
	IF_EQUAL i_itemx,0;
		SET ID,0;
	IF_EQUAL i_itemx,1;
		CALL set_ID1;
	IF_EQUAL i_itemx,2;
		CALL set_ID2;
	IF_EQUAL i_itemx,3;
		CALL set_ID3;
	IF_EQUAL i_itemx,4;
		CALL set_ID4;
	IF_EQUAL i_itemx,5;
		CALL set_ID5;
	IF_EQUAL i_itemx,6;
		CALL set_ID6;
	IF_EQUAL i_itemx,7;
		CALL set_ID7;
	IF_EQUAL i_itemx,8;
		CALL set_ID8;
	IF_EQUAL i_itemx,9;
		CALL set_ID9;
	IF_EQUAL i_itemx,10;
		CALL set_ID10;
	IF_EQUAL i_itemx,11;
		CALL set_ID11;
	IF_EQUAL i_itemx,12;
		CALL set_ID12;
	IF_EQUAL i_itemx,13;
		CALL set_ID13;
	IF_EQUAL i_itemx,14;
		CALL set_ID14;
	IF_EQUAL i_itemx,15;
		CALL set_ID15;
	IF_EQUAL i_itemx,16;
		CALL set_ID16;
	IF_EQUAL i_itemx,17;
		CALL set_ID17;
	IF_EQUAL i_itemx,18;
		CALL set_ID18;
	IF_EQUAL i_itemx,19;
		CALL set_ID19;
	IF_EQUAL i_itemx,20;
		CALL set_ID20;
	SET no_set,0;
	SET no_new_item,1;
	SET hk,1;
	BRANCH inv_use; // Waffe anlegen
}

ACTION use_invitem {
	IF_NEQUAL LAYERS.3,inventory_ovr; GOTO q_inv;
	CALL update_inv;
	SET use,ID;
	SKIP 1;
q_inv:
	RULE use=q_item-q_amount;
IF (use<10050 && use>40) {PLAY_SOUND use2_snd,0.8; }
	PUSH 15;
	WAIT 1;
IF ( use==250) {RULE HP+=(RANDOM(4)+13); CALL drop_item;}
IF ( use==300)  {RULE MP+=(RANDOM(4)+13); CALL drop_item;}
IF ( use==450) {RULE str+=(RANDOM(1)+1); CALL drop_item;}
IF ( use==500)  {RULE spd+=(RANDOM(1)+1); CALL drop_item;}
IF ( use==550) {RULE con+=(RANDOM(1)+1); CALL drop_item;}
IF ( use==600)  {RULE int+=(RANDOM(1)+1); CALL drop_item;}
	SET use,0;
}


//////////FONTS//////////
FONT svld_font, <savefont.pcx>,8,14;
FONT display_font, <dispfont.pcx>,14,29;
FONT big_font, <bigfont.pcx>,10,36;
FONT msg_font, <msgfont2.pcx>,8,14;
FONT italic_font, <msgfont3.pcx>,7,15;
FONT small_font, <msgfont.pcx>,5,18;
FONT inv_font, <invfont.pcx>,4,7;
//////////STRINGS//////////

STRING screenshot_str,"SCREENSHOT SAVED AS MASS01.PCX";
STRING load_str,"LOADING...";
STRING save_str,"SAVING...";
STRING wait_str,"PLEASE WAIT...";
STRING ld_str,"LOAD GAME";
STRING sv_str,"SAVE GAME";
STRING slot1_str,"Empty Slot     ";
STRING slot2_str,"Empty Slot     ";
STRING slot3_str,"Empty Slot     ";
STRING slot4_str,"Empty Slot     ";
STRING slot5_str,"Empty Slot     ";
STRING slot6_str,"Empty Slot     ";
STRING pause_str,"GAME PAUSED";
STRING lores_str,"low";
STRING hires_str,"high";
STRING inventory_str, "     BACKPACK\n\nITEM\n\n\n\n\n\n\n\n\n\nWEIGHT     /     ";
STRING char_str, " MARTEK'S STATUS\n\nLEVEL\n\nSTRENGTH\nSTAMINA\nWISDOM\nAGILITY\n\nARMOR\nDAMAGE\nNEEDED EXP";
STRING spell_str, "  ARCANE POWERS\n";
STRING spell1_str, "H HEAL";
STRING spell2_str, "M MAGIC ARROW";
STRING spell3_str, "N NIGHT VISION";
STRING spell4_str, "B FIREBALL";
STRING spell5_str, "F FLY";
STRING spell6_str, "S SHIELD";
STRING spell7_str, "L LIGHTNING";
STRING spell8_str, "C CURE";
STRING spell9_str, "E EXPLOSION";
STRING spell10_str,"T TOWN PORTAL";
STRING spell0_str, " ";
SYNONYM resolution_str {TYPE STRING;}
STRING help_str,"HELP\n\nESC main menu\nF1  help\nF2  save game\nF3  load game\nF4  new game
F6  inventory\nF7  character\nF8  spellbook\nF9  screenshot\nF10 end game
F11 brightness\nF12 options\nP   pause game\n\n\n
\n\n  page 1 of 4     ~";

STRING help_str2,"PLAYER CONTROLS\n\nUP    forward\nDOWN  backward\nLEFT  turn left\nRIGHT turn right\nSHIFT sneak
A     jump\nZ     crouch\nPGUP  look up\nPGDN  look down
END   center view\nSPACE activate\nTAB   automap\n&/-   zoom map
CTRL  use weapon\n\n\n\n\n^ page 2 of 4     ~";

STRING help_str3,"INVENTORY\n\nINS   page up\nDEL   page down
POS1  equip weapon\n      equip armor\nENTER use item\nD     drop item\nBKSPC unequip armor
ALT1-5 set hotkey\n1-5   use hotkey\n
ARCANE POWERS\n\nH heal\nN night vision
\n\n\n
^ page 3 of 4     ~";
/*
STRING help_str4,"   --MASSACRE--\n  contest version\n\n
    created by\n\n   ROBERT J[GER\nTEUFELSGRABENWEG 10\n    83626 GRUB\n
      germany\n\n\nICQ#:12525151\nFIROBALL<AT>GMX.NET\nPHONE:08095/513
\n\n\n\n^ page 4 of 4";
*/
STRING help_str4,"   --KANDORIA--\n  contest version\n\n
    created by\n\n     FIROBALL\n\n\n
      germany\n\n\nICQ#:12525151\nMAIL:MASTER <AT>\n        FIROBALL.DE
\n\n\n\n^ page 4 of 4";
STRING quit_str," ARE YOU SURE YOU \nWANT TO QUIT(Y/N)?";
STRING new_str," START A NEW GAME \n      (Y/N)?      ";
STRING reload_str," LOAD SAVED GAME \n      (Y/N)?      ";
STRING nomana_str,"not enough mana";
STRING nospell_str,"i do not know this spell";
STRING menu_str,"NEW GAME\nSAVE GAME\nLOAD GAME\nOPTIONS\nHELP\nQUIT";
STRING opt_str,"RESOLUTION\n\nSOUND VOLUME\n\nMUSIC VOLUME\n\nBRIGHTNESS";
STRING disp_str,"LIFE     INVENTORY                 ARMOR        MANA";
STRING camera_str, "CAMERA VIEW";
STRING nix_str,"   ";

STRING contest_str, "That's the end of the
contest version.I hope
it was fun to play,feel
free to write me your
comments.The more
extensive official demo
of KANDORIA is scheduled
for spring.

12/31/98 Firoball
12/24/03 X-MAS'03 update

Press ANY KEY to quit...";

//////////INVENTORY-STRINGS//////////
STRING str_10050, "        COMMON\n        AXE\n\nDAMAGE 1-10\n\nNOTHING SPECIAL";
STRING str_10100, "        COMMON\n        SWORD\n\nDAMAGE 1-6\n\nNOTHING SPECIAL";
STRING str_10150, "        COMMON\n        CLUB\n\nDAMAGE 1-8\n\nNOTHING SPECIAL";
STRING str_10200, "        COMMON\n        STAFF\n\nDAMAGE 1-4\n\nNOTHING SPECIAL";
STRING str_250, "        HEALING\n        POTION\n\nRECOVERS 15 LIFE";
STRING str_300, "        MANA\n        POTION\n\nRECOVERS 15 MANA";
STRING str_350, "        IRON KEY\n\n\nAN OLD KEY";
STRING str_400, "        BROWN KEY\n\n\nA RUSTY KEY";
STRING str_450, "        STRENGTH\n        POTION\n\nINCREASES\nSTRENGTH";
STRING str_500, "        AGILITY\n        POTION\n\nINCREASES\nAGILITY";
STRING str_550, "        STAMINA\n        POTION\n\nINCREASES\nSTAMINA";
STRING str_600, "        WISDOM\n        POTION\n\nINCREASES\nWISDOM";
STRING str_15050, "        PLATE\n        ARMOR\n\nARMOR CLASS 5\n\nNOTHING SPECIAL";

//////////TEXTE//////////
TEXT info_txt {
        POS_X 160;
        POS_Y 162;
        FONT big_font;
        FLAGS CENTER_X,CENTER_Y;
        STRING nix_str;}

TEXT menu_txt {
        POS_X 160;
        POS_Y 90;
        FONT big_font;
        FLAGS CENTER_X;
        STRING menu_str;}

TEXT options_txt {
        POS_X 160;
        POS_Y 18;
        FONT big_font;
        FLAGS CENTER_X;
        STRING opt_str;}

TEXT svld_txt {
	POS_X 160;
	POS_Y 54;
	FONT big_font;
	FLAGS CENTER_X;
	STRING sv_str;}

TEXT help_txt {
        POS_X 93;
        POS_Y 27;
        FONT msg_font;
        FLAGS CONDENSED;
	STRING help_str;}

TEXT anzeige_txt {
        POS_X 142;
        POS_Y 2;
        FONT msg_font;
        FLAGS CENTER_X,CONDENSED;
        STRING nix_str;}

TEXT new_txt {
        POS_X 150;
        POS_Y 149;
        FONT msg_font;
        FLAGS CENTER_X,CONDENSED;
        STRING new_str;}

TEXT reload_txt {
        POS_X 150;
        POS_Y 149;
        FONT msg_font;
        FLAGS CENTER_X,CONDENSED;
        STRING reload_str;}

TEXT quit_txt {
        POS_X 150;
        POS_Y 149;
        FONT msg_font;
        FLAGS CENTER_X,CONDENSED;
        STRING quit_str;}

TEXT hi_lo_txt {
        POS_X 160;#128;
        POS_Y 64;
        FLAGS CENTER_X, CONDENSED;
	FONT msg_font;
        STRING nix_str;}

TEXT inv_txt {
        POS_X 3;
        POS_Y 84;
        FONT small_font;
        STRINGS 1;
	STRING inventory_str;}

TEXT i_item_txt {
        POS_X 3;
        POS_Y 138;
        FONT small_font;
        STRINGS 1;
	STRING nix_str;}

TEXT char_txt {
        POS_X 3;
        POS_Y 84;
        FONT small_font;
        STRINGS 2;
	STRING char_str,nix_str;}

TEXT spell_txt {
	POS_X 3;
	POS_Y 84;
	FONT small_font;
	STRINGS 11;
	STRING spell_str,spell1_str,spell2_str,spell3_str,spell4_str,spell5_str,spell6_str,spell7_str,spell8_str,spell9_str,spell10_str;}

TEXT disp_txt {
	POS_X 30;
        POS_Y 333;
	FONT small_font;
        STRING disp_str;}

TEXT camera_txt {
        POS_X 6;
        POS_Y 2;
        FONT msg_font;
        FLAGS CONDENSED;
	STRING camera_str;}

TEXT slot1_txt {
        POS_X 110;
        POS_Y 99;
        FONT svld_font;
	FLAGS CONDENSED;
        STRING slot1_str;}

TEXT slot2_txt {
        POS_X 110;
        POS_Y 135;
        FONT svld_font;
	FLAGS CONDENSED;
        STRING slot2_str;}

TEXT slot3_txt {
        POS_X 110;
        POS_Y 171;
        FONT svld_font;
	FLAGS CONDENSED;
        STRING slot3_str;}

TEXT slot4_txt {
        POS_X 110;
        POS_Y 207;
        FONT svld_font;
	FLAGS CONDENSED;
        STRING slot4_str;}

TEXT slot5_txt {
        POS_X 110;
        POS_Y 243;
        FONT svld_font;
	FLAGS CONDENSED;
        STRING slot5_str;}

TEXT slot6_txt {
        POS_X 110;
        POS_Y 279;
        FONT svld_font;
	FLAGS CONDENSED;
        STRING slot6_str;}

TEXT conversation_txt {
        POS_X 160;
        POS_Y 68;
        FLAGS CENTER_X,CONDENSED;
	FONT italic_font;
        STRING contest_str;}

TEXT sign_txt {
        POS_X 160;
        POS_Y 98;
        FLAGS CENTER_X,CONDENSED;
	FONT italic_font;
        STRING nix_str;}
















































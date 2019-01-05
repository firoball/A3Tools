// LOCAL: Skills, die nur einmal bei Levelstart
// via LOAD_INFO geladen werden
SKILL	MOTION_BLUR	{ TYPE LOCAL; VAL 0; MIN 0; MAX 1; }
SKILL	old_music 	{ TYPE LOCAL; VAL 0.5; MIN 0; MAX 1; }
SKILL	old_sound 	{ TYPE LOCAL; VAL 0.5; MIN 0; MAX 1; }
SKILL	smus		{ TYPE LOCAL; VAL 0; }	// switch off sound/music

SKILL	old_mouse_sense { TYPE LOCAL; VAL 1; MIN 0.5; MAX 1.5; }
SKILL	old_joy_sense   { TYPE LOCAL; VAL 1; MIN 0.5; MAX 1.5; }
SKILL   old_key_sense   { TYPE LOCAL; VAL 0.7; MIN 0.5; MAX 0.9; }

SKILL MAP_SCALE 	{ TYPE LOCAL; MIN 0.1; MAX 20; }
SKILL slot			{ TYPE LOCAL; VAL -1; }	 // Zuletzt gesaveter slot (1..3)
SKILL difficulty	{ TYPE LOCAL; VAL 2; } // wird danach nie mehr veraendert

SKILL NextVideoMode { TYPE LOCAL; VAL -1; }  // mr3009
SKILL ActiveLevel   { TYPE LOCAL; VAL -1; }

SKILL EinzelLevelMode   { TYPE LOCAL; VAL 1; }


// mr2409 wird von Level.wdk benutzt
SKILL LevelLoadSlot   { TYPE GLOBAL; VAL -1; }

// 1 = wecheln des Levels, 0 = wecheln der Auflösung
SKILL LevelSwitchMode { TYPE GLOBAL; VAL 0; }

// Global Skills werden bei Neustart zurückgesetzt, und beim
// levelwechel übernommen
SKILL old_gun_type		{ TYPE GLOBAL; VAL 0; }
SKILL old_gun1 			{ TYPE GLOBAL; VAL 0; }	  // DEBUGGER
SKILL old_gun2 			{ TYPE GLOBAL; VAL 0; }	  // DEBUGGER X 2
SKILL old_gun3 			{ TYPE GLOBAL; VAL 0; }	  // INTERRUPTER
SKILL old_gun4 			{ TYPE GLOBAL; VAL 0; }	  // ERASER
SKILL old_minen			{ TYPE GLOBAL; VAL 0; }	  // MINEN
SKILL old_shield1		{ TYPE GLOBAL; VAL 0; }
SKILL old_gun5 			{ TYPE GLOBAL; VAL 0; }	// saege
SKILL glo_health		{ TYPE GLOBAL; VAL 0; } //mr0411
SKILL glo_energy		{ TYPE GLOBAL; VAL 0; }


SKILL HiscoreVal1  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal2  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal3  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal4  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal5  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal6  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal7  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal8  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal9  { TYPE LOCAL; VAL 0; }
SKILL HiscoreVal10 { TYPE LOCAL; VAL 0; }

SKILL HiscoreLev1  { TYPE LOCAL; VAL 14; }  //mr0611
SKILL HiscoreLev2  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev3  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev4  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev5  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev6  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev7  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev8  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev9  { TYPE LOCAL; VAL 14; }
SKILL HiscoreLev10 { TYPE LOCAL; VAL 14; }

STRING HiscorePos1,  "----------------";
STRING HiscorePos2,  "----------------";
STRING HiscorePos3,  "----------------";
STRING HiscorePos4,  "----------------";
STRING HiscorePos5,  "----------------";
STRING HiscorePos6,  "----------------";
STRING HiscorePos7,  "----------------";
STRING HiscorePos8,  "----------------";
STRING HiscorePos9,  "----------------";
STRING HiscorePos10, "----------------";

SKILL HiscoreStringPos1  { TYPE LOCAL; VAL 1; }
SKILL HiscoreStringPos2  { TYPE LOCAL; VAL 2; }
SKILL HiscoreStringPos3  { TYPE LOCAL; VAL 3; }
SKILL HiscoreStringPos4  { TYPE LOCAL; VAL 4; }
SKILL HiscoreStringPos5  { TYPE LOCAL; VAL 5; }
SKILL HiscoreStringPos6  { TYPE LOCAL; VAL 6; }
SKILL HiscoreStringPos7  { TYPE LOCAL; VAL 7; }
SKILL HiscoreStringPos8  { TYPE LOCAL; VAL 8; }
SKILL HiscoreStringPos9  { TYPE LOCAL; VAL 9; }
SKILL HiscoreStringPos10 { TYPE LOCAL; VAL 10; }

STRING name1_str,"** empty slot 1 **";
STRING name2_str,"** empty slot 2 **";
STRING name3_str,"** empty slot 3 **";
STRING name4_str,"** empty slot 4 **";
STRING name5_str,"** empty slot 5 **";
STRING name6_str,"** empty slot 6 **";
STRING name7_str,"** empty slot 7 **";
STRING name8_str,"** empty slot 8 **";

STRING LevPasswd, "1234567890";

// wenn hier sich was aendert muss LGVersion hochgezaehlt werden
DEFINE  LGVersion, 11;

INCLUDE <estring.wdl>;
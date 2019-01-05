//Alle Strings werden hier ausgelagert. String.wdl muá eingebunden werden!
//Jedes Level hat seinen eigenen string / Reihenfolge wie im Game
/////////////////////////////////////////////////////
STRING difficult1_str,	"Student";
STRING difficult2_str,	"Expert";
STRING difficult3_str,	"Hacker";

STRING	choose_msg,
"STOP! Before you start
choose your blood money:

  1 -   5 Cyber dollars
  2 -  10 Cyber dollars
  3 -  50 Cyber dollars

WARNING - big money
needs big boldness!";

STRING choose_1,
"You are satisfied with
5 lousy cyber-dollars?";

STRING choose_2,
"You're working for
10 cyber-dollars.";

STRING choose_3,
"Jeez, you've got to work real
hard for 50 cyber-dollars!";

STRING LoadingLevel_txt, "loading Level ";
STRING PunktPunktPunkt, "...";
STRING Level_txt, "Level ";
STRING NotFound_txt, " not found!";

STRING Passwort_txt, "Passwort: ";

STRING PleaseWait_txt, "Please Wait";

//////////////////////// MENU - STRINGS///////////////
STRING	scshot_str,"Screenshot VEX   .PCX";
STRING sndvol_set_str,	"Sound Volume";
STRING musvol_set_str,	"Music Volume";

//mr >>>>
STRING Aufloes_set_str,	"Video ";
STRING mouse_set_str,   "Mouse sens.";
STRING joy_set_str,     "Joystick sens.";
STRING exit1_str,"Back to Game";
STRING exit2_str,"Back to Game"; // Mainmenu";
STRING notavail_str,"Im Demo nicht verfuegbar";

STRING new_game_str,	"New Game";
STRING load_game_str,	"Load Game";
STRING save_game_str,	"Save Game";
STRING passwd_str,		"Password";
STRING hiscor_str,		"Hiscores";
STRING game_option_str,	"Options";
STRING quit_game_str,	"Quit Game";
STRING show_option_str,	"Help";

STRING enter_passwd_str, "Enter Password :";
STRING wrong_pw_str,     "wrong Password : ";

IFNDEF NO_RESOLUTION_SWITCH;
STRING error_change_gr_str,     "error changing the Video Mode!";
ENDIF;

STRING MessageString, "                                                                        ";
STRING levelend_str1, "Viren:\nBugs:          /\nTime:           :\nScore:";
STRING levelend_str2, "\n Any Key...";

STRING pause_on,"Pause";
STRING have_jet,"Jetbooster installed\nPress HOME/JOY4 for ignition";
STRING full_ammo,"Full Data Refresh\nVery Happy Debugging";

STRING Hiscore_Title1 "Hiscore";
STRING any_key_str, "Any Key...";
STRING Hiscore_Title2 "Pos       Name         Score   Level";


STRING mblur_set_str,	"Motion Blur";
STRING sndvol_set_str,	"Sound Volume";
STRING musvol_set_str,	"Music Volume";

STRING Aufloes_set_str,	"Video ";
STRING mouse_set_str,   "Mouse sens.";
STRING joy_set_str,     "Joystick sens.";

STRING exit1_str,"Back to Game";
STRING exit2_str,"Back to Game"; // Mainmenu";
STRING notavail_str,"Im Demo nicht verfuegbar";

STRING new_game_str,	"New Game";
STRING load_game_str,	"Load Game";
STRING save_game_str,	"Save Game";
STRING passwd_str,		"Password";
STRING hiscor_str,		"Hiscores";
STRING game_option_str,	"Options";
STRING quit_game_str,	"Quit Game";
STRING show_option_str,	"Help";

STRING enter_passwd_str, "Enter Password :";
STRING wrong_pw_str,     "wrong Password : ";

IFNDEF NO_RESOLUTION_SWITCH;
STRING error_change_gr_str,     "error changing the Video Mode!";
ENDIF;

STRING MessageString, "                                                                        ";

/*
STRING choose_1,
"Sie geben sich mit schlappen
5 Cyber-Dollar zufrieden?";

STRING choose_2,
"Sie arbeiten f}r 10 Cyber-Dollar";

STRING choose_3,
"Wow! F}r 50 Cyber-Dollar m}ssen
Sie sich schon etwas anstrengen!";
*/
/////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////

STRING netlev_txt,
"***     INFILTRATOR     ***

Select the sector,
where you want to get in:

SPACE  		- Next sector
BACKSPACE  	- Last Sector
RETURN     	- Infiltrate
ESC        	- Cancel

ATTENTION: only sectors that
have already been accessed
are available!";

STRING agent1_txt,"Skaphander 1 selected";
STRING agent2_txt,"Skaphander 2 selected";
STRING agent3_txt,"Skaphander 3 selected";
STRING agent4_txt,"Skaphander 4 selected";

STRING levtxt_0,"NEW START";

STRING levtxt_s,"LAST GAME SAVED";

STRING service_hlp,
"SERVICE-ROOM:

Monitors: Skaphander 1-4
  Selection by SPACE

Columns: Calibrating Sensors
  enhance   through SPACE
  diminish  through BACKSPACE

Entry To Net: what it says
Exit  To Dos: if you panik";

///////////////////////////////////////////////
STRING motion_s,
"SKAPHANDER CONTROL:

Cursor keys  - thrust/rotate
Shift + Key  - speed
Alt + Key    - traversal thrust
Page up/dn   - inclination
Ctrl/M-Right - debug
Space        - manipulate
Tab          - head-up map
+ / -        - map zoom";

STRING function_s,
"SYSTEM CONTROL:

 F1  - help
 F2  - quicksave
 F3  - quickload
 F5  - motion blur
 F10 - coward key
 F12 - sound control
 P   - pause
 ESC - menu";

STRING tasten_s,
"DEBUGGER CONTROL:

 1 - single debugger
 2 - twin debugger
 3 - interruptor
 4 - twin eraser
 5 - breakpoint (max. 5)
 6 - separator
 7 - sublight
 0 - nothing";

/////////////////////////////////////////////////////////////////////
STRING save_yesno,"Save Game (Y/N)?";
STRING load_yesno1,"Load Last Game (Y/N)?";
STRING load_yesno2,"Load Last-But-One Status (Y/N)?";
STRING load_yesno3,"Load Last-But-Two Status (Y/N)?";
STRING ok,"OK";
STRING save_nix,
"ERROR - Nothing saved!\n
Hard disk already full?\nPlease check!";
STRING load_nix,
"Sorry - no game found!
Remember:
Save first - then load!";
STRING wait_txt,"Please wait...";
/////////////////////////////////////////////////////////////////////

STRING	got_spanner,"Data Refresh";
STRING	got_battery,"Energy Refresh";
STRING	got_6,"Got a Sixpack!";

STRING mblur_0,"Motion Blur off";
STRING mblur_1,"Motion Blur on";
STRING mblur_2,"Motion Blur II";

STRING music_0,"Sound off, music on";
STRING music_1,"Sound on, music off";
STRING music_2,"Sound on, music on";

#waffen-strings:
STRING got_debugger,"Debugger installed";
STRING another_debugger,"Another debugger!";
STRING got_eraser,"Twin-Eraser installed";
STRING got_interruptor,"Interruptor!! Ingenious!";
STRING  got_box,"Wow! Got a toolkit!";
STRING sbuggie,"Bug eliminated";
STRING gbuggie,
"Wow! You've found a really
big bug!";
STRING shielder, "Protector activated!";
STRING shield_wegtxt, "WARNING: Protector has failed!";
STRING got_saw,"Separator installed";
STRING got_mine,"Breakpoint!\nHandle with care!";
STRING hot_mine,"Breakpoint set.";
STRING no_mine,"Limit: 5 breakpoints!";

///////////////////////////EXIT-Sprueche///////////////////////////////
STRING exit_1,"Exit? (Y/N)";
STRING exit_2,"Supper's ready, eh? (Y/N)";
STRING exit_3,"Did Mama call? (Y/N)";
STRING exit_4,"Is your Boss whatching you?\n (Y/N)";
STRING exit_5,"Urgent refresh\n of make up needed? (Y/N)";
STRING exit_6,"D'you need to change\n the diapers? (Y/N)";
STRING exit_7,"D'you have to have a look at
the dos prompt? (Y/N)";
STRING exit_8,"Delete CD-ROM? (Y/N)";
STRING exit_9,"kiss my... (Y/N)";
STRING exit_0,"Format harddisk? (Y/N)";


STRING exit_laber,
"Under some silly pretext you have interrupted your mission.
Show some responsibility! Return to Cyberspace immediately!
There's many a virus still to be eliminated.
If necessary you might as well start at the beginning.

Keep in mind: Every minute spent inside SKAPHANDER is a minute well spent.
Well, while you're in there at least you can't cause any mischief.

                                  .....

SKAPHANDER PLUS was created by oP group Germany using 3D GameStudio.
(c) oP group germany  -  Oehler & Partner  -  Frankfurt/Germany 1998\n";

//////////////////////////abkratz-sprueche////////////////////////////////
STRING abkratz_1,"\nMISSION FAILED\n\n\n\n
back to square one...";
STRING abkratz_2,"\nMISSION UNFORTUNALLY FAILED\n\n\n\n
Sad?\n there is always a new beginning...";
STRING abkratz_3,"\nBAD LUCK\n\n\n\n
Same again...";
STRING abkratz_4,"\nMISSION WAS NOT SUCCESFULL\n\n\n\n
practice needed!\ntry again..";
STRING abkratz_5,"\nMISSED MISSION\n\n\n\n
Take better care next time...";
STRING abkratz_6,"\nBLUNDER\n\n\n\n
Are you hurt badly?\n\nrestart...";
STRING abkratz_7,"\nTHAT'S NOT THE WAY IT WORKS\n\n\n\n
Some never learn.\nback to start...";
STRING abkratz_9,"\nFAILURE AGAIN!\n\n\n\n
Sorry, you get another chance...";
STRING abkratz_8,"\nMISSION TURNED OUT BADLY\n\n\n\n
Your're lucky\nthere is another chance...";
STRING abkratz_0,"\nSOMETHING IS GOING WRONG!\n\n\n\n
Are you willing to do
better now?\nrestart...";

////////////////////////////Matma-Platscher//////////////////////////
STRING matbad_0,"Bllubbgurrglllttschschgrrbl";
STRING matbad_1,"Cool!";
STRING matbad_2,"Refreshing, isn't it?";
STRING matbad_3,"*** IMPORTANT ADVICE ***\n\nDiving lessons every monday\n at 8:00 a.m.";
STRING matbad_4,"Went for a bath again?";
STRING matbad_5,
"It's a nice day for a bath,
isn't it?";
STRING matbad_6,
"Why don't you take some
diving lessons?";
STRING matbad_7,
"How about a submarine
instead of a Skaphander?";
STRING matbad_8,
"Do you really think this is a
good place to attend to your
hobby?";
STRING matbad_9,
"We all live in a
yellow submarine...\n except you!";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
STRING debugger_touch,	" Debugger  ";
STRING eraser_touch,		"  Erasor   ";
STRING interrup_touch,	"Interruptor";
STRING mine_touch,		"   Mine    ";
STRING mine_1_touch,		"Mine active";
STRING sge_touch,			" Separator ";
// Werkzeug
STRING energy_touch,		"  Energy   ";
STRING energbig_touch,	"Energy Bolt";
STRING refresher_touch,	" Refresher ";
STRING box_touch,			"  Toolkit  ";
STRING protec_touch,		" Protector ";
STRING exbox_touch,		"   Memory  ";

STRING s_bug_touch,		"Silver Bug ";
STRING g_bug_touch,		"  Gold Bug ";

STRING tank_touch,		"Energy Box ";
STRING repair_touch,		"Repair Box ";
// Tonnen
STRING tonne2_touch,		"  Fluidum  ";
STRING tonne_g_touch,	"Data Thrash";
// Lampen
STRING lamp1_touch,		"Data Sensor";
STRING lamp2_touch,		"Checkpoint ";
STRING lamp3_touch,		"Controlspot";
STRING lamp4_touch,		"Heat Sensor";
STRING lamp4a_touch,		"Transformer";


//Viren
STRING vir0_touch,		" R.I.P.    ";

STRING tron_touch,		"   Tron    ";
STRING aba_touch,			"  Abacus   ";
STRING whopp_touch,		"  Whopper  ";
STRING xmas_touch,		"   X-Mas   ";
STRING db_x1_touch,		"  Mutator  ";
STRING db_x2_touch,		"   Rotor   ";
STRING db_x3_touch,		" Impulser  ";
STRING dbwhop_touch,		" Flatscope ";
STRING db_aba_touch,		"   Alien   ";

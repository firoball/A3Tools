//////////////////////////////////////////////////////////////////////////////////////////
//                                9-6-1997    -    1-1-1998                             //
//                                                                                      //
//                           _______________________________                            //
//                          | *   THE LORD OF LIGHTNING   * |                           //
//                          |_______________________________|                           //
//                                                                                      //
//                                                                                      //
//                               This Game Is Freeware!                                 //
//                            This Is The DEMO VERSION Of LL                            //
//                           Copyright  Virtua Demon Software                           //
//                               This Game Is Freeware!                                 //
//                                                                                      //
//                                    Programed By:                                     //
//                                                                                      //
//                                 Alexander K. Seifriz                                 //
//                                 Feckenhauser Str.27                                  //
//                                   78628 Rottweil                                     //
//                                       GERMANY                                        //
//                            E-Mail: gambitsoft@t-online.de                            //
//                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////

//+++WHAT ARE YOU DOING HERE???+++////////////////////////////////////////////////////////
//
// - ENGLISH -
//
// Hello! I don't wanna ask you what you're doing here but
// you can't change anything in this file (NO, here isn't the God mode!).
//
// !!!    WE STRONGLY RECOMMEND THAT YOU DO  N O T  CHANGE ANYTHING IN THIS FILE   !!!
// !!! WE STRONGLY RECOMMEND THAT YOU DO  N O T  CHANGE ANYTHING IN THE GAME FILES !!!
//
// The game THE LORD OF LIGHTNING will no longer run if you change anything!!!
// Ha, ha, do you really think German programmers are such fools to write
// games which every hacker can change without any problems ???
// Yes, you thought so, I know, I know...
//
// It's not the right place to tell you this but there are three things you've got to know:
// 1.
// THIS GAME IS FREEWARE!! You can copy it and give it to your Grandma and to
// any other person in the world!
// 2.
// You could make me very happy if you contact me and tell me your opinion about the game!
// So I can learn, when I start to make a new 3D-game!
// If you have good ideas for a 3D game I try to use them!
// And maybe I show your name in the intro or extro...
// 3.
// Copyright of this game belongs to the programmer!
// You are N O T allowed to take files of the game away and use them otherwise!
// You are N O T allowed to sell this game (IT IS FREEWARE!)!
//
// And now leave this file and prepare to enter THE LORD OF LIGHTNING!
//                             H A V E     F U N !
//
// And I will explain all that shit to the Germans...



// - DEUTSCH -
//
// So, nun zu Dir. Hast Du schon mal daran gedacht, Englisch zu lernen
// (Hey, scheissegal, ich kann's eigentlich auch nicht. Sollen die doch
// Deutsch lernen... aber leider sagt mir etwas, das sie's nicht tun werden.)
//
// Was suchst Du eigentlich hier? Ach,... den Godmode ?? NEIN! Der ist nicht hier!
// Doch selbst, wenn er hier waere, wuerde ich mir zuerst das Folgende durchlesen!
//
// !!!        ES WIRD DRINGEND DAVON ABGERATEN, PARAMETER DIESER DATEI ZU VERAENDERN          !!!
// !!! ES WIRD DRINGEND DAVON ABGERATEN, IRGENDETWAS IN DEN DATEIEN DES SPIELES ZU VERAENDERN !!!
//
// Das Programm THE LORD OF LIGHTNING wird nicht mehr funktionieren, wenn Du etwas
// derartiges tust!
// Dachtest Du wirklich, dass ich so bloed bin, jedem Hacker ein Schummelparadies
// anzubieten??? Wahrscheinlich schon, gell...
//
// Es ist absolut nicht der richtige Platz, aber es gibt drei Dinge, die Du wissen mußt:
// 1.
// DIESES SPIEL IST FREEWARE! Du kannst es Deiner Grossmutter schenken und Kopien an alle Menschen,
// die Du auf unserem Planeten kennst, weitergeben!
// 2.
// Du koenntest mich zusaetzlich sehr gluecklich machen,
// wenn Du mir sagst, was ich besser machen kann!!
// Ich versuche dann bei meinem naechsten 3D-Spiel, Deine Wuensche und Ideen zu verwirklichen!
// Wenn sie mir sehr gefallen und sie eine wichtige Funktion im Programm haben,
// werde ich Deinen Namen im Intro oder Extro erwaehnen!
// 3.
// Alle Rechte von diesem Spiel gehören dem Programmierer!
// Es ist NICHT ERLAUBT (und zudem sehr illegal), Dateien des Spieles zu entfernen und
// anderweitig zu verwenden!
// Es ist NICHT ERLAUBT, dieses Spiel zu VERKAUFEN (es ist FREEWARE!)!
//
// So, nun verlasse diese Datei und starte das Spiel THE LORD OF LIGHTNING!
//                                  V I E L   S P A S S !


// A.K.Seifriz
// 12-18-1997







//+++SOUNDS+++////////////////////////////////////////////////////////////////////////////
SOUND schritt_snd,       <ta.wav>;
SOUND kissenschritt_snd, <bs.wav>;
SOUND blopp_snd,         <ml.wav>;
SOUND knirsch_snd,       <kn.wav>;
SOUND schalter_snd,      <schalt.wav>;
SOUND schluessel_snd,    <schlu.wav>;
SOUND theend_snd,        <theend.wav>;
SOUND tuer1_snd,         <tuer.wav>;
SOUND tuer2_snd,         <tuer2.wav>;
SOUND blaetscher_snd,    <blae.wav>;
SOUND tauch_snd,         <wasser2.wav>;
SOUND burn_snd,          <burn.wav>;
SOUND crash_snd,         <crash.wav>;
SOUND beah_snd,          <bea.wav>;

//+++SKILLS+++////////////////////////////////////////////////////////////////////////////
SKILL leben            {VAL 100; MIN 0; MAX 100;}
 SKILL lebenpro         {MIN 59; MAX 223;}
SKILL mana             {VAL 100; MIN 0; MAX 100;}
 SKILL manapro          {MIN 59; MAX 223;}

SKILL hab_schluessel     {}
SKILL zaehler2           {}
SKILL schonmal_skill     {}
SKILL schonmal2_skill    {}
SKILL schonmal3_skill    {}
SKILL blitzzaehler_skill {}
SKILL zaehler            {}

//+++KOPF+++//////////////////////////////////////////////////////////////////////////////
VIDEO		S640x480;
MAPFILE		<LL_wmp.WMP>;
BIND		<LL_wdl.WDL>;
INCLUDE         <LL_move.wdl>;
INCLUDE         <LL_men.wdl>;
INCLUDE         <LL_mumie.wdl>;
INCLUDE         <LL_wire.wdl>;
NEXUS           200;

//+++STARTAKTION+++///////////////////////////////////////////////////////////////////////
IF_START LL;

ACTION LL {
SET  IF_F10,NULL;
SET  IF_TAB,NULL;
SET  IF_F12,NULL;
CALL set_walking;
CALL LL_showit0;
CALL tataa_play;
}

ACTION LL_neu {SET strafe_text.VISIBLE,0; SET strafe2_text.VISIBLE,0; SET strafe3_text.VISIBLE,0; SET strafe4_text.VISIBLE,0; SET wstrafe_text.VISIBLE,0;
CALL neustart_act; LOAD "zero",0;}

//+++PALETTENDEFINITION+++////////////////////////////////////////////////////////////////
PALETTE pal1 {	PALFILE <LL_pal.pcx>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,16;	RANGE 64,16;
	RANGE 80,16;	RANGE 96,16;	RANGE 112,16;	RANGE 128,16;
	RANGE 144,16;	RANGE 160,16;	RANGE 176,16;	RANGE 192,16;
	RANGE 208,16;	RANGE 224,16;	RANGE 240,16;
}

//+++BMAP+++//////////////////////////////////////////////////////////////////////////////
BMAP   platzhalter_map           <platzh.pcx>  ,0,0,64,64;
BMAP   marmor1_map               <marmor.pcx>  ,0,0,64,128;
BMAP   marmor1_fmap              <marmor.pcx>  ,0,0,64,64;
BMAP   himmel_map                <himmel.pcx>  ,0,0,384,890;
BMAP   himmel1_fmap              <fenster.pcx> ,128,0,128,128;
BMAP   himmel1_map               <fenster.pcx> ,128,0,64,128;
BMAP   holzbole_fmap             <bauk.pcx>    ,256,0,128,128;
BMAP   holzbole_map              <bauk.pcx>    ,256,0,64,128;
BMAP   kacheln1_fmap             <kacheln.pcx> ,0,0,128,128;
BMAP   kacheln2_fmap             <kacheln.pcx> ,128,0,128,128;
BMAP   metall1_fmap              <mauermet.pcx>,128,0,128,128;
BMAP   metall1_map               <mauermet.pcx>,128,0,64,128;
BMAP   metall2_fmap              <mauermet.pcx>,256,0,128,128;
BMAP   metall2_map               <mauermet.pcx>,256,0,64,128;
BMAP   tuer1_fmap                <bauk.pcx>    ,128,0,128,128;
BMAP   tuer1_map                 <bauk.pcx>    ,128,0,64,128;
BMAP   wasser1A_fmap             <wasser.pcx>  ,0,0,64,64;
BMAP   wasser1B_fmap             <wasser.pcx>  ,64,0,64,64;
BMAP   wasser1C_fmap             <wasser.pcx>  ,128,0,64,64;
BMAP   wasser1D_fmap             <wasser.pcx>  ,192,0,64,64;
BMAP   marmor2_fmap              <marmor.pcx>  ,64,0,128,128;
BMAP   marmor3_map               <marmor.pcx>  ,192,0,64,128;
BMAP   verputz1_fmap             <bauk.pcx>    ,384,0,128,128;
BMAP   verputz1_map              <bauk.pcx>    ,384,0,64,128;
BMAP   ziegel1_fmap              <bauk.pcx>    ,0,0,128,128;
BMAP   kacheln3_fmap             <kacheln.pcx> ,256,0,128,128;
BMAP   kacheln3_map              <kacheln.pcx> ,256,0,64,128;
BMAP   delphin_map               <bauk.pcx>    ,512,0,64,128;
BMAP   goettin1_map              <ding.pcx>    ,0,0,90,300;
BMAP   vase1_map                 <ding.pcx>    ,90,0,128,256;
BMAP   mauer1_map                <mauermet.pcx>,0,0,64,128;
BMAP   mauer1_fmap               <mauermet.pcx>,0,0,64,64;
BMAP   mauer2_map                <mauermet.pcx>,64,0,64,128;
BMAP   mauer2_fmap               <mauermet.pcx>,64,0,64,64;
BMAP   marmor4_map               <marmor.pcx>  ,320,0,64,128;
BMAP   marmor4_fmap              <marmor.pcx>  ,320,0,64,64;
BMAP   marmor5_map               <marmor.pcx>  ,384,0,64,128;
BMAP   marmor5_fmap              <marmor.pcx>  ,384,0,64,64;
BMAP   fenster0_map              <fenster.pcx> ,0,0,64,128;
BMAP   fenster1_map              <fenster.pcx> ,64,0,64,128;
BMAP   fenster0schatten_fmap     <fenster.pcx> ,256,0,64,64;
BMAP   fenster1schatten_fmap     <fenster.pcx> ,320,0,64,64;
BMAP   kacheln4_fmap             <kacheln.pcx> ,384,0,64,64;
BMAP   kacheln4_map              <kacheln.pcx> ,384,0,32,64;
BMAP   kacheln5_fmap             <kacheln.pcx> ,448,0,128,128;
BMAP   tierwand_map              <ding.pcx>    ,0,300,176,128;
BMAP   schluesselwand_map        <ding.pcx>    ,177,300,32,32;
BMAP   kettenwand_map            <ding.pcx>    ,0,428,161,256;
BMAP   fackel1A_map              <fackel.pcx>  ,0,0,100,215;
BMAP   fackel1B_map              <fackel.pcx>  ,100,0,100,215;
BMAP   fackel1C_map              <fackel.pcx>  ,200,0,100,215;
BMAP   menschen_map              <wandbild.pcx>,0,0,229,128;
BMAP   menschenoben_map          <kacheln.pcx> ,384,64,64,64;
BMAP   stoff_fmap                <marmor.pcx>  ,448,0,64,64;
BMAP   stoff_map                 <marmor.pcx>  ,448,0,64,64;
BMAP   gitter_map                <bauk.pcx>    ,576,0,64,128;
BMAP   gefstein_map              <bauk.pcx>    ,640,0,64,128;
BMAP   schluessel1_map           <ding.pcx>    ,0,684,218,44;
BMAP   mg_fmap                   <mg.pcx>      ,0,0,128,128;
BMAP   impuls1_fmap              <impuls.pcx>  ,0,0,64,64;
BMAP   impuls2_fmap              <impuls.pcx>  ,64,0,64,64;
BMAP   impuls3_fmap              <impuls.pcx>  ,128,0,64,64;
BMAP   impuls1_map               <impuls.pcx>  ,0,0,64,64;
BMAP   impuls2_map               <impuls.pcx>  ,64,0,64,64;
BMAP   impuls3_map               <impuls.pcx>  ,128,0,64,64;
BMAP   flablau1_map              <fla.pcx>     ,50,0,50,100;
BMAP   flablau2_map              <fla.pcx>     ,0,0,50,100;
BMAP   flarot1_map               <fla.pcx>     ,100,0,50,100;
BMAP   flarot2_map               <fla.pcx>     ,150,0,50,100;
BMAP   katze_fmap                <mauermet.pcx>,384,0,128,128;
BMAP   goettin1p_map             <platz.pcx>   ,0,0,90,300;
BMAP   vaseplatz_map             <platz.pcx>   ,90,0,128,256;
BMAP   blitz1_map                <platz.pcx>   ,225,0,75,145;
BMAP   blitz2_map                <platz.pcx>   ,225,145,75,145;
BMAP   kerze1_map                <ding0.pcx>   ,0,0,75,145;
BMAP   kerze2_map                <ding0.pcx>   ,75,0,75,145;
BMAP   kerzeplatz_map            <ding0.pcx>   ,150,0,75,145;
BMAP   fass1_map                 <ding0.pcx>   ,225,0,75,145;
BMAP   fass2_map                 <ding0.pcx>   ,300,0,75,145;
BMAP   fass3_map                 <ding0.pcx>   ,375,0,75,145;
BMAP   pflanze1_map              <ding0.pcx>   ,450,0,100,145;
BMAP   pflanze2_map              <ding0.pcx>   ,550,0,100,145;
BMAP   david_map                 <david.pcx>   ,0,0,50,113;
BMAP   kopf_map                  <david.pcx>   ,50,0,83,116;
BMAP   blutplatte_fmap           <david.pcx>   ,133,0,128,128;
BMAP   brutal_map                <mart.pcx>    ,0,0,100,331;
BMAP   brutal2_map               <mart.pcx>    ,100,0,100,331;
BMAP   brutal3_map               <mart.pcx>    ,200,0,100,331;

//+++TEXTUREN+++//////////////////////////////////////////////////////////////////////////
TEXTURE platzhalter_tex          {SCALE_XY 2,2;   BMAPS platzhalter_map;}
TEXTURE marmor1_tex              {SCALE_XY 16,16; BMAPS marmor1_map; AMBIENT 0.3;}
TEXTURE marmor1_ftex             {SCALE_XY 16,16; BMAPS marmor1_fmap; AMBIENT 0.3; SOUND schritt_snd; SVOL 0.4;}
TEXTURE marmor1was_ftex          {SCALE_XY 16,16; AMBIENT 0.3; CYCLES 2; BMAPS marmor1_fmap, marmor1_fmap; DELAY 12,12; SOUND tauch_snd; SVOL 0.35;}
TEXTURE marmor1ruhig_ftex        {SCALE_XY 16,16; BMAPS marmor1_fmap; AMBIENT 0.3;}
TEXTURE himmel_ftex              {SCALE_XY 5,5; FLAGS SKY; SIDES 10;  BMAPS himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map;}
TEXTURE himmel_tex               {SCALE_XY 5,5; FLAGS SKY; SIDES 10;  BMAPS himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map,himmel_map;}
TEXTURE himmel1_ftex             {SCALE_XY 16,16; BMAPS himmel1_fmap; AMBIENT 0.4; SOUND schritt_snd; SVOL 0.4;}
TEXTURE himmel1_tex              {SCALE_XY 16,16; BMAPS himmel1_map; AMBIENT 0.9;}
TEXTURE holzbole_ftex            {SCALE_XY 16,16; BMAPS holzbole_fmap; AMBIENT 0.4; SOUND schritt_snd; SVOL 0.4;}
TEXTURE holzbole_tex             {SCALE_XY 16,16; BMAPS holzbole_map; AMBIENT 0.4;}
TEXTURE holzbole_hell_tex        {SCALE_XY 16,16; BMAPS holzbole_map; AMBIENT 0.8; SOUND schritt_snd; SVOL 0.4;}
TEXTURE kacheln1_ftex            {SCALE_XY 16,16; BMAPS kacheln1_fmap; SOUND schritt_snd; SVOL 0.4;}
TEXTURE kacheln2_ftex            {SCALE_XY 24,24; BMAPS kacheln2_fmap; SOUND schritt_snd; SVOL 0.4;}
TEXTURE metall1_ftex             {SCALE_XY 24,24; BMAPS metall1_fmap; AMBIENT 0.4; SOUND schritt_snd; SVOL 0.4;}
TEXTURE metall1_tex              {SCALE_XY 24,24; BMAPS metall1_map; AMBIENT 0.4;}
TEXTURE metall2_ftex             {SCALE_XY 24,24; BMAPS metall2_fmap; AMBIENT 0.9; SOUND schritt_snd; SVOL 0.4;}
TEXTURE metall2_tex              {SCALE_XY 24,24; BMAPS metall2_map; AMBIENT 0.9;}
TEXTURE tuer1_ftex               {SCALE_XY 24,24; BMAPS tuer1_fmap; AMBIENT 0.55; SOUND schritt_snd; SVOL 0.4;}
TEXTURE tuer1_tex                {SCALE_XY 24,24; BMAPS tuer1_map; AMBIENT 0.55;}
TEXTURE wasser1_ftex             {SCALE_XY 16,16; CYCLES 6; BMAPS wasser1A_fmap, wasser1B_fmap, wasser1C_fmap, wasser1D_fmap, wasser1C_fmap, wasser1B_fmap; DELAY 3,3,3,3,3,3; AMBIENT 0.5; SOUND blaetscher_snd; SVOL 0.5;}
TEXTURE wasser2_ftex             {SCALE_XY 16,16; CYCLES 6; BMAPS wasser1A_fmap, wasser1B_fmap, wasser1C_fmap, wasser1D_fmap, wasser1C_fmap, wasser1B_fmap; DELAY 3,3,3,3,3,3; AMBIENT 0.5; SOUND tauch_snd; SVOL 0.35;}
TEXTURE marmor2_ftex             {SCALE_XY 16,16; BMAPS marmor2_fmap; SOUND schritt_snd; SVOL 0.6;}
TEXTURE marmor3_tex              {SCALE_XY 24,24; BMAPS marmor3_map; AMBIENT 0.5;}
TEXTURE verputz1_ftex            {SCALE_XY 16,16; BMAPS verputz1_fmap; AMBIENT 0.2; SOUND schritt_snd; SVOL 0.4;}
TEXTURE verputz1_tex             {SCALE_XY 16,16; BMAPS verputz1_map; AMBIENT 0.2;}
TEXTURE ziegel1_ftex             {SCALE_XY 16,16; BMAPS ziegel1_fmap; AMBIENT 0.3; SOUND schritt_snd; SVOL 0.4;}
TEXTURE kacheln3_ftex            {SCALE_XY 20,20; BMAPS kacheln3_fmap;AMBIENT 0.3; SOUND schritt_snd; SVOL 0.4;}
TEXTURE kacheln3_tex             {SCALE_XY 20,20; BMAPS kacheln3_map; AMBIENT 0.3;}
TEXTURE delphin_tex              {SCALE_XY 16,16; BMAPS delphin_map;}
TEXTURE goettin1_tex             {SCALE_XY 24,24; BMAPS goettin1_map; AMBIENT 1;}
TEXTURE vase1_tex                {SCALE_XY 30,30; BMAPS vase1_map; AMBIENT 1;}
TEXTURE mauer1_tex               {SCALE_XY 20,20; BMAPS mauer1_map; AMBIENT 0.2;}
TEXTURE mauer1_ftex              {SCALE_XY 20,20; BMAPS mauer1_fmap; AMBIENT 0.2; SOUND schritt_snd; SVOL 0.4;}
TEXTURE mauer2_tex               {SCALE_XY 20,20; BMAPS mauer2_map; AMBIENT 0.2;}
TEXTURE mauer2_ftex              {SCALE_XY 20,20; BMAPS mauer2_fmap; AMBIENT 0.2; SOUND schritt_snd; SVOL 0.4;}
TEXTURE marmor4_tex              {SCALE_XY 20,20; BMAPS marmor4_map; AMBIENT 0.3;}
TEXTURE marmor4_ftex             {SCALE_XY 20,20; BMAPS marmor4_fmap; AMBIENT 0.3; SOUND schritt_snd; SVOL 0.4;}
TEXTURE fenster0_tex             {SCALE_XY 20,20; BMAPS fenster0_map; AMBIENT 0.8;}
TEXTURE fenster1_tex             {SCALE_XY 20,20; BMAPS fenster1_map; AMBIENT 0.8;}
TEXTURE fenster0schatten_ftex    {SCALE_XY 20,20; BMAPS fenster0schatten_fmap; AMBIENT 0.8; SOUND schritt_snd; SVOL 0.4;}
TEXTURE fenster1schatten_ftex    {SCALE_XY 20,20; BMAPS fenster1schatten_fmap; AMBIENT 0.8; SOUND schritt_snd; SVOL 0.4;}
TEXTURE kacheln4_ftex            {SCALE_XY 20,20; BMAPS kacheln4_fmap; SOUND schritt_snd; SVOL 0.4;}
TEXTURE kacheln4_tex             {SCALE_XY 20,20; BMAPS kacheln4_map;}
TEXTURE tierwand_tex             {SCALE_XY 26,26; BMAPS tierwand_map; AMBIENT 1;}
TEXTURE kettenwand_tex           {SCALE_XY 26,26; BMAPS kettenwand_map; AMBIENT 1;}
TEXTURE schluesselwand_tex       {SCALE_XY 20,24; BMAPS schluesselwand_map; AMBIENT 1;}
TEXTURE fackel1_tex              {SCALE_XY 60,60; CYCLES 4; BMAPS fackel1A_map, fackel1B_map, fackel1C_map, fackel1B_map; DELAY 3,3,3,3; AMBIENT 1; SOUND burn_snd; SVOL 0.12; SDIST 60; FLAGS SLOOP;}
TEXTURE kacheln5_ftex            {SCALE_XY 16,16; BMAPS kacheln5_fmap; AMBIENT 1; SOUND schritt_snd; SVOL 0.4;}
TEXTURE menschen_tex             {SCALE_XY 24,24; BMAPS menschen_map; AMBIENT 1;}
TEXTURE menschenoben_tex         {SCALE_XY 24,24; BMAPS menschenoben_map; AMBIENT 1;}
TEXTURE marmor5_tex              {SCALE_XY 24,24; BMAPS marmor5_map; AMBIENT 0.8;}
TEXTURE marmor5_ftex             {SCALE_XY 24,24; BMAPS marmor5_fmap; AMBIENT 0.8; SOUND schritt_snd; SVOL 0.4;}
TEXTURE stoff_ftex               {SCALE_XY 20,20; BMAPS stoff_fmap; AMBIENT 0.8; SOUND kissenschritt_snd; SVOL 0.5;}
TEXTURE stoff_tex                {SCALE_XY 20,20; BMAPS stoff_map; AMBIENT 0.8;}
TEXTURE gitter_tex               {SCALE_XY 20,20; BMAPS gitter_map; AMBIENT 1;}
TEXTURE gefstein_tex             {SCALE_XY 20,20; BMAPS gefstein_map; AMBIENT 0.8;}
TEXTURE schluessel1_tex          {SCALE_XY 80,80; BMAPS schluessel1_map; AMBIENT 1;}
TEXTURE mg_ftex                  {SCALE_XY 24,24; BMAPS mg_fmap; AMBIENT 1;  SOUND kissenschritt_snd; SVOL 0.6;}
TEXTURE impuls_ftex              {SCALE_XY 180,180; CYCLES 4; BMAPS impuls1_fmap, impuls2_fmap, impuls3_fmap, impuls2_fmap; DELAY 4,4,4,4; AMBIENT 1;}
TEXTURE impuls_tex               {SCALE_XY 180,180; CYCLES 4; BMAPS impuls1_map, impuls2_map, impuls3_map, impuls2_map; DELAY 4,4,4,4; AMBIENT 1;}
TEXTURE flablau1_tex             {SCALE_XY 50,50; BMAPS flablau1_map; AMBIENT 1;}
TEXTURE flablau2_tex             {SCALE_XY 45,45; BMAPS flablau2_map; AMBIENT 1;}
TEXTURE flarot1_tex              {SCALE_XY 50,50; BMAPS flarot1_map; AMBIENT 1;}
TEXTURE flarot2_tex              {SCALE_XY 45,45; BMAPS flarot2_map; AMBIENT 1;}
TEXTURE katze_ftex               {SCALE_XY 30,30; BMAPS katze_fmap; AMBIENT 1;}
TEXTURE goettin1p_tex            {SCALE_XY 24,24; BMAPS goettin1p_map; AMBIENT 1;}
TEXTURE vaseplatz_tex            {SCALE_XY 30,30; BMAPS vaseplatz_map; AMBIENT 1;}
TEXTURE blitz1_tex               {SCALE_XY 25,25; BMAPS blitz1_map; AMBIENT 1;}
TEXTURE blitz2_tex               {SCALE_XY 25,25; BMAPS blitz2_map; AMBIENT 1;}
TEXTURE kerze_tex                {SCALE_XY 28,28; CYCLES 4; BMAPS kerze1_map, kerze2_map, kerze1_map, kerze2_map; DELAY 2,3,2,1; AMBIENT 1; SOUND burn_snd; SCYCLES 1,0,0,0; SVOL 0.25; SDIST 12;}
TEXTURE kerzeplatz_tex           {SCALE_XY 28,28; BMAPS kerzeplatz_map; AMBIENT 1;}
TEXTURE fass_tex                 {SCALE_XY 35,35; CYCLES 3; BMAPS fass1_map, fass2_map, fass3_map; DELAY 3,3,3; AMBIENT 1; SOUND crash_snd; SCYCLES 1,0,0; SVOL 0.7; SDIST 70; FLAGS ONESHOT;}
TEXTURE pflanze1_tex             {SCALE_XY 58,58; BMAPS pflanze1_map; AMBIENT 0.3;}
TEXTURE pflanze2_tex             {SCALE_XY 50,50; BMAPS pflanze2_map;}
TEXTURE david_tex                {SCALE_XY 35,35; BMAPS david_map; AMBIENT 0.8;}
TEXTURE kopf_tex                 {SCALE_XY 70,70; BMAPS kopf_map; AMBIENT 0.8;}
TEXTURE blutplatte_ftex          {SCALE_XY 24,24; BMAPS blutplatte_fmap; AMBIENT 0.2;}
TEXTURE brutal_tex               {SCALE_XY 42,42; CYCLES 4; BMAPS brutal_map, brutal2_map, brutal3_map, platzhalter_map; DELAY 2,4,4,4; AMBIENT 0.4; SOUND beah_snd; SCYCLES 1,0,0,0; SVOL 0.7; SDIST 70; FLAGS ONESHOT;}

//+++THINGS+++////////////////////////////////////////////////////////////////////////////
THING goettin1_thing             {TEXTURE goettin1_tex; HEIGHT -0.1; IF_HIT goettin1_platz; FLAGS FRAGILE;}
 ACTION goettin1_platz {SET MY.IF_HIT,NULL; SET MY.FRAGILE,0; SET MY.TEXTURE,goettin1p_tex; PLAY_SOUND knirsch_snd,0.7;}
THING goettin1_oben_thing        {TEXTURE goettin1_tex; FLAGS GROUND; HEIGHT 29.9; IF_HIT goettin1_platz; FLAGS FRAGILE;}
THING vase1_thing                {TEXTURE vase1_tex; HEIGHT -0.2; IF_HIT vase_platz; FLAGS FRAGILE;}
 ACTION vase_platz {SET MY.IF_HIT,NULL; SET MY.FRAGILE,0; SET MY.TEXTURE,vaseplatz_tex; PLAY_SOUND knirsch_snd,0.5; SET MY.PASSABLE,1;}
THING fackel1_thing              {TEXTURE fackel1_tex; FLAGS CANDELABER;}
THING schluessel1_thing          {TEXTURE schluessel1_tex; HEIGHT -0.1; DIST 3; IF_NEAR nimm_schluessel;}
 ACTION nimm_schluessel {PLAY_SOUND schluessel_snd,0.4; SET MY.INVISIBLE,1; SET MY.PASSABLE,1; SET hab_schluessel,1; CALL schluessel_act;}
THING flablau1_thing             {TEXTURE flablau1_tex; HEIGHT -0.2; DIST 3; IF_NEAR blopp1_act;}
THING flablau2_thing             {TEXTURE flablau2_tex; HEIGHT -0.1; DIST 3; IF_NEAR blopp2_act;}
THING flarot1_thing              {TEXTURE flarot1_tex;               DIST 3; IF_NEAR blopp3_act;}
THING flarot2_thing              {TEXTURE flarot2_tex;               DIST 3; IF_NEAR blopp4_act;}
THING flablau1u_thing            {TEXTURE flablau1_tex; HEIGHT 15.9; DIST 3; IF_NEAR blopp1_act; FLAGS GROUND;}
THING flablau2u_thing            {TEXTURE flablau2_tex; HEIGHT 4.9;  DIST 3; IF_NEAR blopp2_act; FLAGS GROUND;}
THING flarot1u_thing             {TEXTURE flarot1_tex;  HEIGHT 15.9; DIST 3; IF_NEAR blopp3_act; FLAGS GROUND;}
THING flarot2u_thing             {TEXTURE flarot2_tex;  HEIGHT 4.9;  DIST 3; IF_NEAR blopp4_act; FLAGS GROUND;}
THING blitz1_thing               {TEXTURE blitz1_tex; HEIGHT 1; DIST 2; IF_NEAR aktivieren_act;}
THING blitz2_thing               {TEXTURE blitz2_tex; HEIGHT 1;}
THING kerze_thing                {TEXTURE kerze_tex; HEIGHT -0.7; IF_HIT kerze_platz; FLAGS FRAGILE;}
 ACTION kerze_platz {SET MY.IF_HIT,NULL; SET MY.FRAGILE,0; SET MY.TEXTURE,kerzeplatz_tex; PLAY_SOUND knirsch_snd,0.5; SET MY.PASSABLE,1;}
THING fass_thing                 {TEXTURE fass_tex; IF_HIT fass_platz; FLAGS FRAGILE;}
  ACTION fass_platz {SET MY.IF_HIT,NULL; SET MY.FRAGILE,0; SET MY.PLAY,1; SET MY.PASSABLE,1;}
THING pflanze1_thing             {TEXTURE pflanze1_tex; FLAGS PASSABLE;}
THING pflanze2_thing             {TEXTURE pflanze2_tex; FLAGS PASSABLE;}
THING beckenpflanze1_thing       {TEXTURE pflanze1_tex; HEIGHT -25; FLAGS GROUND, PASSABLE;}
THING beckenpflanze2_thing       {TEXTURE pflanze2_tex; HEIGHT -25; FLAGS GROUND, PASSABLE;}
THING david_thing                {TEXTURE david_tex; HEIGHT -0.05;}
THING kopf_thing                 {TEXTURE kopf_tex; HEIGHT -0.05;}
THING brutal_thing               {TEXTURE brutal_tex; IF_HIT brutal_act; FLAGS CANDELABER, FRAGILE;}
 ACTION brutal_act {SET MY.IF_HIT,NULL; SET MY.FRAGILE,0; SET MY.PLAY,1; SET MY.PASSABLE,1;}

ACTION aktivieren_act {ADD blitzzaehler_skill,1; SET MY.IF_NEAR,NULL; SET MY.TEXTURE,blitz2_tex; IF_ABOVE blitzzaehler_skill,1.5; BRANCH beamtoroffen_act; CALL beamtorfastoffen_act;}
ACTION beamtorgitterweg_act {SET gitter2a_wall.INVISIBLE,1; SET gitter2a_wall.PASSABLE,1;}

ACTION blopp1_act {PLAY_SOUND blopp_snd,0.8; CALL esistblau1;}
ACTION blopp2_act {PLAY_SOUND blopp_snd,0.8; CALL esistblau2;}
ACTION blopp3_act {PLAY_SOUND blopp_snd,0.8; CALL esistrot1;}
ACTION blopp4_act {PLAY_SOUND blopp_snd,0.8; CALL esistrot2;}

//+++TUER_SCHWINGER_1+++//////////////////////////////////////////////////////////////////
THING  tuerangel1_thing {TEXTURE platzhalter_tex;}

REGION LL_pal_tuer {FLOOR_HGT 10; CEIL_HGT 10; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; FLAGS SAVE; GENIUS tuerangel1_thing;}

ACTION schwing_auf {
SET THERE.IF_ENTER,NULL;
SET zaehler,0;
PLAY_SOUND tuer1_snd,0.6;
SET LL_pal_tuer.EACH_TICK, auf;
}

ACTION auf {
ROTATE THERE,0.1;
ADD zaehler,0.1;
IF_BELOW zaehler,1.5;
 END;
SET THERE.EACH_TICK,NULL;
}

//+++TUER_SCHWINGER_2+++//////////////////////////////////////////////////////////////////
REGION LL_bt_tuerkontakt {FLOOR_HGT 17; CEIL_HGT 27; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex; IF_ENTER pruefen; FLAGS SAVE;}
REGION LL_bt_tuer        {FLOOR_HGT 7; CEIL_HGT 7; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; FLAGS SAVE;}

ACTION pruefen {IF_ABOVE hab_schluessel,0.5; BRANCH shift; IF_EQUAL schonmal_skill,0; CALL keinschluessel_act; SET schonmal_skill,1;}

ACTION shift {CALL passt_act; SET zaehler2,0; SET THERE.IF_ENTER, NULL; SET LL_bt_tuer.EACH_TICK, et;}
ACTION et    {SHIFT LL_bt_tuer,0,0.1; ADD zaehler2,0.1; PLAY_SOUND tuer2_snd,0.35; IF_ABOVE zaehler2,8; SET LL_bt_tuer.EACH_TICK,NULL;}

//+++SCHALTER_HOCH_1+++///////////////////////////////////////////////////////////////////
REGION LL_beam_schalter_u        {FLOOR_HGT 1; CEIL_HGT 4.45; FLOOR_TEX verputz1_ftex; CEIL_TEX marmor4_ftex; AMBIENT -0.4; FLAGS SAVE;}
REGION LL_beam_schalter_o        {FLOOR_HGT 4.7; CEIL_HGT 14; FLOOR_TEX marmor4_ftex; CEIL_TEX tuer1_ftex; BELOW LL_beam_schalter_u; AMBIENT -0.4; FLAGS SAVE;}
REGION LL_beam_ifenter           {FLOOR_HGT 1; CEIL_HGT 14; FLOOR_TEX verputz1_ftex; CEIL_TEX tuer1_ftex; AMBIENT -0.5; IF_ENTER schalter_hoch; FLAGS SAVE;}

SKILL zaehler3 {MIN 0; MAX 1.8;}
ACTION schalter_hoch {
CALL schiebeschalterhoch_act;
PLAY_SOUND schalter_snd,0.6;
SET gitter1a_wall.INVISIBLE,1; SET gitter1a_wall.PASSABLE,1;
SET gitter1b_wall.INVISIBLE,1; SET gitter1b_wall.PASSABLE,1;
SET gitter1c_wall.INVISIBLE,1; SET gitter1c_wall.PASSABLE,1;
SET gitter1d_wall.INVISIBLE,1; SET gitter1d_wall.PASSABLE,1;
SET zaehler3,0;
SET THERE.IF_ENTER, NULL;
SET LL_beam_schalter_u.EACH_TICK, sh;}

ACTION sh {ADD zaehler3,0.1; IF_ABOVE zaehler3,1.7; SET LL_beam_schalter_u.EACH_TICK,NULL; ADD LL_beam_schalter_u.CEIL_HGT,0.1; ADD LL_beam_schalter_o.FLOOR_HGT,0.1; SET RENDER_MODE,1; }

//+++WAENDE+++////////////////////////////////////////////////////////////////////////////
WALL unsichtbar_wall             {TEXTURE marmor1_tex; FLAGS INVISIBLE, PASSABLE;}
WALL unpassierbar_wall           {TEXTURE marmor1_tex; FLAGS INVISIBLE, IMPASSABLE;}
WALL marmor1_wall                {TEXTURE marmor1_tex;}
WALL himmel_wall                 {TEXTURE himmel_tex; EACH_TICK wolkenwind;}
WALL himmel1_wall                {TEXTURE himmel1_tex; EACH_TICK wolkenwind1;}
WALL marmor3_wall                {TEXTURE marmor3_tex;}
WALL verputz1_wall               {TEXTURE verputz1_tex;}
WALL holzbole_wall               {TEXTURE holzbole_tex;}
WALL holzbole_hell_wall          {TEXTURE holzbole_hell_tex;}
WALL metall1_wall                {TEXTURE metall1_tex;}
WALL metall2_wall                {TEXTURE metall2_tex;}
WALL kacheln3_wall               {TEXTURE kacheln3_tex;}
WALL delphin_wall                {TEXTURE delphin_tex;}
WALL tuer1_wall                  {TEXTURE tuer1_tex;}
WALL mauer1_wall                 {TEXTURE mauer1_tex;}
WALL mauer2_wall                 {TEXTURE mauer2_tex;}
WALL marmor4_wall                {TEXTURE marmor4_tex;}
WALL fenster0_wall               {TEXTURE fenster0_tex; IF_HIT fenster_platz; FLAGS FRAGILE;}
WALL fenster1_wall               {TEXTURE fenster1_tex; IF_HIT fenster_platz; FLAGS FRAGILE;}
WALL kacheln4_wall               {TEXTURE kacheln4_tex;}
WALL tierwand_wall               {TEXTURE tierwand_tex;}
WALL kettenwand_wall             {TEXTURE kettenwand_tex;}
WALL schluesselwand_wall         {TEXTURE schluesselwand_tex;}
WALL menschen_wall               {TEXTURE menschen_tex;}
WALL menschenoben_wall           {TEXTURE menschenoben_tex;}
WALL marmor5_wall                {TEXTURE marmor5_tex;}
WALL stoff_wall                  {TEXTURE stoff_tex;}
WALL gitter_wall                 {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gitter1a_wall               {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gitter1b_wall               {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gitter1c_wall               {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gitter1d_wall               {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gitter2_wall                {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gitter2a_wall               {TEXTURE gitter_tex; FLAGS TRANSPARENT;}
WALL gefstein_wall               {TEXTURE gefstein_tex;}
WALL impuls_wall                 {TEXTURE impuls_tex;}

ACTION fenster_platz {PLAY_SOUND knirsch_snd,0.55;}

//+++REGIONEN+++//////////////////////////////////////////////////////////////////////////
REGION LL_Grenze                 {FLOOR_HGT   7; CEIL_HGT   7; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; CLIP_DIST 0;}

REGION LL_hof                    {FLOOR_HGT   0; CEIL_HGT  50; FLOOR_TEX kacheln2_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_mauer              {FLOOR_HGT  20; CEIL_HGT  50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_schatten           {FLOOR_HGT   0; CEIL_HGT  50; FLOOR_TEX kacheln2_ftex; CEIL_TEX himmel_ftex; AMBIENT -0.4;}
REGION LL_hof_fensterschatten    {FLOOR_HGT   0; CEIL_HGT  50; FLOOR_TEX himmel1_ftex; CEIL_TEX himmel_ftex; EACH_TICK wolkenwind2;}
REGION LL_hof_fenster_u          {FLOOR_HGT   4; CEIL_HGT  17; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_hof_fenster_o          {FLOOR_HGT  20; CEIL_HGT  50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_fenster_u;}
REGION LL_hof_turm               {FLOOR_HGT  42; CEIL_HGT  50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND;}
REGION LL_hof_turmumrandung_u    {FLOOR_HGT   0; CEIL_HGT  30; FLOOR_TEX himmel_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_hof_turmumrandung_m    {FLOOR_HGT  32; CEIL_HGT  40; FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_hof_turmumrandung_u;}
REGION LL_hof_turmumrandung_o    {FLOOR_HGT  42; CEIL_HGT  50; FLOOR_TEX holzbole_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_turmumrandung_m;}
REGION LL_hof_turmsaeulen        {FLOOR_HGT  42; CEIL_HGT  50; FLOOR_TEX holzbole_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_aussenpuffer       {FLOOR_HGT   0; CEIL_HGT  50; FLOOR_TEX himmel_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_mauerloechli_u     {FLOOR_HGT  12; CEIL_HGT  14; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_hof_mauerloechli_m     {FLOOR_HGT  16; CEIL_HGT  18; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; BELOW LL_hof_mauerloechli_u;}
REGION LL_hof_mauerloechli_o     {FLOOR_HGT  20; CEIL_HGT  50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_mauerloechli_m;}
REGION LL_hof_mauertraeger       {FLOOR_HGT  22; CEIL_HGT  50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND;}
REGION LL_hof_eingangsdach_u     {FLOOR_HGT   0; CEIL_HGT  14; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor2_ftex;}
REGION LL_hof_eingangsdach_o     {FLOOR_HGT 16; CEIL_HGT 50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_hof_eingangsdach_u;}
REGION LL_hof_einganssaeulen     {FLOOR_HGT 16; CEIL_HGT 50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_eingangstuer_u     {FLOOR_HGT 0.5; CEIL_HGT 13.5; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor1_ftex;}
REGION LL_hof_eingangstuer_o     {FLOOR_HGT 20; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_eingangstuer_u;}
REGION LL_hof_mauerband_u        {FLOOR_HGT 20; CEIL_HGT 22; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_hof_mauerband_o        {FLOOR_HGT 23; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_mauerband_u;}
REGION LL_hof_mauerbandx_u       {FLOOR_HGT 20; CEIL_HGT 22; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; BELOW LL_hof_fenster_u;}
REGION LL_hof_mauerbandx_o       {FLOOR_HGT 23; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_mauerbandx_u;}
REGION LL_hof_aus_saeulenfund_u  {FLOOR_HGT  5; CEIL_HGT 15; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor2_ftex;}
REGION LL_hof_aus_saeulenfund_o  {FLOOR_HGT 17; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_aus_saeulenfund_u;}
REGION LL_hof_aus_saeulen        {FLOOR_HGT 17; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_aus_treppe1        {FLOOR_HGT  1; CEIL_HGT 15; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor2_ftex;}
REGION LL_hof_aus_dach1          {FLOOR_HGT 17; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_hof_aus_treppe1;}
REGION LL_hof_aus_treppe2        {FLOOR_HGT  2; CEIL_HGT 15; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor2_ftex;}
REGION LL_hof_aus_dach2          {FLOOR_HGT 17; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_hof_aus_treppe2;}
REGION LL_hof_aus_treppe3        {FLOOR_HGT  3; CEIL_HGT 15; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor2_ftex;}
REGION LL_hof_aus_dach3          {FLOOR_HGT 17; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_hof_aus_treppe3;}
REGION LL_hof_aus_treppe4        {FLOOR_HGT  4; CEIL_HGT 15; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor2_ftex;}
REGION LL_hof_aus_dach4          {FLOOR_HGT 17; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_hof_aus_treppe4;}
REGION LL_hof_aq_umrandung       {FLOOR_HGT 0.5; CEIL_HGT 50; FLOOR_TEX kacheln3_ftex; CEIL_TEX himmel_ftex;}
REGION LL_hof_aq_aq_u            {FLOOR_HGT -25; CEIL_HGT -0.5; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX wasser2_ftex; IF_ARISE regio_arise; EACH_TICK wasserwind2;}
REGION LL_hof_aq_aq_o            {FLOOR_HGT -0.5; CEIL_HGT 50; FLOOR_TEX wasser1_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_aq_aq_u; IF_DIVE regio_dive; EACH_TICK wasserwind1;}
REGION LL_hof_aq_x_m             {FLOOR_HGT -0.5; CEIL_HGT 0.5; FLOOR_TEX wasser1_ftex; CEIL_TEX metall1_ftex; BELOW LL_hof_aq_aq_u; IF_DIVE regio_dive; EACH_TICK wasserwind1;}
REGION LL_hof_aq_x_o             {FLOOR_HGT 0.7; CEIL_HGT 50; FLOOR_TEX metall1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_hof_aq_x_m;}
REGION LL_hof_aq_gang1_u         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex;}
REGION LL_hof_aq_gang1_o         {FLOOR_HGT 0.5; CEIL_HGT 50; FLOOR_TEX kacheln3_ftex; CEIL_TEX himmel_ftex; BELOW LL_hof_aq_gang1_u;}
REGION LL_hof_aq_gang2_u         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex;}
REGION LL_hof_aq_gang2_o         {FLOOR_HGT 0; CEIL_HGT 50; FLOOR_TEX kacheln2_ftex; CEIL_TEX himmel_ftex;   BELOW LL_hof_aq_gang2_u;}
REGION LL_hof_aq_gang3_u         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex;}
REGION LL_hof_aq_gang3_o         {FLOOR_HGT 20; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex;  BELOW LL_hof_aq_gang3_u;}
REGION LL_hof_aq_gang4_u         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex;}
REGION LL_hof_aq_gang4_o         {FLOOR_HGT 0; CEIL_HGT 50; FLOOR_TEX himmel_ftex; CEIL_TEX himmel_ftex;     BELOW LL_hof_aq_gang4_u;}
REGION LL_hof_aq_gang5           {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex;}
REGION LL_hof_aq_gang6_A         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex; AMBIENT -0.1;}
REGION LL_hof_aq_gang6_B         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex; AMBIENT -0.3;}
REGION LL_hof_aq_gang6_C         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex; AMBIENT -0.5;}
REGION LL_hof_aq_gang6_D         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex; AMBIENT -0.7;}
REGION LL_hof_aq_gang6_E         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex; AMBIENT -0.9;}
REGION LL_hof_aq_gang6_F         {FLOOR_HGT -22; CEIL_HGT -17; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX marmor1was_ftex; AMBIENT -1;}

REGION LL_pal_schicht1           {FLOOR_HGT  30; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_pal_schicht1_mulde_u   {FLOOR_HGT   5; CEIL_HGT  28; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_pal_schicht1_mulde_o   {FLOOR_HGT  30; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_schicht1_mulde_u;}
REGION LL_pal_schicht1_durch_u   {FLOOR_HGT   4; CEIL_HGT  14; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex;}
REGION LL_pal_schicht1_durch_o   {FLOOR_HGT  30; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_schicht1_durch_u;}
REGION LL_pal_schicht1_saeulen   {FLOOR_HGT  30; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_pal_schicht2           {FLOOR_HGT  45; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_pal_schicht2_mulde_u   {FLOOR_HGT  30; CEIL_HGT  43; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; AMBIENT -0.2;}
REGION LL_pal_schicht2_mulde_o   {FLOOR_HGT  45; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_schicht2_mulde_u;}
REGION LL_pal_schicht2_durch_u   {FLOOR_HGT   4; CEIL_HGT  14; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex;}
REGION LL_pal_schicht2_durch_o   {FLOOR_HGT  45; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_schicht2_durch_u;}
REGION LL_pal_schicht2_durch1_u  {FLOOR_HGT   4; CEIL_HGT  14; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex;}
REGION LL_pal_schicht2_durch1_m  {FLOOR_HGT  30; CEIL_HGT  43; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; BELOW LL_pal_schicht2_durch1_u; AMBIENT -0.2;}
REGION LL_pal_schicht2_durch1_o  {FLOOR_HGT  45; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex;  BELOW LL_pal_schicht2_durch1_m;}
REGION LL_pal_schicht3           {FLOOR_HGT  45; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND;}
REGION LL_pal_schicht3_durch_u   {FLOOR_HGT   4; CEIL_HGT  14; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex;}
REGION LL_pal_schicht3_durch_o   {FLOOR_HGT  45; CEIL_HGT  50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; FLAGS FLOOR_ASCEND; BELOW LL_pal_schicht3_durch_u;}
REGION LL_pal_puffer             {FLOOR_HGT   4; CEIL_HGT  14; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; IF_ENTER schwing_auf; FLAGS SAVE;}

REGION LL_pal_pal                {FLOOR_HGT  -5; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe0            {FLOOR_HGT   3; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe1            {FLOOR_HGT   2; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe2            {FLOOR_HGT   1; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe3            {FLOOR_HGT   0; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe4            {FLOOR_HGT  -1; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe5            {FLOOR_HGT  -2; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe6            {FLOOR_HGT  -3; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppe7            {FLOOR_HGT  -4; CEIL_HGT  25; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_treppengelaender   {FLOOR_HGT   6; CEIL_HGT  25; FLOOR_TEX marmor1_ftex; CEIL_TEX mauer2_ftex; FLAGS FLOOR_DESCEND;}
REGION LL_pal_bigstuetze         {FLOOR_HGT  -5; CEIL_HGT  20; FLOOR_TEX kacheln1_ftex; CEIL_TEX metall1_ftex; FLAGS CEIL_ASCEND;}
REGION LL_pal_bigbogen           {FLOOR_HGT   7; CEIL_HGT   7; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; CLIP_DIST 0;}
REGION LL_pal_dstufe1            {FLOOR_HGT  -4; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_dstufe2            {FLOOR_HGT  -3; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_dstufe3            {FLOOR_HGT  -2; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_dstufe4            {FLOOR_HGT  -1; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_pal2               {FLOOR_HGT   0; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_teppich            {FLOOR_HGT 0.2; CEIL_HGT  40; FLOOR_TEX kacheln4_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_trohn_treppe1      {FLOOR_HGT   1; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_trohn_treppe2      {FLOOR_HGT   2; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_trohn_treppe3      {FLOOR_HGT   3; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_trohn_treppe4      {FLOOR_HGT   4; CEIL_HGT  40; FLOOR_TEX kacheln1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_fensterbuchten_nie {FLOOR_HGT   6; CEIL_HGT  21; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; AMBIENT 0.2;}
REGION LL_pal_fensterbuchten_hoh {FLOOR_HGT  10; CEIL_HGT  35; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; AMBIENT 0.2;}
REGION LL_pal_rundesfenster      {FLOOR_HGT  27; CEIL_HGT  27.1; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; AMBIENT 0.2; FLAGS FLOOR_DESCEND, CEIL_ASCEND;}
REGION LL_pal_fenster0_schatten  {FLOOR_HGT   0; CEIL_HGT  40; FLOOR_TEX fenster0schatten_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_fenster1_schatten  {FLOOR_HGT  -5; CEIL_HGT  25; FLOOR_TEX fenster1schatten_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_tr_armlehenen      {FLOOR_HGT 8.5; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; AMBIENT 0.3;}
REGION LL_pal_tr_sitzflaeche     {FLOOR_HGT 7; CEIL_HGT 40; FLOOR_TEX blutplatte_ftex; CEIL_TEX mauer2_ftex; AMBIENT 0.3;}
REGION LL_pal_tr_rueckenlehen    {FLOOR_HGT 12; CEIL_HGT 40; FLOOR_TEX metall1_ftex;  CEIL_TEX mauer2_ftex; AMBIENT 0.3;}
REGION LL_pal_tr_schulterlehne   {FLOOR_HGT 12.5; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; AMBIENT 0.3;}
REGION LL_pal_vasensokkel        {FLOOR_HGT 4; CEIL_HGT 40; FLOOR_TEX metall2_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_wendel_weg_u       {FLOOR_HGT 0; CEIL_HGT 15; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_weg_o       {FLOOR_HGT 16; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_weg_u;}
REGION LL_pal_wendel             {FLOOR_HGT 20; CEIL_HGT 40; FLOOR_TEX metall1_ftex; CEIL_TEX mauer2_ftex;}
REGION LL_pal_wendel_1u          {FLOOR_HGT 1; CEIL_HGT 8;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_1o          {FLOOR_HGT 9; CEIL_HGT 15; FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_1u;}
REGION LL_pal_wendel_1oo         {FLOOR_HGT 16; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_1o;}
REGION LL_pal_wendel_2uu         {FLOOR_HGT 0; CEIL_HGT 1; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_2u          {FLOOR_HGT 2; CEIL_HGT 9;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_2uu;}
REGION LL_pal_wendel_2o          {FLOOR_HGT 10; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_2u;}
REGION LL_pal_wendel_x_2uu       {FLOOR_HGT 0; CEIL_HGT 1; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_x_2u        {FLOOR_HGT 2; CEIL_HGT 9;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_2uu;}
REGION LL_pal_wendel_x_2o        {FLOOR_HGT 10; CEIL_HGT 15; FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_2u;}
REGION LL_pal_wendel_x_2oo       {FLOOR_HGT 16; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_x_2o;}
REGION LL_pal_wendel_3uu         {FLOOR_HGT 0; CEIL_HGT 2; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_3u          {FLOOR_HGT 3; CEIL_HGT 10;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_3uu;}
REGION LL_pal_wendel_3o          {FLOOR_HGT 11; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_3u;}
REGION LL_pal_wendel_4uu         {FLOOR_HGT 0; CEIL_HGT 3; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_4u          {FLOOR_HGT 4; CEIL_HGT 11;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_4uu;}
REGION LL_pal_wendel_4o          {FLOOR_HGT 12; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_4u;}
REGION LL_pal_wendel_5uu         {FLOOR_HGT 0; CEIL_HGT 4; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_5u          {FLOOR_HGT 5; CEIL_HGT 12;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_5uu;}
REGION LL_pal_wendel_5o          {FLOOR_HGT 13; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_5u;}
REGION LL_pal_wendel_6uu         {FLOOR_HGT 0; CEIL_HGT 5; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_6u          {FLOOR_HGT 6; CEIL_HGT 13;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_6uu;}
REGION LL_pal_wendel_6o          {FLOOR_HGT 14; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_6u;}
REGION LL_pal_wendel_7uu         {FLOOR_HGT 0; CEIL_HGT 6; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_7u          {FLOOR_HGT 7; CEIL_HGT 14;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_7uu;}
REGION LL_pal_wendel_7o          {FLOOR_HGT 15; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_7u;}
REGION LL_pal_wendel_8uu         {FLOOR_HGT 0; CEIL_HGT 7; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_pal_wendel_8u          {FLOOR_HGT 8; CEIL_HGT 15;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_pal_wendel_8uu;}
REGION LL_pal_wendel_8o          {FLOOR_HGT 16; CEIL_HGT 40; FLOOR_TEX holzbole_ftex; CEIL_TEX mauer2_ftex; BELOW LL_pal_wendel_8u;}
REGION LL_pal_fensterschaechte_u {FLOOR_HGT 7; CEIL_HGT 25; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_pal_fensterschaechte_o {FLOOR_HGT 45; CEIL_HGT 50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_fensterschaechte_u;}
REGION LL_pal_wendel_ausgang1    {FLOOR_HGT 16; CEIL_HGT 26; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_pal_wendel_ausgang2u   {FLOOR_HGT 16; CEIL_HGT 26; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_pal_wendel_ausgang2o   {FLOOR_HGT 45; CEIL_HGT 50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_wendel_ausgang2u;}
REGION LL_pal_bruecke_1u         {FLOOR_HGT 5; CEIL_HGT 14; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; AMBIENT -0.4;}
REGION LL_pal_bruecke_1m         {FLOOR_HGT 16; CEIL_HGT 28; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex; BELOW LL_pal_bruecke_1u;}
REGION LL_pal_bruecke_1o         {FLOOR_HGT 30; CEIL_HGT 50; FLOOR_TEX marmor1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_bruecke_1m;}
REGION LL_pal_bruecke_2u         {FLOOR_HGT 0; CEIL_HGT 14; FLOOR_TEX kacheln2_ftex; CEIL_TEX verputz1_ftex; AMBIENT -0.4;}
REGION LL_pal_bruecke_2o         {FLOOR_HGT 16; CEIL_HGT 50; FLOOR_TEX kacheln1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_bruecke_2u;}
REGION LL_pal_bruecke_durch1_u   {FLOOR_HGT 16; CEIL_HGT 22; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_pal_bruecke_durch1_o   {FLOOR_HGT 23; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_pal_bruecke_durch1_u;}

REGION LL_bt_eingang_u           {FLOOR_HGT 16; CEIL_HGT 35; FLOOR_TEX kacheln1_ftex; CEIL_TEX holzbole_ftex;}
REGION LL_bt_eingang_o           {FLOOR_HGT 36; CEIL_HGT 50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex; BELOW LL_bt_eingang_u;}
REGION LL_bt_saeulen             {FLOOR_HGT 36; CEIL_HGT 50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_bt_eingang0            {FLOOR_HGT 16; CEIL_HGT 50; FLOOR_TEX kacheln1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_bt                     {FLOOR_HGT 36; CEIL_HGT 50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex;}
REGION LL_bt_gang_u              {FLOOR_HGT 16; CEIL_HGT 26; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_bt_gang_o              {FLOOR_HGT 36; CEIL_HGT 50; FLOOR_TEX ziegel1_ftex; CEIL_TEX himmel_ftex; BELOW LL_bt_gang_u;}
REGION LL_bt_tuergang            {FLOOR_HGT 17; CEIL_HGT 27; FLOOR_TEX kacheln1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_bt_schloss_u           {FLOOR_HGT 17; CEIL_HGT 20.26; FLOOR_TEX kacheln1_ftex; CEIL_TEX kacheln4_ftex;}
REGION LL_bt_schloss_o           {FLOOR_HGT 21.72; CEIL_HGT 27; FLOOR_TEX kacheln4_ftex; CEIL_TEX verputz1_ftex; BELOW LL_bt_schloss_u;}
REGION LL_bt_schlafzimmer        {FLOOR_HGT 16; CEIL_HGT 32; FLOOR_TEX kacheln5_ftex; CEIL_TEX kacheln2_ftex;}
REGION LL_bt_schlafzimmerfenster {FLOOR_HGT 22.3; CEIL_HGT 30; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex;}
REGION LL_bt_aussenring          {FLOOR_HGT 21.3; CEIL_HGT 31; FLOOR_TEX marmor4_ftex; CEIL_TEX marmor4_ftex;}
REGION LL_bt_aussenring1         {FLOOR_HGT 16; CEIL_HGT 31; FLOOR_TEX kacheln5_ftex; CEIL_TEX marmor4_ftex;}
REGION LL_bt_bett_stuetzen       {FLOOR_HGT 24.5; CEIL_HGT 32; FLOOR_TEX marmor5_ftex; CEIL_TEX kacheln2_ftex;}
REGION LL_bt_bett_bett           {FLOOR_HGT 18; CEIL_HGT 32; FLOOR_TEX marmor5_ftex; CEIL_TEX kacheln2_ftex;}
REGION LL_bt_bett_decke          {FLOOR_HGT 20; CEIL_HGT 32; FLOOR_TEX stoff_ftex; CEIL_TEX kacheln2_ftex; FLAGS FLOOR_ASCEND; IF_ENTER fric_hoch1extra; IF_LEAVE fric_runter1;}
REGION LL_bt_bett_kissen         {FLOOR_HGT 19.5; CEIL_HGT 32; FLOOR_TEX stoff_ftex; CEIL_TEX kacheln2_ftex; FLAGS FLOOR_ASCEND; IF_ENTER fric_hoch1; IF_LEAVE fric_runter1;}
REGION LL_bt_baenke_armlehne     {FLOOR_HGT 19.5; CEIL_HGT 31; FLOOR_TEX marmor5_ftex; CEIL_TEX marmor4_ftex;}
REGION LL_bt_baenke_sitzen_u     {FLOOR_HGT 16; CEIL_HGT 18; FLOOR_TEX kacheln5_ftex; CEIL_TEX marmor5_ftex;}
REGION LL_bt_baenke_sitzen_o     {FLOOR_HGT 18.5; CEIL_HGT 31; FLOOR_TEX marmor5_ftex; CEIL_TEX marmor4_ftex; BELOW LL_bt_baenke_sitzen_u;}

REGION LL_gef_brunnenwasser_u    {FLOOR_HGT -22; CEIL_HGT 3; FLOOR_TEX marmor1ruhig_ftex; CEIL_TEX wasser2_ftex; IF_ARISE regio_arise;}
REGION LL_gef_brunnenwasser_o    {FLOOR_HGT 3; CEIL_HGT 9.7;  FLOOR_TEX wasser1_ftex; CEIL_TEX metall1_ftex; BELOW LL_gef_brunnenwasser_u;  IF_DIVE regio_dive;}
REGION LL_gef_brunnenrand        {FLOOR_HGT 3.7; CEIL_HGT 9.7; FLOOR_TEX metall2_ftex; CEIL_TEX metall1_ftex;}
REGION LL_gef_gef                {FLOOR_HGT 0; CEIL_HGT 9;  FLOOR_TEX metall1_ftex; CEIL_TEX metall1_ftex; AMBIENT -0.3;}
REGION LL_gef_rinne              {FLOOR_HGT -0.7; CEIL_HGT 9.7; FLOOR_TEX tuer1_ftex; CEIL_TEX metall1_ftex; AMBIENT -0.5;}
REGION LL_gef_zellenuebergang    {FLOOR_HGT 0.5; CEIL_HGT 7.5; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; AMBIENT -0.3;}
REGION LL_gef_zellen             {FLOOR_HGT 0; CEIL_HGT 8;  FLOOR_TEX mg_ftex; CEIL_TEX holzbole_ftex;  AMBIENT -0.3;  IF_ENTER fric_hoch2extra; IF_LEAVE fric_runter2;}
REGION LL_gef_helle_zelle        {FLOOR_HGT 0.2; CEIL_HGT 8; FLOOR_TEX mg_ftex; CEIL_TEX holzbole_ftex; AMBIENT 1;     IF_ENTER fric_hoch2; IF_LEAVE fric_runter2;}
REGION LL_gef_britsche_u         {FLOOR_HGT 0; CEIL_HGT 1.5; FLOOR_TEX mg_ftex; CEIL_TEX holzbole_ftex; AMBIENT -0.45; IF_ENTER fric_hoch2; IF_LEAVE fric_runter2;}
REGION LL_gef_britsche_o         {FLOOR_HGT 1.9; CEIL_HGT 8;  FLOOR_TEX holzbole_ftex; CEIL_TEX holzbole_ftex; BELOW LL_gef_britsche_u; AMBIENT -0.3;}

REGION LL_beam_tor_puffer        {FLOOR_HGT 0; CEIL_HGT 10; FLOOR_TEX kacheln2_ftex; CEIL_TEX tuer1_ftex; AMBIENT -0.4;}
REGION LL_beam_tor_u             {FLOOR_HGT 0; CEIL_HGT 10; FLOOR_TEX kacheln2_ftex; CEIL_TEX marmor1_ftex; AMBIENT -0.4;}
REGION LL_beam_tor_m             {FLOOR_HGT 20; CEIL_HGT 22; FLOOR_TEX verputz1_ftex; CEIL_TEX verputz1_ftex; BELOW LL_beam_tor_u;}
REGION LL_beam_tor_o             {FLOOR_HGT 23; CEIL_HGT 50; FLOOR_TEX verputz1_ftex; CEIL_TEX himmel_ftex; BELOW LL_beam_tor_m;}
REGION LL_beam_gang              {FLOOR_HGT 0; CEIL_HGT 10; FLOOR_TEX kacheln2_ftex; CEIL_TEX tuer1_ftex; AMBIENT -0.4;}
REGION LL_beam_beam              {FLOOR_HGT 1; CEIL_HGT 14; FLOOR_TEX verputz1_ftex; CEIL_TEX tuer1_ftex; IF_ENTER licht_dunkel; AMBIENT -0.5; FLAGS SAVE;}
REGION LL_beam_dreieckssaeulen   {FLOOR_HGT 3; CEIL_HGT 12; FLOOR_TEX marmor1_ftex; CEIL_TEX marmor1_ftex; AMBIENT -0.1;}
REGION LL_beam_portalumrandung   {FLOOR_HGT 1.5; CEIL_HGT 14; FLOOR_TEX marmor2_ftex; CEIL_TEX tuer1_ftex;}
REGION LL_beam_portal            {FLOOR_HGT -60; CEIL_HGT 14; FLOOR_TEX impuls_ftex; CEIL_TEX tuer1_ftex; IF_ENTER LL_yeez; FLAGS SAVE;}
REGION LL_beam_schalterplatte_u  {FLOOR_HGT 1; CEIL_HGT 4; FLOOR_TEX verputz1_ftex; CEIL_TEX marmor1_ftex; AMBIENT -0.5;}
REGION LL_beam_schalterplatte_o  {FLOOR_HGT 7; CEIL_HGT 14; FLOOR_TEX marmor1_ftex; CEIL_TEX tuer1_ftex; BELOW LL_beam_schalterplatte_u; AMBIENT -0.5;}
REGION LL_beam_schalter_rille_u  {FLOOR_HGT 1; CEIL_HGT 4; FLOOR_TEX verputz1_ftex; CEIL_TEX marmor1_ftex; AMBIENT -0.5;}
REGION LL_beam_schalter_rille_m  {FLOOR_HGT 4.3; CEIL_HGT 6.7; FLOOR_TEX marmor4_ftex; CEIL_TEX marmor4_ftex; BELOW LL_beam_schalter_rille_u;}
REGION LL_beam_schalter_rille_o  {FLOOR_HGT 7; CEIL_HGT 14; FLOOR_TEX marmor1_ftex; CEIL_TEX tuer1_ftex; BELOW LL_beam_schalter_rille_m; AMBIENT -0.5;}

//+++AKTIONEN+++//////////////////////////////////////////////////////////////////////////
ACTION wolkenwind      {ADD SKY_OFFS_X, 0.1;}
ACTION wolkenwind1     {ADD himmel1_wall.OFFSET_X, 2;}
ACTION wolkenwind2     {ADD THERE.FLOOR_OFFS_Y,0.9;}
ACTION wasserwind1     {ADD THERE.FLOOR_OFFS_Y,0.8;}
ACTION wasserwind2     {ADD THERE.CEIL_OFFS_Y,0.8;}

ACTION fric_hoch1      {SET fric,0.5;}
ACTION fric_runter1    {SET fric,0.2;}
ACTION fric_hoch2      {SET fric,0.3;}
ACTION fric_runter2    {SET fric,0.2;}

ACTION fric_hoch1extra {SET fric,0.5; IF_EQUAL,schonmal2_skill,0; CALL bett_act; SET schonmal2_skill,1;}
ACTION fric_hoch2extra {SET fric,0.3; IF_EQUAL,schonmal3_skill,0; CALL knochen_act; SET schonmal3_skill,1;}

ACTION licht_dunkel    {SET LL_beam_portalumrandung.IF_ENTER,NULL; SET LL_beam_portalumrandung.EACH_TICK, leuchte_runter;}
ACTION licht_hell      {SET LL_beam_portalumrandung.EACH_TICK, leuchte_hoch;}
ACTION leuchte_runter  {ADD LL_beam_portalumrandung.AMBIENT -0.175; IF_BELOW LL_beam_portalumrandung.AMBIENT -1; BRANCH licht_hell;}
ACTION leuchte_hoch    {ADD LL_beam_portalumrandung.AMBIENT  0.175; IF_ABOVE LL_beam_portalumrandung.AMBIENT  1; BRANCH licht_dunkel;}

SKILL bloed {}

ACTION LL_yeez         {SET IF_ESC,NULL; SET LL_beam_portal.EACH_TICK,dreh_act; WAITT 40; SET LL_beam_portal.EACH_TICK,nachschwarz; WAITT 15; PLAY_SOUND theend_snd,0.7;}
ACTION dreh_act        {ADD PLAYER_VROT,0.1;}
ACTION nachschwarz     {ADD bloed,0.04;  FADE_PAL pal_blo,bloed; ADD PLAYER_VROT,0.1; IF_BELOW bloed,0.9; END; CALL triumph_act; SET LL_beam_portal.EACH_TICK,nachweiss;}
ACTION nachweiss       {ADD bloed,-0.005; FADE_PAL pal_blo,bloed; ADD PLAYER_VROT,0.1; IF_ABOVE bloed,0.05; END; CALL ende; SET LL_beam_portal.EACH_TICK,NULL;}
ACTION ende            {FADE_PAL pal_blo,0; SET MOVE_MODE,0; SET RENDER_MODE,0; SET IF_ANYKEY,LL_ade;}

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////// +++ LL_DEMO -E-N-D-E- +++ ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

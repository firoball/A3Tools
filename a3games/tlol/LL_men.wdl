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


//+++MENUE!+++////////////////////////////////////////////////////////////////////////////

//+++SOUNDS+++////////////////////////////////////////////////////////////////////////////
SOUND  klick_snd,                <klick.wav>;
SOUND  tataa_snd,                <t.wav>;
SOUND  blam_snd,                 <b.wav>;
SOUND  bumm_snd,                 <bu.wav>;
SOUND  bumm2_snd,                <bu2.wav>;
SOUND  hmpf_snd,                 <hmpf.wav>;
SOUND  mana_snd,                 <man2.wav>;
SOUND  leben_snd,                <leb2.wav>;
SOUND  tuer3_snd,                <tuer3.wav>;
SOUND  gluck_snd,                <fastaus.wav>;
SOUND  sterben_snd,              <aus.wav>;
SOUND  aua1_snd,                 <au1.wav>;
SOUND  aua2_snd,                 <au2.wav>;
SOUND  aua3_snd,                 <au3.wav>;
SOUND  instruction_snd,          <anf.wav>;

//+++SKILLS+++////////////////////////////////////////////////////////////////////////////
SKILL rot_platz1_skill       {}
SKILL rot_platz2_skill       {}
SKILL rot_platz3_skill       {}
SKILL rot_platz4_skill       {}

SKILL blau_platz1_skill      {}
SKILL blau_platz2_skill      {}
SKILL blau_platz3_skill      {}
SKILL blau_platz4_skill      {}

SKILL rot1_1o2_skill         {}
SKILL rot2_1o2_skill         {}
SKILL rot3_1o2_skill         {}
SKILL rot4_1o2_skill         {}

SKILL blau1_1o2_skill        {}
SKILL blau2_1o2_skill        {}
SKILL blau3_1o2_skill        {}
SKILL blau4_1o2_skill        {}

SKILL mana_leer_skill        {MIN 0; MAX 1;}
SKILL motionblur_skill       {MIN 0; MAX 1;}
SKILL msg_skill              {} //messagedelay zaehler
SKILL rand163                {}
SKILL rand188                {}
SKILL rand333                {}
SKILL instruction_skill      {} //instcruction noetig?!
SKILL schongespeichert_skill {}
SKILL neustartsave_skill     {} //muss gesaved werden?!

//+++Fonts+++/////////////////////////////////////////////////////////////////////////////
FONT standart_font,     <sch_1.pcx>,8,16;

//+++BMAPS+++/////////////////////////////////////////////////////////////////////////////
BMAP knopf1_map,        <last.pcx>,0,0,140,20;
BMAP knopf1a_map,       <last.pcx>,140,0,140,20;
BMAP knopf2_map,        <last.pcx>,0,20,140,20;
BMAP knopf2a_map,       <last.pcx>,140,20,140,20;
BMAP knopf3_map,        <last.pcx>,0,40,140,20;
BMAP knopf3a_map,       <last.pcx>,140,40,140,20;
BMAP knopf4_map,        <last.pcx>,0,60,140,20;
BMAP knopf4a_map,       <last.pcx>,140,60,140,20;
BMAP haupt_map,         <haupt.pcx>,0,0,640,480;

//+++Strings+++///////////////////////////////////////////////////////////////////////////
// (das '+' entspricht dem Blitz des Standartschriftsatzes!)

STRING strafe_string,
"      Hey, are you CANNED?! ...not good!
             See you in   H E L L !!
         (Press 'Enter' to visit Diablo!)

       Hey, bist Du besoffen?! ...nicht gut!
        Wir sehen uns in der  H O E L L E !!
      (Druecke 'Enter', um Diablo zu besuchen!)";

STRING strafe2_string,
"           Next time you kill that monster!
  Or should I say you that you've to fire with 'CTRL'?!
(Press 'Enter' to see what's waiting for you after life!)

 Naechstes Mal wirst Du das Monster um die Ecke bringen!
Oder muss ich Dir zuerst sagen, dass man mit 'CTRL' feuert...
 (Druecke 'Enter', um zu sehen, was nach dem Leben kommt!)";

STRING strafe3_string,
"    Hey, you trembling coward! You can take your hands
  away from your face! The dreadful monsters disappeared!
       (Press 'Enter' to meet their best friends!)

     He, Du bibbernde Memme! Du kannst die Haende vom
    Gesicht nehmen! Die furchtbaren Monster sind weg!
(Druecke 'Enter', um ihre besten Freunde kennenzulernen!)";

STRING strafe4_string,
"             HAHAHAHA! You are a BIG loser!
      You are too stupid to kill these little mummies!
 (Press 'Enter' to try to win against the man with the scythe!)

       HAHAHAHA! Du bist ein RIESENGROSSER Verlierer!
 Du bist selbst zu bloed, um diese kleinen Mumien wegzupusten!
       (Druecke 'Enter', um zu probieren, ob Du's bei
            dem Mann mit der Sense schaffst!)";

STRING wstrafe_string,
"        No good place to have a sleep!
   ...and it's very cold down there, isn't it?
(Press 'Enter' to warm you of the fire of HELL!)

      Kein guter Platz fuer ein Schlaefchen!
      ...und es ist sehr kalt da unten, oder?
(Druecke 'Enter', um Dich am Feuer der HOELLE zu waermen!)";


STRING vorade1_string,
"   Are you shure that you wanna send 1.0000 US DOLLARS
                 to the programmer??

  Bist Du sicher, dass Du 10000 DM an den Programmierer
                ueberweisen moechtest??

               YES = Y         NO = N";

STRING vorade2_string,
"    Oh, already 7 p.m. !! Time for bed, little man!?

  Oh, schon 19.00 Uhr !! Zeit fuer's Bett, kleiner Mann?!

                YES = Y        NO = N";

STRING vorade3_string,
"             Trying to commit suicide?

          Versuchst Du, Selbstmord zu machen?

                YES = Y       NO = N";

STRING vorade4_string,
"        Y O U   W O N ' T   D O   T H I S !

     D U   W I R S T   D A S   N I C H T   T U N !

          OH YES I WILL = Y      NO = N";

STRING vorade5_string,
"        NOW FORMAT C: ( ARE YOU SHURE?? )

     JETZT C: FORMATIEREN ( SIND SIE SICHER?? )

              YES = Y       NO = N";


STRING credits_string,
"                         + CREDITS +

 Ok, you wanna know something about me? ME?! Yes, I programmed
 THE LORD OF LIGHTNING all on my own! That's good for you,
 because you've only to read one address! But read it carefully!
 And then write me a letter, or an email!! I'm very interested
 in your opinion about THE LORD OF LIGHTNING! Tell me what I
 should improve...or send me a little bit of money! :-)

                       ALEXANDER SEIFRIZ
                      FECKENHAUSER STR.27
                        78628 ROTTWEIL
                            GERMANY
                 EMAIL: gambitsoft@t-online.de
        INTERNET: http//gambitsoft.com/lord/sprache.htm
 Ok, Du willst also etwas ueber mich wissen? MICH?! Ja, Ich pro-
 grammierte THE LORD OF LIGHTNING ganz alleine! Das ist gut fuer
 Dich, weil Du nur eine Adresse lesen musst! Aber lese sie sorg-
 faeltig! Schreibe mir dann einen Brief oder 'ne Email!! Mich
 interessiert sehr Deine Meinung ueber THE LORD OF LIGHTNING!
 Sag' mir, was ich besser machen muss,...oder schick' mir ein
 bisschen Geld! :-)

      MOUSECLICK SOMEWHERE!       MAUSKLICK' IRGENDWO! ";

STRING help_string,
"                           + HELP +

                       KEYBOARD COMMANDS

 UP ARROW, center mouse button - walk forward
   DOWN ARROW, pull mouse back - walk back
RIGHT ARROW, slide mouse right - turn right
  LEFT ARROW, slide mouse left - turn left
                         POINT - step right
                         COMMA - step left
                    HOME, POS1 - jump, dive up, get on the shore
                     END, ENDE - duck, dive down
                       PAGE UP - look up
                     PAGE DOWN - look down
        CTRL, left mousebutton - shoot (not near water)
                            F2 - save game
                            F3 - load last saved game
                            F5 - Motion blur on/off
                            F6 - make a screenshot 'pic0.pcx'

If you need technical help or if you wanna use a joystick please
          check out the following file: 'THELP.TXT'

      MOUSECLICK SOMEWHERE!       MAUSKLICK' IRGENDWO!";


STRING help2_string,
"                           + HELP +

                           INVENTORY

 THE LORD OF LIGHTNING has a new inventory system.
 To take something into the inventory just walk over it!
 Now it will automatically go on the left side (life) or on the
 right side (mana). If no free space is available the thing will
 stay where it is.
 To use something in the inventory press a key between 1 and 8.
 1-4 are for the things on the left side and 5-8 are for the
 things on the right side.

                          LIFE and MANA
 You need both of them to stay alive. Your life is represented
 by an orange liquid on the left. If you are injured it will
 decrease! If there's no life anymore... you will die!
 Mana is represented by the blue liquid on the right side.
 Mana decreases if you use your magic power (for example if
 you shoot)! You need the Mana to defend yourself!



      MOUSECLICK SOMEWHERE!       MAUSKLICK' IRGENDWO!";


STRING help3_string,
"                           + HELP +

                         TASTATURBEFEHLE

PFEILTASTE hoch, mittlere Maustaste - vorwaerts laufen
   PFEILTASTE 'runter, Maus zurueck - rueckwaerts laufen
     PFEILTASTE rechts, Maus rechts - rechts drehen
       PFEILTASTE links, Maus links - links drehen
                              PUNKT - Schritt nach rechts
                              KOMMA - Schritt nach links
   HOME, POS1 - springen, auftauchen, aus dem Wasser Klettern
    END, ENDE - ducken, hinabtauchen
      PAGE UP - hinaufschauen
    PAGE DOWN - hinabschauen
CTRL, linke Maustaste - feuern (nicht in der Naehe von Wasser)
                   F2 - Spiel speichern
                   F3 - letztes gesichertes Spiel laden
                   F5 - Bewegungsunschaerfe ein/aus
                   F6 - erzeugt einen Screenshot 'pic0.pcx'

Wenn Du technische Hilfe brauchst oder wenn Du einen Joystick
benutzen moechtest, lies bitte die folgende Datei: 'THILFE.TXT'

      MOUSECLICK SOMEWHERE!       MAUSKLICK' IRGENDWO!";


STRING help4_string,
"                           + HELP +

                           INVENTORY

 THE LORD OF LIGHTNING hat ein neuartiges Inventory-System.
 Sobald Du Dich ueber einen Gegenstand bewegst, wird er ins
 Inventory aufgenommen. Leben kommt nach links, Mana nach
 rechts. Wenn kein freier Platz vorhanden ist, bleibt der
 Gegenstand da, wo er ist! Um etwas Aufgenommenes zu
 verwenden, musst Du die entsprechende Taste (1-8)
 druecken! Fuer Leben 1-4, fuer Mana 5-8.

                          LEBEN und MANA
 Dies sind die grundlegenden Stoffe, beides benoetigst Du,
 um am Leben zu bleiben! Dein gesundheitlicher Zustand wird
 durch eine orangene Fluessigkeit links dargestellt. Sie
 nimmt ab, wenn Du Dich verletzt, ist keine mehr da...stirbst
 Du! Dein Mana ist durch eine blaue Fluessigkeit rechts re-
 praesentiert. Es nimmt immer dann ab, wenn Du Deine
 magischen Faehigkeiten einsetzt (z.B. beim Schiessen)!
 Ist das Mana aufgebraucht, kannst Du Dich nicht mehr
 verteidigen!

      MOUSECLICK SOMEWHERE!       MAUSKLICK' IRGENDWO!";

STRING warten_string,     "Please wait!\nBitte warten!";
STRING speichern_string,  "Game saved!\nSpiel gespeichert!";
STRING laden_string,      "Loading...!\nSpiel wird geladen...!";
STRING motionblur_string, "Motionblur on!\nBewegungsunschaerfe an!";
STRING motionblura_string,"Motionblur off!\nBewegungsunschaerfe aus!";
STRING screenshot_string, "Screenshot saved at 'pic0.pcx'!\nScreenshot in Datei 'pic0.pcx' gespeichert!";
STRING geladen_string,    "Game loaded!\nSpiel geladen!";

STRING nass1_string, "Ahhh, my nice trousers' creases!\nArrg, meine schoenen Buegelfalten!";
STRING nass2_string, "Don't you know the story about Nessi?!!\nKennst Du nicht die Geschichte von Nessi?!!";
STRING nass3_string, "NO, there aren't any piranhas...are there?!?\nNEIN, hier gibt es keine Piranhas...oder?!?";
STRING nass4_string, "Blubb!";
STRING nass5_string, "Ehhh, give me a submarine!!\nEhhh, gib mir ein U-Boot!!";

STRING schiebeschalter_string, "Hmmm, there was a strange noise...UNDER water??\nHmmm, es gab ein seltsames Geraeusch...UNTER Wasser??";

STRING knochen_string, "Uh, that's...disgusting!\nUh, das ist...ekelhaft!";
STRING schluessel_string, "Ahh! A handy key!\nAhh! Ein geiler Schluessel!";

STRING woister2_string, "Why haven't you that shit key?!\nWieso hast Du diesen verdammten Schluessel nicht?!";
STRING passt_string, "Yeez! It works!\nSesam, oeffne Dich!";

STRING bett3_string, "I'm sooo tired!\nIch bin sooo erschoepft!";

STRING nocheiner_string, "Hmmm, there must be another one!\nHmmm, es muss noch einen weiteren geben!";

STRING tusch_string, "HA! I'm the LORD OF...yes, you know the rest!\nThe beam gate should now be free!\n\nHA! ICH bin der LORD OF...ja, Du kennst den Rest!\nDas Beamtor sollte nun frei sein!";

STRING leer2_string, "+ Yeah, you're really good! +";
STRING leer3_string, "+          Eat my shirt!           +\n+ ...and don't forget to write me: +\n+      gambitsoft@t-online.de      +\n+     ...or a normal letter!       +";
STRING leer4_string, "+ REMEMBER: Whatever you wanna do... +\n+   THE PROGRAMMER IS WATCHING YOU!   +";
STRING leer5_string, "+ THE LORD OF LIGHTNING! +";
STRING leer6_string, "+ NO, you don't find the God mode! +";

STRING neustart_string, "restarting...\nneu starten...";

STRING instruction_string,
"You are ZEUS now, THE LORD OF LIGHTNING!
...and you have a big problem, a lot of problems, strictly
speaking! You were on Earth to watch your son Hercules.
But now, after you have seen what a shit he's done
you decided to go back to the Olympus! But the beam gate
to the holy mountain is closed. And a horde of stupid mummies
which were sent out by the Egyptian gods have orders to kill
you while you're on Earth! ...well, the biggest problem is that
you're NOT immortal on Earth. So, watch out for loo paper with
two ugly, red eyes...

Du bist kein anderer als ZEUS, THE LORD OF LIGHTNING!
... und Du hast ein Riesenproblem, sehr viele Probleme, um
genau zu sein! Du warst auf der Erde, um ein Auge auf Deinen
Sohn Hercules zu werfen. Aber nun nachdem Du seine
Scheisse gesehen hast, bist Du empoert zum Olymp
zurueckgekehrt! Aber das Beamtor zum heiligen Berg wurde
versperrt. Und eine Horde dummer Mumien, die von den
aegyptischen Goettern ausgesandt wurde, hat Befehl, Dich zu
toeten, waehrend Du auf der Erde bist! ...nun, das Hauptpro-
blem ist, daﬂ Du auf der Erde NICHT unsterblich bist. Also
Vorsicht vor Klopapier mit zwei wiederlichen, roten Augen!

      MOUSECLICK SOMEWHERE!       MAUSKLICK' IRGENDWO!";

STRING leer_string, " ";

//+++Texte+++/////////////////////////////////////////////////////////////////////////////
// POS_X und POS_Y fuer Merktexte: 40, 5 !
// POS_X und POS_Y fuer Hauptmenuetexte: 70, 65 !
TEXT strafe_text        {POS_X 110; POS_Y 160; FONT standart_font; STRING strafe_string;}
TEXT strafe2_text       {POS_X 100; POS_Y 160; FONT standart_font; STRING strafe2_string;}
TEXT strafe3_text       {POS_X 100; POS_Y 160; FONT standart_font; STRING strafe3_string;}
TEXT strafe4_text       {POS_X  90; POS_Y 160; FONT standart_font; STRING strafe4_string;}
TEXT wstrafe_text       {POS_X 110; POS_Y 160; FONT standart_font; STRING wstrafe_string;}
TEXT credits_text       {POS_X  70; POS_Y  65; FONT standart_font; STRING credits_string;}
TEXT help_text          {POS_X  70; POS_Y  65; FONT standart_font; STRING help_string;}
TEXT help2_text         {POS_X  70; POS_Y  65; FONT standart_font; STRING help2_string;}
TEXT help3_text         {POS_X  70; POS_Y  65; FONT standart_font; STRING help3_string;}
TEXT help4_text         {POS_X  70; POS_Y  65; FONT standart_font; STRING help4_string;}
TEXT vorade1_text       {POS_X 110; POS_Y 160; FONT standart_font; STRING vorade1_string;}
TEXT vorade2_text       {POS_X 110; POS_Y 160; FONT standart_font; STRING vorade2_string;}
TEXT vorade3_text       {POS_X 110; POS_Y 160; FONT standart_font; STRING vorade3_string;}
TEXT vorade4_text       {POS_X 110; POS_Y 160; FONT standart_font; STRING vorade4_string;}
TEXT vorade5_text       {POS_X 110; POS_Y 160; FONT standart_font; STRING vorade5_string;}
TEXT merke_text         {POS_X 	40; POS_Y   5; FONT standart_font; STRING leer_string;}
TEXT instruction_text   {POS_X  70; POS_Y  65; FONT standart_font; STRING instruction_string;}

//+++Panels+++////////////////////////////////////////////////////////////////////////////
PANEL haupt_pan  {POS_X 0; POS_Y 0; PAN_MAP haupt_map;}

PANEL knopf1_pan {POS_X 100; POS_Y 100; FLAGS REFRESH;
BUTTON 140,20,knopf1a_map,knopf1_map,beep,LL_showit;}

PANEL knopf2_pan {POS_X 100; POS_Y 140; FLAGS REFRESH;
BUTTON 140,20,knopf2a_map,knopf2_map,beep,LL_credits;}

PANEL knopf3_pan {POS_X 100; POS_Y 180; FLAGS REFRESH;
BUTTON 140,20,knopf3a_map,knopf3_map,beep,LL_help;}

PANEL knopf4_pan {POS_X 100; POS_Y 220; FLAGS REFRESH;
BUTTON 140,20,knopf4a_map,knopf4_map,beep,LL_vorade;}

ACTION LL_help {
SET IF_ESC,NULL;
SET PANELS.2,NULL;
SET PANELS.3,NULL;
SET PANELS.4,NULL;
SET PANELS.5,NULL;
SET help_text.VISIBLE,1;
SET IF_LEFT,LL_next1;
}

ACTION LL_next1 {
CALL beep;
SET help_text.VISIBLE,0;
SET help2_text.VISIBLE,1;
WAITT 3;
SET IF_LEFT,LL_next2;
}

ACTION LL_next2 {
CALL beep;
SET help2_text.VISIBLE,0;
SET help3_text.VISIBLE,1;
WAITT 3;
SET IF_LEFT,LL_next3;
}

ACTION LL_next3 {
CALL beep;
SET help3_text.VISIBLE,0;
SET help4_text.VISIBLE,1;
WAITT 3;
SET IF_LEFT,LL_zurueck2;
}


ACTION LL_zurueck2 {
SET help4_text.VISIBLE,0;
SET IF_LEFT,NULL;
WAITT 5;
BRANCH LL_showit0;}

ACTION LL_credits {
SET IF_ESC,NULL;
SET PANELS.2,NULL;
SET PANELS.3,NULL;
SET PANELS.4,NULL;
SET PANELS.5,NULL;
SET credits_text.VISIBLE,1;
SET IF_LEFT,LL_zurueck1;
}
ACTION LL_zurueck1 {
SET credits_text.VISIBLE,0;
SET IF_LEFT,NULL;
WAITT 5;
BRANCH LL_showit0;
}

ACTION beep {PLAY_SOUND klick_snd,0.6;}

ACTION LL_vorade {
SET IF_ESC,NULL;
SET PANELS.2,NULL;
SET PANELS.3,NULL;
SET PANELS.4,NULL;
SET PANELS.5,NULL;
SET IF_Z,LL_ade;
SET IF_Y,LL_ade;
RANDOMIZE rand333,5;
IF_BELOW  rand333,1; BRANCH vorade1;
IF_BELOW  rand333,2; BRANCH vorade2;
IF_BELOW  rand333,3; BRANCH vorade3;
IF_BELOW  rand333,4; BRANCH vorade4;
IF_BELOW  rand333,5; BRANCH vorade5;
}

ACTION vorade1 {SET vorade1_text.VISIBLE,1; SET IF_N,vorzur1;}
ACTION vorzur1 {SET vorade1_text.VISIBLE,0; SET IF_Z,NULL; SET IF_Y,NULL; SET IF_N,NULL; WAITT 3; BRANCH LL_showit0;}
ACTION vorade2 {SET vorade2_text.VISIBLE,1; SET IF_N,vorzur2;}
ACTION vorzur2 {SET vorade2_text.VISIBLE,0; SET IF_Z,NULL; SET IF_Y,NULL; SET IF_N,NULL; WAITT 3; BRANCH LL_showit0;}
ACTION vorade3 {SET vorade3_text.VISIBLE,1; SET IF_N,vorzur3;}
ACTION vorzur3 {SET vorade3_text.VISIBLE,0; SET IF_Z,NULL; SET IF_Y,NULL; SET IF_N,NULL; WAITT 3; BRANCH LL_showit0;}
ACTION vorade4 {SET vorade4_text.VISIBLE,1; SET IF_N,vorzur4;}
ACTION vorzur4 {SET vorade4_text.VISIBLE,0; SET IF_Z,NULL; SET IF_Y,NULL; SET IF_N,NULL; WAITT 3; BRANCH LL_showit0;}
ACTION vorade5 {SET vorade5_text.VISIBLE,1; SET IF_N,vorzur5;}
ACTION vorzur5 {SET vorade5_text.VISIBLE,0; SET IF_Z,NULL; SET IF_Y,NULL; SET IF_N,NULL; WAITT 3; BRANCH LL_showit0;}

ACTION LL_ade {EXIT
"                Thank you for playing THE LORD OF LIGHTNING!
                           THIS GAME IS FREEWARE!

                    THE LORD OF LIGHTNING is programmed by:
                              Alexander Seifriz
                             Feckenhauser Str.27
                               78628 Rottweil
                                   GERMANY
                        E-Mail: gambitsoft@t-online.de
               INTERNET: http://gambitsoft.com/lord/sprache.htm
                                     ***
";}

//+++OVLYS+++/////////////////////////////////////////////////////////////////////////////
OVLY lebman1_ovly          <anz.pcx>,0,0,30,222;
OVLY lebman2_ovly          <anz.pcx>,0,222,30,258;
OVLY lebman3_ovly          <anz.pcx>,60,59,24,164;

OVLY koffer1_ovly          <anz.pcx>,30,0,30,222;
OVLY koffer2_ovly          <anz.pcx>,30,222,30,258;
OVLY koffer3_ovly          <anz.pcx>,90,59,24,164;

OVLY rot2_ovly             <anz.pcx>,60,348,26,48;
OVLY rot1_ovly             <anz.pcx>,86,348,26,48;
OVLY blau2_ovly            <anz.pcx>,60,300,26,48;
OVLY blau1_ovly            <anz.pcx>,86,300,26,48;

OVLY l_ovly                <haupt.pcx>,0,0,60,480;
OVLY r_ovly                <haupt.pcx>,580,0,60,480;

OVLY zeiger_ovly           <anz.pcx>,60,400,60,40;

OVLY ende_ovly             <ende.pcx>,0,0,640,480;


//+++OVERLAYS+++//////////////////////////////////////////////////////////////////////////
OVERLAY lebman1_over       {POS_X 0;   POS_Y 0;   OVLYS lebman1_ovly; FLAGS ABSPOS;}
OVERLAY lebman2_over       {POS_X 0;   POS_Y 222; OVLYS lebman2_ovly; FLAGS ABSPOS;}
OVERLAY lebman3_over       {POS_X 1;   POS_Y 59;  OVLYS lebman3_ovly; FLAGS ABSPOS;}

OVERLAY koffer1_over       {POS_X 610; POS_Y 0;   OVLYS koffer1_ovly; FLAGS ABSPOS;}
OVERLAY koffer2_over       {POS_X 610; POS_Y 222; OVLYS koffer2_ovly; FLAGS ABSPOS;}
OVERLAY koffer3_over       {POS_X 612; POS_Y 59;  OVLYS koffer3_ovly; FLAGS ABSPOS;}


OVERLAY 1rot1_over          {POS_X 2;   POS_Y 282; OVLYS rot1_ovly; FLAGS ABSPOS;}
OVERLAY 2rot1_over          {POS_X 2;   POS_Y 332; OVLYS rot1_ovly; FLAGS ABSPOS;}
OVERLAY 3rot1_over          {POS_X 2;   POS_Y 382; OVLYS rot1_ovly; FLAGS ABSPOS;}
OVERLAY 4rot1_over          {POS_X 2;   POS_Y 432; OVLYS rot1_ovly; FLAGS ABSPOS;}

OVERLAY 1rot2_over          {POS_X 2;   POS_Y 282; OVLYS rot2_ovly; FLAGS ABSPOS;}
OVERLAY 2rot2_over          {POS_X 2;   POS_Y 332; OVLYS rot2_ovly; FLAGS ABSPOS;}
OVERLAY 3rot2_over          {POS_X 2;   POS_Y 382; OVLYS rot2_ovly; FLAGS ABSPOS;}
OVERLAY 4rot2_over          {POS_X 2;   POS_Y 432; OVLYS rot2_ovly; FLAGS ABSPOS;}

OVERLAY 1blau1_over         {POS_X 612; POS_Y 282; OVLYS blau1_ovly; FLAGS ABSPOS;}
OVERLAY 2blau1_over         {POS_X 612; POS_Y 332; OVLYS blau1_ovly; FLAGS ABSPOS;}
OVERLAY 3blau1_over         {POS_X 612; POS_Y 382; OVLYS blau1_ovly; FLAGS ABSPOS;}
OVERLAY 4blau1_over         {POS_X 612; POS_Y 432; OVLYS blau1_ovly; FLAGS ABSPOS;}

OVERLAY 1blau2_over         {POS_X 612; POS_Y 282; OVLYS blau2_ovly; FLAGS ABSPOS;}
OVERLAY 2blau2_over         {POS_X 612; POS_Y 332; OVLYS blau2_ovly; FLAGS ABSPOS;}
OVERLAY 3blau2_over         {POS_X 612; POS_Y 382; OVLYS blau2_ovly; FLAGS ABSPOS;}
OVERLAY 4blau2_over         {POS_X 612; POS_Y 432; OVLYS blau2_ovly; FLAGS ABSPOS;}

OVERLAY zeiger_over         {POS_X 2;   POS_Y 3;   OVLYS zeiger_ovly;}

OVERLAY l_over              {POS_X 0;   POS_Y 0;   OVLYS l_ovly;}
OVERLAY r_over              {POS_X 580; POS_Y 0;   OVLYS r_ovly;}

OVERLAY ende_over           {POS_X 0;   POS_Y 0;   OVLYS ende_ovly;}

PALETTE pal_red             {PALFILE <LL_red.pcx>;}
PALETTE pal_blo             {PALFILE <LL_bla.pcx>;}

//+++EVENTS+++////////////////////////////////////////////////////////////////////////////
ACTION tataa_play {PLAY_SOUND tataa_snd,0.6;}
ACTION merke_act {SET msg_skill,0; SET EACH_TICK.14, merke_zaehler_act;}
ACTION merke_zaehler_act {ADD msg_skill,1; IF_BELOW msg_skill,80; END; SET merke_text.STRING,leer_string; SET EACH_TICK.14,NULL;}
ACTION unterwassermeldung_act {
RANDOMIZE rand163,5;
IF_BELOW  rand163,1; BRANCH nass1_act;
IF_BELOW  rand163,2; BRANCH nass2_act;
IF_BELOW  rand163,3; BRANCH nass3_act;
IF_BELOW  rand163,4; BRANCH nass4_act;
IF_BELOW  rand163,5; BRANCH nass5_act;
}
ACTION nass1_act               {SET merke_text.STRING,nass1_string; CALL merke_act;}
ACTION nass2_act               {SET merke_text.STRING,nass2_string; CALL merke_act;}
ACTION nass3_act               {SET merke_text.STRING,nass3_string; CALL merke_act;}
ACTION nass4_act               {SET merke_text.STRING,nass4_string; CALL merke_act;}
ACTION nass5_act               {SET merke_text.STRING,nass5_string; CALL merke_act;}

ACTION sshift {
RANDOMIZE rand188,5;
IF_BELOW  rand188,1; BRANCH leer1_act;
IF_BELOW  rand188,2; BRANCH leer2_act;
IF_BELOW  rand188,3; BRANCH leer3_act;
IF_BELOW  rand188,4; BRANCH leer4_act;
IF_BELOW  rand188,5; BRANCH leer5_act;
}
ACTION leer1_act               {SET merke_text.STRING,leer2_string; CALL merke_act;}
ACTION leer2_act               {SET merke_text.STRING,leer3_string; CALL merke_act;}
ACTION leer3_act               {SET merke_text.STRING,leer4_string; CALL merke_act;}
ACTION leer4_act               {SET merke_text.STRING,leer5_string; CALL merke_act;}
ACTION leer5_act               {SET merke_text.STRING,leer6_string; CALL merke_act;}

ACTION neustart_act            {SET merke_text.STRING,neustart_string; CALL merke_act;}

ACTION schiebeschalterhoch_act {SET merke_text.STRING,schiebeschalter_string; CALL merke_act;}
ACTION knochen_act             {SET merke_text.STRING,knochen_string; CALL merke_act;}
ACTION schluessel_act          {SET merke_text.STRING,schluessel_string; CALL merke_act;}
ACTION keinschluessel_act      {SET merke_text.STRING,woister2_string; CALL merke_act; PLAY_SOUND tuer3_snd,0.6;}

ACTION passt_act               {SET merke_text.STRING,passt_string; CALL merke_act;}

ACTION bett_act                {SET merke_text.STRING,bett3_string; CALL merke_act;}

ACTION beamtoroffen_act        {SET merke_text.STRING,tusch_string; CALL merke_act; CALL tataa_play; CALL beamtorgitterweg_act;}
ACTION beamtorfastoffen_act    {SET merke_text.STRING,nocheiner_string; CALL merke_act; CALL tataa_play;}

ACTION triumph_act {
SET merke_text.VISIBLE,0;
SET LAYERS.16,ende_over;
SET IF_CTRL,NULL; SET IF_LEFT,NULL; SET IF_F2,NULL; SET IF_F3,NULL; SET IF_F5,NULL; SET IF_F6,NULL;
}

ACTION neustart_save {SET neustartsave_skill,1; SAVE "zero",0; WAIT 3; CALL LL_showit;}

//+++ A N F A N G +++/////////////////////////////////////////////////////////////////////ANFANG
ACTION LL_showit0 {

CALL tataa_play;

SET merke_text.VISIBLE,0;
SET IF_F2,NULL;
SET IF_F3,NULL;
SET IF_F5,NULL;
SET IF_F6,NULL;
SET IF_L,NULL;

SET IF_CTRL,NULL;
SET IF_LEFT,NULL;

SET MOVE_MODE,0; SET RENDER_MODE,0;
FADE_PAL pal_blue,0;
FADE_PAL pal_red,0;

SET LAYERS.16,l_over;
SET LAYERS.15,r_over;

SET PANELS.1,haupt_pan;
SET PANELS.2,knopf1_pan;
SET PANELS.3,knopf2_pan;
SET PANELS.4,knopf3_pan;
SET PANELS.5,knopf4_pan;
SET MOUSE_MODE,2; SET MSPRITE,zeiger_over; SET EACH_TICK.15,LL_mausbewegung; SET IF_ESC,LL_showit;
}

ACTION LL_mausbewegung {ADD MOUSE_X,MICKEY_X; ADD MOUSE_Y,MICKEY_Y;}


//+++SPIELSTART+++////////////////////////////////////////////////////////////////////////////////SPIELSTART
ACTION LL_showit  {
IF_EQUAL instruction_skill,0;
 BRANCH instruction_act;
SET MOVE_MODE,1; SET RENDER_MODE,0.5; SET MOUSE_MODE,0; SET IF_ESC,LL_showit0; SET EACH_TICK.15,NULL;
IF_EQUAL underwater,1;
 FADE_PAL pal_blue,0.8;

SET merke_text.VISIBLE,1;

SET IF_F2,LL_speichern;
SET IF_F3,LL_laden;
IF_EQUAL motionblur_skill,0;
 SET IF_F5,LL_motionblur;
IF_EQUAL motionblur_skill,1;
 SET IF_F5,LL_motionblura;
SET IF_F6,LL_screenshot;
SET IF_L,sshift;

SET PANELS.1,NULL;
SET PANELS.2,NULL;
SET PANELS.3,NULL;
SET PANELS.4,NULL;
SET PANELS.5,NULL;

SET LAYERS.16,NULL;
SET LAYERS.15,NULL;

SET LAYERS.2,lebman1_over;
SET LAYERS.3,lebman3_over;
SET LAYERS.4,lebman2_over;
SET LAYERS.5,koffer1_over;
SET LAYERS.6,koffer3_over;
SET LAYERS.7,koffer2_over;

SET IF_CTRL,LL_achtungfeuer;
SET IF_LEFT,LL_achtungfeuer;

IF_BELOW neustartsave_skill,1; BRANCH neustart_save;
}

ACTION instruction_act {
SET IF_ESC,NULL;
SET instruction_skill,1;
SET PANELS.2,NULL;
SET PANELS.3,NULL;
SET PANELS.4,NULL;
SET PANELS.5,NULL;
SET instruction_text.VISIBLE,1;
SET IF_LEFT,LL_weiter77;
PLAY_SOUND instruction_snd,0.7;
}
ACTION LL_weiter77 {
SET instruction_text.VISIBLE,0;
WAITT 3;
BRANCH LL_showit;
}

ACTION LL_speichern   {SET schongespeichert_skill,1; WAIT 2; SAVE "zeus",1; SET merke_text.STRING,speichern_string; CALL merke_act;}
ACTION LL_laden       {SET merke_text.STRING,laden_string; WAITT 1; CALL merke_act; LOAD "zeus",1; WAITT 2; SET merke_text.STRING,geladen_string; CALL merke_act;}
ACTION LL_motionblur  {SET MOTION_BLUR,1; SET motionblur_skill,1; SET IF_F5,LL_motionblura; SET merke_text.STRING,motionblur_string; CALL merke_act;}
ACTION LL_motionblura {SET MOTION_BLUR,0; SET motionblur_skill,0; SET IF_F5,LL_motionblur;  SET merke_text.STRING,motionblura_string; CALL merke_act;}
ACTION LL_screenshot  {SET MOTION_BLUR,0; WAITT 1; SCREENSHOT "pic",0; IF_EQUAL motionblur_skill,1; SET MOTION_BLUR,1; SET merke_text.STRING,screenshot_string; CALL merke_act;}

SKILL blutstrom       {}
SKILL wblutstrom      {}
SKILL bluthoehe       {VAL 4;}
SKILL rand222         {}

ACTION LL_unterwassertotpal   {PLAY_SOUND gluck_snd,0.6; SET IF_ESC,NULL; SET EACH_TICK.16,LL_unterwassertot;}
ACTION LL_unterwassertot      {ADD wblutstrom,0.05; ADD PLAYER_Z,-0.5; IF_ABOVE wblutstrom,0.5; BRANCH LL_wstrafe;}
ACTION LL_wstrafe   {
SET       EACH_TICK.16,NULL;
SET       MOVE_MODE,-0.5;
SET       merke_text.STRING,leer_string;
SET       wstrafe_text.VISIBLE,1;
PLAY_SOUND sterben_snd,0.6;
SET IF_ENTER,LL_neu;
}


ACTION LL_totpal   {SET IF_ESC,NULL; SET EACH_TICK.16,LL_tot; FADE_PAL pal_red,0.05;}
ACTION LL_tot      {ADD blutstrom,0.05; FADE_PAL pal_red,blutstrom; ADD bluthoehe,-0.5; IF_ABOVE bluthoehe,0.6; ADD PLAYER_Z,-0.5; IF_ABOVE blutstrom,0.5; BRANCH LL_strafe;}
ACTION LL_strafe   {
SET       EACH_TICK.16,NULL;
SET       MOVE_MODE,-0.5;
SET       merke_text.STRING,leer_string;
RANDOMIZE rand222,4;
IF_BELOW  rand222,1; BRANCH strafe_act;
IF_BELOW  rand222,2; BRANCH strafe2_act;
IF_BELOW  rand222,3; BRANCH strafe3_act;
IF_BELOW  rand222,4; BRANCH strafe4_act;
}
ACTION strafe_act  {SET strafe_text.VISIBLE,1;  SET IF_ENTER,LL_neu; PLAY_SOUND sterben_snd,0.6;}
ACTION strafe2_act {SET strafe2_text.VISIBLE,1; SET IF_ENTER,LL_neu; PLAY_SOUND sterben_snd,0.6;}
ACTION strafe3_act {SET strafe3_text.VISIBLE,1; SET IF_ENTER,LL_neu; PLAY_SOUND sterben_snd,0.6;}
ACTION strafe4_act {SET strafe4_text.VISIBLE,1; SET IF_ENTER,LL_neu; PLAY_SOUND sterben_snd,0.6;}

// (Multiplikationsfaktor, um die POS_Y Verschiebung auszurechnen = 1.64 !)
//+++leben weg
ACTION LL_rot_drei {RULE lebenpro = (((100 - leben) * 1.64) +59) + (3 * 1.64); RULE leben = leben - 3; SET lebman3_over.POS_Y,lebenpro; CALL schrei_act; IF_ABOVE leben,0; END; CALL LL_totpal;}
ACTION LL_rot_elf  {RULE lebenpro = (((100 - leben) * 1.64) +59) + (9 * 1.64); RULE leben = leben - 9; SET lebman3_over.POS_Y,lebenpro; CALL schrei_act; IF_ABOVE leben,0; END; CALL LL_totpal;}
ACTION zieh_ab     {RULE lebenpro = (((100 - leben) * 1.64) +59) + (2 * 1.64); RULE leben = leben - 2; SET lebman3_over.POS_Y,lebenpro; IF_ABOVE leben,0; END; CALL LL_unterwassertotpal;}

//+++leben dazu
ACTION LL_rot_fuenfzehn_plus {RULE lebenpro = (((100 - leben) * 1.64) + 59) - (20 * 1.64); RULE leben = leben + 20; SET lebman3_over.POS_Y,lebenpro;}
ACTION LL_rot_vierzig_plus   {RULE lebenpro = (((100 - leben) * 1.64) + 59) - (40 * 1.64); RULE leben = leben + 40; SET lebman3_over.POS_Y,lebenpro;}

//+++mana weg
ACTION LL_blau_drei {RULE manapro = (((100 - mana) * 1.64) +59) + (2* 1.64); RULE mana = mana - 2; SET koffer3_over.POS_Y,manapro; IF_ABOVE mana,0; END; SET act_geschoss.SKILL1,1; SET act_geschoss2.SKILL1,1; SET act_geschoss3.SKILL1,1; SET act_geschoss4.SKILL1,1; SET act_geschoss5.SKILL1,1; SET act_geschoss6.SKILL1,1; SET act_geschoss7.SKILL1,1; SET act_geschoss8.SKILL1,1; SET mana_leer_skill,1;}

//+++mana dazu
ACTION LL_blau_fuenfzehn_plus {RULE manapro = (((100 - mana) * 1.64) + 59) - (25 * 1.64); RULE mana = mana + 25; SET koffer3_over.POS_Y,manapro; IF_EQUAL mana_leer_skill,0; END; SET act_geschoss.SKILL1,0; SET act_geschoss2.SKILL1,0; SET act_geschoss3.SKILL1,0; SET act_geschoss4.SKILL1,0; SET act_geschoss5.SKILL1,0; SET act_geschoss6.SKILL1,0; SET act_geschoss7.SKILL1,0; SET act_geschoss8.SKILL1,0; SET mana_leer_skill,0;}
ACTION LL_blau_vierzig_plus   {RULE manapro = (((100 - mana) * 1.64) + 59) - (50 * 1.64); RULE mana = mana + 50; SET koffer3_over.POS_Y,manapro; IF_EQUAL mana_leer_skill,0; END; SET act_geschoss.SKILL1,0; SET act_geschoss2.SKILL1,0; SET act_geschoss3.SKILL1,0; SET act_geschoss4.SKILL1,0; SET act_geschoss5.SKILL1,0; SET act_geschoss6.SKILL1,0; SET act_geschoss7.SKILL1,0; SET act_geschoss8.SKILL1,0; SET mana_leer_skill,0;}

//+++schrei
SKILL schrei_skill {}
ACTION schrei_act {
RANDOMIZE schrei_skill,3;
IF_BELOW schrei_skill,1; GOTO label01;
IF_BELOW schrei_skill,2; GOTO label02;
IF_BELOW schrei_skill,3; GOTO label03;
label01: PLAY_SOUND aua1_snd,0.5; END;
label02: PLAY_SOUND aua2_snd,0.5; END;
label03: PLAY_SOUND aua3_snd,0.5; END;
}

//+++T7T AUFNEHM-VERFAHREN
ACTION esistblau1 {
IF_EQUAL blau_platz1_skill,0; GOTO nach1_blau1;
IF_EQUAL blau_platz2_skill,0; GOTO nach1_blau2;
IF_EQUAL blau_platz3_skill,0; GOTO nach1_blau3;
IF_EQUAL blau_platz4_skill,0; GOTO nach1_blau4;
END;
nach1_blau1: SET blau_platz1_skill,1; SET MY.INVISIBLE,1; SET LAYERS.8,1blau1_over;  SET blau1_1o2_skill,1; SET IF_5,hauwegblau_platz1; END;
nach1_blau2: SET blau_platz2_skill,1; SET MY.INVISIBLE,1; SET LAYERS.9,2blau1_over;  SET blau2_1o2_skill,1; SET IF_6,hauwegblau_platz2; END;
nach1_blau3: SET blau_platz3_skill,1; SET MY.INVISIBLE,1; SET LAYERS.10,3blau1_over; SET blau3_1o2_skill,1; SET IF_7,hauwegblau_platz3; END;
nach1_blau4: SET blau_platz4_skill,1; SET MY.INVISIBLE,1; SET LAYERS.11,4blau1_over; SET blau4_1o2_skill,1; SET IF_8,hauwegblau_platz4; END;
}
ACTION esistblau2 {
IF_EQUAL blau_platz1_skill,0; GOTO nach2_blau1;
IF_EQUAL blau_platz2_skill,0; GOTO nach2_blau2;
IF_EQUAL blau_platz3_skill,0; GOTO nach2_blau3;
IF_EQUAL blau_platz4_skill,0; GOTO nach2_blau4;
END;
nach2_blau1: SET blau_platz1_skill,1; SET MY.INVISIBLE,1; SET LAYERS.8,1blau2_over;  SET blau1_1o2_skill,2; SET IF_5,hauwegblau_platz1; END;
nach2_blau2: SET blau_platz2_skill,1; SET MY.INVISIBLE,1; SET LAYERS.9,2blau2_over;  SET blau2_1o2_skill,2; SET IF_6,hauwegblau_platz2; END;
nach2_blau3: SET blau_platz3_skill,1; SET MY.INVISIBLE,1; SET LAYERS.10,3blau2_over; SET blau3_1o2_skill,2; SET IF_7,hauwegblau_platz3; END;
nach2_blau4: SET blau_platz4_skill,1; SET MY.INVISIBLE,1; SET LAYERS.11,4blau2_over; SET blau4_1o2_skill,2; SET IF_8,hauwegblau_platz4; END;
}
ACTION esistrot1  {
IF_EQUAL rot_platz1_skill,0; GOTO nach1_rot1;
IF_EQUAL rot_platz2_skill,0; GOTO nach1_rot2;
IF_EQUAL rot_platz3_skill,0; GOTO nach1_rot3;
IF_EQUAL rot_platz4_skill,0; GOTO nach1_rot4;
END;
nach1_rot1: SET rot_platz1_skill,1; SET MY.INVISIBLE,1; SET LAYERS.12,1rot1_over; SET rot1_1o2_skill,1; SET IF_1,hauwegrot_platz1; END;
nach1_rot2: SET rot_platz2_skill,1; SET MY.INVISIBLE,1; SET LAYERS.13,2rot1_over; SET rot2_1o2_skill,1; SET IF_2,hauwegrot_platz2; END;
nach1_rot3: SET rot_platz3_skill,1; SET MY.INVISIBLE,1; SET LAYERS.14,3rot1_over; SET rot3_1o2_skill,1; SET IF_3,hauwegrot_platz3; END;
nach1_rot4: SET rot_platz4_skill,1; SET MY.INVISIBLE,1; SET LAYERS.15,4rot1_over; SET rot4_1o2_skill,1; SET IF_4,hauwegrot_platz4; END;
}
ACTION esistrot2  {
IF_EQUAL rot_platz1_skill,0; GOTO nach2_rot1;
IF_EQUAL rot_platz2_skill,0; GOTO nach2_rot2;
IF_EQUAL rot_platz3_skill,0; GOTO nach2_rot3;
IF_EQUAL rot_platz4_skill,0; GOTO nach2_rot4;
END;
nach2_rot1: SET rot_platz1_skill,1; SET MY.INVISIBLE,1; SET LAYERS.12,1rot2_over; SET rot1_1o2_skill,2; SET IF_1,hauwegrot_platz1; END;
nach2_rot2: SET rot_platz2_skill,1; SET MY.INVISIBLE,1; SET LAYERS.13,2rot2_over; SET rot2_1o2_skill,2; SET IF_2,hauwegrot_platz2; END;
nach2_rot3: SET rot_platz3_skill,1; SET MY.INVISIBLE,1; SET LAYERS.14,3rot2_over; SET rot3_1o2_skill,2; SET IF_3,hauwegrot_platz3; END;
nach2_rot4: SET rot_platz4_skill,1; SET MY.INVISIBLE,1; SET LAYERS.15,4rot2_over; SET rot4_1o2_skill,2; SET IF_4,hauwegrot_platz4; END;
}

//+++Hau' weg die Scheisse!
ACTION hauwegblau_platz1 {PLAY_SOUND mana_snd,0.4; SET IF_5,NULL; SET LAYERS.8,NULL;  SET blau_platz1_skill,0; IF_EQUAL blau1_1o2_skill,1; BRANCH LL_blau_fuenfzehn_plus; BRANCH LL_blau_vierzig_plus;}
ACTION hauwegblau_platz2 {PLAY_SOUND mana_snd,0.4; SET IF_6,NULL; SET LAYERS.9,NULL;  SET blau_platz2_skill,0; IF_EQUAL blau2_1o2_skill,1; BRANCH LL_blau_fuenfzehn_plus; BRANCH LL_blau_vierzig_plus;}
ACTION hauwegblau_platz3 {PLAY_SOUND mana_snd,0.4; SET IF_7,NULL; SET LAYERS.10,NULL; SET blau_platz3_skill,0; IF_EQUAL blau3_1o2_skill,1; BRANCH LL_blau_fuenfzehn_plus; BRANCH LL_blau_vierzig_plus;}
ACTION hauwegblau_platz4 {PLAY_SOUND mana_snd,0.4; SET IF_8,NULL; SET LAYERS.11,NULL; SET blau_platz4_skill,0; IF_EQUAL blau4_1o2_skill,1; BRANCH LL_blau_fuenfzehn_plus; BRANCH LL_blau_vierzig_plus;}

ACTION hauwegrot_platz1  {PLAY_SOUND leben_snd,0.5; SET IF_1,NULL; SET LAYERS.12,NULL; SET rot_platz1_skill,0;  IF_EQUAL rot1_1o2_skill,1;  BRANCH LL_rot_fuenfzehn_plus;  BRANCH LL_rot_vierzig_plus;}
ACTION hauwegrot_platz2  {PLAY_SOUND leben_snd,0.5; SET IF_2,NULL; SET LAYERS.13,NULL; SET rot_platz2_skill,0;  IF_EQUAL rot2_1o2_skill,1;  BRANCH LL_rot_fuenfzehn_plus;  BRANCH LL_rot_vierzig_plus;}
ACTION hauwegrot_platz3  {PLAY_SOUND leben_snd,0.5; SET IF_3,NULL; SET LAYERS.14,NULL; SET rot_platz3_skill,0;  IF_EQUAL rot3_1o2_skill,1;  BRANCH LL_rot_fuenfzehn_plus;  BRANCH LL_rot_vierzig_plus;}
ACTION hauwegrot_platz4  {PLAY_SOUND leben_snd,0.5; SET IF_4,NULL; SET LAYERS.15,NULL; SET rot_platz4_skill,0;  IF_EQUAL rot4_1o2_skill,1;  BRANCH LL_rot_fuenfzehn_plus;  BRANCH LL_rot_vierzig_plus;}

//////////////////////////////////////////////////////////////////////////////////////////////////
//+++ E   N    D    E  +++////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////


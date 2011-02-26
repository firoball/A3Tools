////////////////////////////////////////////////////////////////////
////																				 ////
////                SKAPHANDER SOUND WDL								 ////
////																				 ////
////////////////////////////////////////////////////////////////////
//alle Standardsounds fÅr Skaphander sind hier enthalten.
//Spezialsounds mÅssen einzeln in den Leveln definiert sein.
// Musik mu· auch im eigenen Level stehen, da der Levelsong wechselt.

SOUND	bang,<eras_0.wav>;				#waffensounds
SOUND	twaeng,<debug_1.wav>;
SOUND	tchhh,<laserbig.wav>;
SOUND int_schuss,<shotgun.wav>;
SOUND int_ex,<bigplod.wav>;

SOUND	klick, <aufsetz.wav>;
SOUND EngineRun, <ska3.wav>; 			# Skaphandersound
SOUND	lift_sound,<lift.wav>;
#SOUND booster, <jet.wav>;				//spÑter rauswerfen
#SOUND allchange, <suppers.wav>;  	# abschlu·meldung bei reparaturarbeiten
SOUND klonk,<klonk.wav>;				# Energie und Damage- Ladesound
SOUND alarm, <alarm.wav>;				# abschlu·meldung in der tankstation
SOUND	door_open, <tuer_auf.wav>;		# tÅr auf
SOUND tor1_open, <tor_1.wav>;		# tÅr auf - metalic
SOUND tor2_open, <tor_2.wav>;		# tÅr auf - electro
SOUND Beamer, <beamer.wav>; 			# beim aufnehmen von Energie/damage
SOUND HolterdiePolter, <stufe2.wav>;# Wenn der Skafi eine Stufe runterpurzelt
SOUND Matmaplatsch, <platsch.wav>; 	# platsch..
SOUND Matmaschtalp, <schtalp.wav>; 	# platsch beim auftauchen
SOUND UnterMatmaBlubb, <underh2o.wav>;
SOUND Sockel,<stdoor.wav>; 			# Sound beim Auf und Absenken von Regionen
SOUND Sockel_l,<stdoor_2.wav>; 			# Sound beim Auf und Absenken von Regionen
SOUND rrumms,<crash2.wav>;			# wenn der Skaffi runterkracht
SOUND button,<button1.wav>;
SOUND button2,<button2.wav>;
SOUND Britzel,<britzel1.wav>; 		# Energienetz
SOUND plankenscratch,<planke.wav>; #immer an der Planke entlang
SOUND Tron_bang, <tr_ex0.wav>;
SOUND x_bang, <xbang.wav>;
SOUND Bumper, <bumper.wav>; 				#Aufprall auf Energybumper
SOUND pstryk_1,<pstryk1.wav>; #Pstrikumpstarkum
SOUND count_snd,<count4.wav>;	// Energy/Health-Countdown

/////////////////////////////////////////
ACTION HelterSkelter {IF_ABOVE PLAYER_HGT	2; END;PLAY_SOUND holterdiepolter, 0.3;}
ACTION beamerwhoop {
PLAY_SOUND	beamer,0.2;
}
ACTION MatmaPluff {
PLAY_SOUND	Matmaplatsch,0.6;
}
ACTION  LeitScratch{
PLAY_SOUND	Plankenscratch,0.1;
}
ACTION  bumperdoing{
PLAY_SOUND	bumper,0.3;
}
/////////////////////////////////////////

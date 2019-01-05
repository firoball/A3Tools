//////////lift (SKILL8 =upper floor height / SKILL7 =lower floor height)

ACTION lift_up {
        IF_NEQUAL THERE.FLOOR_HGT,THERE.SKILL8;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
	END;
        ADD THERE.FLOOR_HGT,0.5;
	IF_EQUAL HERE,THERE;
	        ADD PLAYER_Z,0.5;
	SET RENDER_MODE,1;}

ACTION lift_down {
        IF_NEQUAL THERE.FLOOR_HGT,THERE.SKILL7;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
        END;
        ADD THERE.FLOOR_HGT,-0.5;
	IF_EQUAL HERE,THERE;
	        ADD PLAYER_Z,-0.5;
	SET RENDER_MODE,1;}

//////////elevator (SKILL8 =upper floor height / SKILL7 =lower floor height)

ACTION elevator_up {
        IF_NEQUAL THERE.FLOOR_HGT,THERE.SKILL8;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
        END;
        ADD THERE.FLOOR_HGT,0.5;
        ADD THERE.CEIL_HGT,0.5;
	IF_EQUAL HERE,THERE;
	        ADD PLAYER_Z,0.5;
	SET RENDER_MODE,1;}

ACTION elevator_down {
        IF_NEQUAL THERE.FLOOR_HGT,THERE.SKILL7;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
        END;
        ADD THERE.FLOOR_HGT,-0.5;
        ADD THERE.CEIL_HGT,-0.5;
	IF_EQUAL HERE,THERE;
		ADD PLAYER_Z,-0.5;
        SET RENDER_MODE,1;}

//////////platform (SKILL8 =upper ceil height / SKILL7 =lower ceil height)
#the upper region can be controlled with the normal lift-Action!! 
#Use this Action also for a crushing ceiling 

ACTION platform_up {
        IF_NEQUAL THERE.CEIL_HGT,THERE.SKILL8;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
        END;
        ADD THERE.CEIL_HGT,0.5;
        SET RENDER_MODE,1;}

ACTION platform_down {
        IF_NEQUAL THERE.CEIL_HGT,THERE.SKILL7;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
        END;
        RULE THERE.SKILL4 = THERE.CEIL_HGT - THERE.FLOOR_HGT;
        IF_NEQUAL HERE,THERE;
                SKIP 2;
        SET THERE.EACH_TICK,NULL;
	SET HP,0;
        ADD THERE.CEIL_HGT,-0.5;
        SET RENDER_MODE,1;}





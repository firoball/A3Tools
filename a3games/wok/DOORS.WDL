SKILL Ch {VAL 0;}
SKILL state {VAL 0;}
//////////ceildoor (SKILL7= max ceil raise SKILL8= used!)

ACTION ceildoor_open {
	IF_NEQUAL THERE.CEIL_HGT,THERE.SKILL7;
                SKIP 4;
	SET THERE.EACH_TICK,NULL;
        IF_EQUAL THERE.FLAG6,1;
                SET THERE.EACH_TICK,ceil_timer;
	END;
	ADD THERE.CEIL_HGT,0.5;
	SET RENDER_MODE,1;}

ACTION ceildoor_close {
        RULE THERE.SKILL8=PLAYER_Z+0.5;
        IF_NEQUAL THERE.CEIL_HGT,THERE.FLOOR_HGT;
		SKIP 2;
	SET THERE.EACH_TICK,NULL;
        END;
	ADD THERE.CEIL_HGT,-0.5;
        SET RENDER_MODE,1;
        IF_NEQUAL HERE,THERE;
                END;
        IF_BELOW THERE.CEIL_HGT,THERE.SKILL8;
                SET THERE.EACH_TICK,ceildoor_open;
        }

ACTION ceil_timer {
        ADDT THERE.SKILL6,1;
        IF_BELOW THERE.SKILL6,80;
                END;
        SET THERE.EACH_TICK,ceildoor_close;
        SET THERE.SKILL6,0;}

//////////splitdoor (SKILL7= max floor lower/max ceil raise SKILL8= used!)

ACTION splitdoor_open {
	IF_NEQUAL THERE.CEIL_HGT,THERE.SKILL7;
        SKIP 4;
	SET THERE.EACH_TICK,NULL;
        IF_EQUAL THERE.FLAG6,1;
                SET THERE.EACH_TICK,split_timer;
	END;
	ADD THERE.CEIL_HGT,0.5;
	ADD THERE.FLOOR_HGT,-0.5;
	SET RENDER_MODE,1;}

ACTION splitdoor_close {
        RULE THERE.SKILL8=PLAYER_Z+1;
	IF_BELOW THERE.FLAG7,1;
		SKIP 1;
	SET THERE.EACH_TICK,NULL;
	IF_NEQUAL THERE.CEIL_HGT,THERE.FLOOR_HGT;
		SKIP 2;
	SET THERE.EACH_TICK,NULL;
	END;
	ADD THERE.CEIL_HGT,-0.5;
	ADD THERE.FLOOR_HGT,0.5;
        SET RENDER_MODE,1;
        IF_NEQUAL HERE,THERE;
                END;
        IF_BELOW THERE.CEIL_HGT,THERE.SKILL8;
                SET THERE.EACH_TICK,splitdoor_open;
}

ACTION split_timer {
        ADDT THERE.SKILL6,1;
        IF_BELOW THERE.SKILL6,80;
                END;
        SET THERE.EACH_TICK,splitdoor_close;
        SET THERE.SKILL6,0;}

//////////Floordoor (SKILL7= max floor lower SKILL8= used!)


ACTION floordoor_open {
	IF_NEQUAL THERE.FLOOR_HGT,THERE.SKILL7;
                SKIP 4;
	SET THERE.EACH_TICK,NULL;
        IF_EQUAL THERE.FLAG6,1;
                SET THERE.EACH_TICK,floor_timer;
	END;
	ADD THERE.FLOOR_HGT,-0.5;
	SET RENDER_MODE,1;}

ACTION floordoor_close {
        RULE THERE.SKILL8=PLAYER_Z+0.5;
	IF_BELOW THERE.FLAG7,1;
		SKIP 1;
	SET THERE.EACH_TICK,NULL;
	IF_NEQUAL THERE.CEIL_HGT,THERE.FLOOR_HGT;
		SKIP 2;
	SET THERE.EACH_TICK,NULL;
	END;
	ADD THERE.FLOOR_HGT,0.5;
        SET RENDER_MODE,1;
        IF_NEQUAL HERE,THERE;
                END;
        IF_BELOW THERE.CEIL_HGT,THERE.SKILL8;
                SET THERE.EACH_TICK,floordoor_open;
}

ACTION floor_timer {
        ADDT THERE.SKILL6,1;
        IF_BELOW THERE.SKILL6,80;
                END;
        SET THERE.EACH_TICK,floordoor_close;
        SET THERE.SKILL6,0;}

//////////Slidedoor (SKILL7 =openwidth in STEPS*1/openspeed [normal door =8])
//////////        (SKILL2 =openspeed X,SKILL3 =openspeed Y,SKILL458 are used!)        
ACTION slidedoor_open {
	IF_NEQUAL THERE.SKILL8,THERE.SKILL7;
		SKIP 2;
	SET THERE.EACH_TICK,NULL;
	END;
	ADD THERE.SKILL8,1;
	SHIFT THERE,THERE.SKILL2,THERE.SKILL3;
#	IF_NEQUAL HERE,THERE;
#		SKIP 2;
#	ADD PLAYER_X,THERE.SKILL2;
#	ADD PLAYER_Y,THERE.SKILL3;
	SET RENDER_MODE,1;}

ACTION slidedoor_close {
	IF_NEQUAL THERE.SKILL8,0;
		SKIP 2;
	SET THERE.EACH_TICK,NULL;
	END;
	RULE THERE.SKILL4=-1 * THERE.SKILL2;
	RULE THERE.SKILL5=-1 * THERE.SKILL3;
	ADD THERE.SKILL8,-1;
	SHIFT THERE,THERE.SKILL4,THERE.SKILL5;
#	IF_NEQUAL HERE,THERE;
#		SKIP 2;
#	ADD PLAYER_X,THERE.SKILL4;
#	ADD PLAYER_Y,THERE.SKILL5;
	SET RENDER_MODE,1;}

//////////Texdoor (works like slidedoor,but SKILL16 are used,SKILL45 aren't!)

ACTION texdoor_open {
	IF_NEQUAL MY.SKILL1,MY.SKILL7;
        	SKIP 4;        
	SET MY.EACH_TICK,NULL;
	IF_EQUAL MY.FLAG6,1;
                SET MY.EACH_TICK,tex_timer;
	END;
	ADD MY.X2,MY.SKILL2;
 	ADD MY.X1,MY.SKILL2;
 	ADD MY.Y2,MY.SKILL3;
	ADD MY.Y1,MY.SKILL3;
	ADD MY.SKILL1,1;
	SET RENDER_MODE,1;
}

ACTION texdoor_close {
	IF_NEQUAL MY.SKILL1,0;
		SKIP 2;	
	SET MY.EACH_TICK,NULL;
	END;
	SUB MY.X2,MY.SKILL2;
	SUB MY.X1,MY.SKILL2;
	SUB MY.Y2,MY.SKILL3;
	SUB MY.Y1,MY.SKILL3;
	ADD MY.SKILL1,-1;
	SET RENDER_MODE,1;
}

ACTION tex_timer {
        ADDT MY.SKILL6,1;
        IF_BELOW MY.SKILL6,80;
                END;
        SET MY.EACH_TICK,texdoor_close;
        SET MY.SKILL6,0;}

//////////Swingdoor (SKILL3= startangle, SKILL4= endangle, SKILL5678 are used!)

ACTION swing_open {
        SET THERE.FLAG7,1;
        SET THERE.SKILL5,THERE.SKILL3;
        SET THERE.SKILL7,THERE.SKILL4;
	SET THERE.EACH_TICK,swing_inctick;
        IF_BELOW THERE.SKILL4,THERE.SKILL3;
                SET THERE.EACH_TICK,swing_dectick;
        }
ACTION swing_close {
        SET THERE.FLAG7,0;
        SET THERE.SKILL5,THERE.SKILL4;
        SET THERE.SKILL7,THERE.SKILL3;
        SET THERE.EACH_TICK,swing_dectick;
	SET THERE.EACH_TICK,swing_dectick;
        IF_BELOW THERE.SKILL4,THERE.SKILL3;
                SET THERE.EACH_TICK,swing_inctick;
        }
ACTION swing_inctick {
        RULE THERE.SKILL6=TIME_CORR*0.1;
        ADD THERE.SKILL5,THERE.SKILL6;
        ROTATE THERE,THERE.SKILL6;
        SET RENDER_MODE,1;
        IF_ABOVE THERE.SKILL5,THERE.SKILL7;
                SKIP 1;                
        END;
        SET THERE.EACH_TICK,NULL;
        IF_EQUAL THERE.FLAG6,0;
                END;
        IF_EQUAL THERE.FLAG7,0;
                END; 
        SET THERE.EACH_TICK,swing_timer;}

ACTION swing_dectick {
        RULE THERE.SKILL6=-TIME_CORR*0.1;
        ADD THERE.SKILL5,THERE.SKILL6;
        ROTATE THERE,THERE.SKILL6;
        SET RENDER_MODE,1;
        IF_BELOW THERE.SKILL5,THERE.SKILL7;
                SKIP 1;        
        END;
        SET THERE.EACH_TICK,NULL;
        IF_EQUAL THERE.FLAG6,0;
                END;
        IF_EQUAL THERE.FLAG7,0;
                END; 
        SET THERE.EACH_TICK,swing_timer;}

ACTION swing_timer {
        ADDT THERE.SKILL8,1;
        IF_BELOW THERE.SKILL8,80;
                END;
        SET THERE.EACH_TICK,swing_close;
        SET THERE.SKILL8,0;}







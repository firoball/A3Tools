/*
 *******************************************************************************
 * sysmsg.c
 * Creation date: 13.08.2008
 * Author:        Firoball
 *
 *******************************************************************************
 * $Date$
 * $Revision$
 * $Author$
 *
 *******************************************************************************
 * Description
 *
 * Script for System message functions
 *
 * Comments
 * 
 * for short descriptions see comments in sysmsg.h
 *
 *******************************************************************************
 */

/* ----- INCLUDES ----- */


#include <acknex.h>


/* ----- GLOBALS ----- */


SYSMSG *sysmsg = NULL;


/* ----- EXTERNAL FUNCTIONS ----- */


void SYSMSG_create()
{
	/* use default values */
	SYSMSG_create((char*)SYSMSG_strFont, (var)SYSMSG_vBufferSize, (var)SYSMSG_vLayer);
}

void SYSMSG_create(char* pcFont, var vBufferSize, var vLayer)
{
	/* if sysmsg already is allocated, delete old sysmsg first */
	if (sysmsg != NULL)
		SYSMSG_remove();
		
	/* allocate memory */
	sysmsg = (SYSMSG*)sys_malloc(sizeof(SYSMSG));

	/* initialize properties */
	sysmsg->fntSys = font_create(pcFont);
	sysmsg->txtSys = txt_create(vBufferSize, vLayer);
	sysmsg->txtSys->font = sysmsg->fntSys;
	sysmsg->txtSys->flags = VISIBLE;
	sysmsg->iAllowedMode = SYSMSG_SHOW_DEBUG | SYSMSG_SHOW_ERROR | SYSMSG_SHOW_DEFAULT | SYSMSG_SHOW_SYSTEM | SYSMSG_SHOW_PLUGIN;
	sysmsg->vBufferSize = vBufferSize;
	sysmsg->vBufferUsed = 0;
	sysmsg->iEnableLog = OFF;
	sysmsg->vLogFileHndl = NULL;

	/* start update Timer - function starts loop */
	SYSMSG__runTimer_loop();
}

void SYSMSG_remove()
{
	int i;

	if (sysmsg != NULL)
	{
		for (i = 0; i < sysmsg->txtSys->strings; i++) 
		{
			/* remove all strings of text object */
		  	if ((sysmsg->txtSys->pstring)[i]) 
  	  			ptr_remove((sysmsg->txtSys->pstring)[i]);
		}
		ptr_remove(sysmsg->txtSys);
		ptr_remove(sysmsg->fntSys);
		sys_free (sysmsg);
		sysmsg = NULL;
	}
}

void SYSMSG_show()
{
	sysmsg->txtSys->flags |= VISIBLE;
}

void SYSMSG_hide()
{
	sysmsg->txtSys->flags &= ~VISIBLE;
}

void SYSMSG_print(STRING* strMsg)
{
	int iMode = SYSMSG_DEFAULT;
	SYSMSG_print(iMode, strMsg->chars);
}

void SYSMSG_print(char* pcMsg)
{
	int iMode = SYSMSG_DEFAULT;
	SYSMSG_print(iMode, pcMsg);
}

void SYSMSG_print(int iMode, STRING* strMsg)
{
	SYSMSG_print(iMode, strMsg->chars);
}

void SYSMSG_print(int iMode, char* pcMsg)
{
	if (sysmsg != NULL)
	{
		/* if no other messages are buffered, init vUpdateTimer 
		in order to guarantee a message display time of at least
		SYSMSG_vUpdateTimer_TOUT */
		if (sysmsg->vBufferUsed == 0)
			sysmsg->vUpdateTimer = SYSMSG_vUpdateTimer_TOUT;
	
		/* if selected mode is enabled, add message to text window */
		if	((iMode & sysmsg->iAllowedMode) != 0)
		{
			/* if buffer is filled, throw away oldest entry */
			if (sysmsg->vBufferUsed == sysmsg->vBufferSize)
				SYSMSG__update();
			
			/* copy message to message buffer */
			str_cpy((sysmsg->txtSys->pstring)[sysmsg->vBufferUsed], pcMsg);
			if (sysmsg->vLogFileHndl != NULL)
			{
				file_str_write(sysmsg->vLogFileHndl, (sysmsg->txtSys->pstring)[sysmsg->vBufferUsed]);
				file_str_write(sysmsg->vLogFileHndl, "\r\n");
			}		
			sysmsg->vBufferUsed++;
		}
	}
}

void SYSMSG_setMode(int iMode)
{
	sysmsg->iAllowedMode = iMode;
}

void SYSMSG_logToFile(int iEnable)
{
	if (iEnable == 0)
	{
		sysmsg->iEnableLog = OFF;
		/* if file handle is still valid, close file */
		if (sysmsg->vLogFileHndl != NULL)
		{
			file_close (sysmsg->vLogFileHndl);
			sysmsg->vLogFileHndl = NULL;
		}
	}
	else
	{
		sysmsg->iEnableLog = ON;
		/* only open new file, if handle is invalid */
		if (sysmsg->vLogFileHndl == NULL)
		{
			sysmsg->vLogFileHndl = file_open_write ("sysmsg.log");
			file_str_write(sysmsg->vLogFileHndl, "Log started: [");
			file_var_write(sysmsg->vLogFileHndl, sys_day);
			file_var_write(sysmsg->vLogFileHndl, sys_month);
			file_var_write(sysmsg->vLogFileHndl, sys_year);
			file_str_write(sysmsg->vLogFileHndl, "] [");
			file_var_write(sysmsg->vLogFileHndl, sys_hours);
			file_var_write(sysmsg->vLogFileHndl, sys_minutes);
			file_var_write(sysmsg->vLogFileHndl, sys_seconds);
			file_str_write(sysmsg->vLogFileHndl, "]");
			file_str_write(sysmsg->vLogFileHndl, "\r\n\r\n");
		}	
	}
}

void SYSMSG_setPos(var vX, var vY)
{
	/* pass information to TEXT object */
	sysmsg->txtSys->pos_x = vX;
	sysmsg->txtSys->pos_y = vY;
}

void SYSMSG_setScale(var vX, var vY)
{
	/* pass information to TEXT object */
	sysmsg->txtSys->scale_x = vX;
	sysmsg->txtSys->scale_y = vY;
}

void SYSMSG_setFlags(var vFlags)
{
	/* pass information to TEXT object */
	sysmsg->txtSys->flags |= vFlags;
}

var SYSMSG_isActive()
{
	var vRetval;
	
	if (sysmsg != NULL)
	{
		vRetval = 1;
	}
	else
	{
		vRetval = 0;
	}
	
	return vRetval;
}


/* ----- INTERNAL FUNCTIONS ----- */


void SYSMSG__runTimer_loop()
{
	/* loop until sysmsg object is invalid */
	while (sysmsg != NULL)
	{

		/* only decrement timer if > 0 */
		if (sysmsg->vUpdateTimer > 0)
		{
			sysmsg->vUpdateTimer -= time_step;
			if (sysmsg->vUpdateTimer <= 0)
			{
				/* remove oldest message in message buffer */
				sysmsg->vUpdateTimer = 0;
				SYSMSG__update();
			}
		}
		wait (1);
	}
}

void SYSMSG__update()
{
	int i;
	/* move all messages one index lower, drop message on lowest index */
	for (i = 1; i < sysmsg->vBufferSize && i < sysmsg->vBufferUsed; i++)
	{
		str_cpy((sysmsg->txtSys->pstring)[i - 1], (sysmsg->txtSys->pstring)[i]);
	}

	/* remove message with highest index because it has already been moved to lower index */
	if (sysmsg->vBufferUsed > 0)
	{
		sysmsg->vBufferUsed--;
		str_cpy((sysmsg->txtSys->pstring)[sysmsg->vBufferUsed], "");
		/* prepare update timer for next turn */
		sysmsg->vUpdateTimer = SYSMSG_vUpdateTimer_TOUT;
	}
}


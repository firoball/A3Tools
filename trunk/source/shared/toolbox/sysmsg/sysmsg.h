/*
 *******************************************************************************
 * sysmsg.h
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
 * Definition Script for System message 
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef SYSMSG_H
#define SYSMSG_H
/*! \file 
 *  Include file for system messages.
 */

/* ----- DEFINITIONS ----- */


#define SYSMSG_ACTIVE	/*!< This define can be evaluated to check if this module is included and active */

/*! \name Configuration Data 
 *  The values of these parameters can be overwritten by defining them before including this file.
 * \{ */
#ifndef SYSMSG_vUpdateTimer_TOUT
#define SYSMSG_vUpdateTimer_TOUT	80 /*!< Display time for a message (= display time in s *16) */
#endif

#ifndef SYSMSG_vBufferSize
#define SYSMSG_vBufferSize 10 /*!< Default size (lines) of message buffer */
#endif

#ifndef SYSMSG_vLayer
#define SYSMSG_vLayer 20 /*!< Default layer of message buffer text object */
#endif

#ifndef SYSMSG_strFont
#define SYSMSG_strFont "ackfont.pcx" /*!< Default font of message buffer */
#endif
/* \} */

/*! \name Constant Data - Message Visibility
 *  These defines are used to define which message types will be shown by the 
 *  system message object.
 *  Allowing multiple message types can be achieved by bitwise or-ing the 
 *  defines (just treat them like the usual A7 object flags).
 *  For setting use SYSMSG_setMode.
 *  By default all types of messages are shown .
 *  It is possible and also makes sense to define 
 *  your own types if needed in order to keep things understandable
 * \{ */
#define SYSMSG_SHOW_NONE		0
#define SYSMSG_SHOW_DEBUG		1
#define SYSMSG_SHOW_ERROR		2
#define SYSMSG_SHOW_DEFAULT	4
#define SYSMSG_SHOW_SYSTEM		8
#define SYSMSG_SHOW_PLUGIN		16
/* \} */

/*! \name Constant Data - Message Types
 *  These defines are used to specify message type for
 *  SYSMSG_print. 
 *  It is possible and also makes sense to define 
 *  your own types if needed in order to keep things understandable
 * \{ */
#define SYSMSG_DEBUG		1
#define SYSMSG_ERROR		2
#define SYSMSG_DEFAULT	4
#define SYSMSG_SYSTEM	8
#define SYSMSG_PLUGIN	16
/* \} */


/* ----- STRUCTURES ----- */


/*! Definition of a system message object.
 *  This object is used to display debug and error messages on screen.
 *  By en- or disbaling certain channels it is possible to hide e.g. debug messages for
 *  release software. 
 *  Only one single system messgae object can exist at a time.
 *  Use the SYSMSG_create function for creation of a system message object.
 */
typedef struct
{
	FONT *fntSys;		/*!< Pointer to font used for text display */
	TEXT *txtSys;		/*!< Pointer to text used for display */
	int iAllowedMode; /*!< Bitmask containing the allowed modes (SYSMSG_SHOW_xx) */

	var vBufferUsed;	/*!< Currently displayed text lines */
	var vBufferSize;	/*!< Maximum displayed text lines */
	var vUpdateTimer;	/*!< Timer for triggering updates of text display */	
	int iEnableLog;	/*!< 1: Log to file is enabled  0: Log to file is disabled */
	var vLogFileHndl;	/*!< Handle for log file */
}SYSMSG;


/* ----- EXTERNAL FUNCTIONS ----- */


/*! creates new System message object.
 *  default values are used: font ackfont.pcx, buffer size 10, layer 20
 */
void SYSMSG_create();

/*! creates new System message object.
 *  \param	pcFont      font filename
 *  \param	vBufferSize	size of buffer
 *  \param	vLayer      layer of TEXT object
 */
void SYSMSG_create(char* pcFont, var vBufferSize, var vLayer);

/*! Removes System message object from memory. 
 *  All referenced objects will be removed as well.
 */
void SYSMSG_remove();

/*! Show system messages.
 *  Appearance of system message object may be changed before by setting TEXT properties.
 */
void SYSMSG_show();

/*! Hide system messages.
 *  System message object is only hidden from screen, but is NOT deleted or released from memory!
 */
void SYSMSG_hide();

/*! Print system message to screen. (DEFAULT type)
 *  \param	pcMsg text message 
 */
void SYSMSG_print(char* pcMsg);

/*! Print system message to screen. (DEFAULT type)
 *  \param	strMsg text message 
 */
void SYSMSG_print(STRING* strMsg);

/*! Print system message to screen. 
 *  \param	iMode Allowed message mode (SYSMSG_SHOW_xx) 
 *  \param	pcMsg text message 
 */
void SYSMSG_print(int iMode, char* pcMsg);

/*! Print system message to screen. 
 *  \param	iMode Allowed message mode (SYSMSG_SHOW_xx) 
 *  \param	strMsg text message 
 */
void SYSMSG_print(int iMode, STRING* strMsg);

/*! Set message modes to be displayed. 
 *  Define, which message types (SYSMSG_SHOW_...) are shown 
 *  \param	iMode Allowed message modes, bitwise-or of SYSMSG_SHOW_xx 
 */ 
void SYSMSG_setMode(int iMode);

/*! Enable/disbale logging of system messages.
 *  Messages are logged to sysmsg.log 
 *  \param	iEnable 0(default) - don't log, any other value - perform log 
 */
void SYSMSG_logToFile(int iEnable);

/*! Set position of text window.
 *  \param	vX x Position on screen 
 *  \param	vY y Position on screen 
 */
void SYSMSG_setPos(var vX, var vY);

/*! Set scaling of text window.
 *  \param	vX x Scale value 
 *  \param	vY y Scale value 
 */
void SYSMSG_setScale(var vX, var vY);

/*! Set flags for text window.
 *  Flags can be taken from description of standard TEXT object.
 *  \param	vFlags Bitwise-ored A7 TEXT flags 
 */
void SYSMSG_setFlags(var vFlags);

/*! Get current status of sysmsg. 
 *  \return	0: sysmsg inactive 	1: sysmsg active 
 */
var SYSMSG_isActive();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


/*! \internal - Do not use! */
void SYSMSG__runTimer_loop();
/*! \internal - Do not use! */
void SYSMSG__update();

#include "sysmsg.c"

#endif
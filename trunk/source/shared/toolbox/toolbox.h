/*
 *******************************************************************************
 * toolbox.h
 * Creation date: 30.12.2009
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
 * Toolbox main include
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef TOOLBOX_H
#define TOOLBOX_H
/*! \mainpage Toolbox project - Main page
 *  Main include file for the toolbox project is toolbox.h.
 *  By setting defines before inclusion of this file, it is possible to enable 
 *  only the required modules. By default, no modules at all are included in order
 *  to keep compile time small. Pick the modules you need and enable them using following
 *  defines: 
 *
 *  - TOOLBOX_USE_SYSMSG\n		
 *    sysmsg.h:			System message module\n
 *
 *  - TOOLBOX_USE_ACKLIB\n
 *    acklib.h:			General purpose functions and variables\n
 *
 *  - TOOLBOX_USE_CONTROL\n
 *    control.h:        Key control setup module\n
 *
 *  - TOOLBOX_USE_CAMCTRL\n
 *    camctrl.h:			Camera module\n
 *
 *  - TOOLBOX_USE_INVENTORY\n
 *    invent.h:			Inventory module\n
 *
 *  - TOOLBOX_USE_LIST\n
 *    list.h:				Extendable list module\n
 *
 *  - TOOLBOX_USE_STATE\n
 *    state.h:				State manager module\n
 *
 *  - TOOLBOX_USE_XMLREADER\n
 *    xmlreader.h:		XML parser module\n
 *
 *  - TOOLBOX_USE_ANIMATE\n
 *    animate.h:			Animation module\n
 *
 *  - TOOLBOX_USE_ALL\n
 *  Simply use all features available (may slow down compile process)
 *
 *  It is also possible to include the header files of the toolbox modules directly.
 */

/*! \file 
 *  Main include file for the toolbox project.
 *  Please see \ref index for further instructions.
 */


/* ----- INCLUDES ----- */


/* must be evaluated before any include */
#ifdef TOOLBOX_USE_ALL
#define TOOLBOX_USE_SYSMSG
#define TOOLBOX_USE_ACKLIB
#define TOOLBOX_USE_CAMCTRL
#define TOOLBOX_USE_CONTROL
#define TOOLBOX_USE_INVENTORY
#define TOOLBOX_USE_LIST
#define TOOLBOX_USE_STATE
#define TOOLBOX_USE_XMLREADER
#define TOOLBOX_USE_ANIMATE
#endif

/* must be first include as it is only included on user request */
#ifdef TOOLBOX_USE_SYSMSG
#include "sysmsg\sysmsg.h"
#endif

#ifdef TOOLBOX_USE_ACKLIB
#include "acklib\acklib.h"
#endif

#ifdef TOOLBOX_USE_CAMCTRL
#include "camctrl\camctrl.h"
#endif

#ifdef TOOLBOX_USE_CONTROL
#include "control\control.h"
#endif

#ifdef TOOLBOX_USE_INVENTORY
#include "inventory\invent.h"
#endif

#ifdef TOOLBOX_USE_LIST
#include "list\list.h"
#endif

#ifdef TOOLBOX_USE_STATE
#include "state\state.h"
#endif

#ifdef TOOLBOX_USE_XMLREADER
#include "xmlreader\xmlreader.h"
#endif

#ifdef TOOLBOX_USE_ANIMATE
#include "animate\animate.h"
#endif

/* ----- DEFINITIONS ----- */


#define TOOLBOX_ACTIVE	/*!< This define can be evaluated to check if the toolbox project is included and active */


#endif
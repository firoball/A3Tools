#include <acknex.h>
#include <default.c>

#define PRAGMA_POINTER
#define PRAGMA_PATH "..\\shared\\a3sky"
#define PRAGMA_PATH "..\\shared"

#include "wm3load.h"


/* IMPORTANT NOTE!
 *
 * In order to get the right color palette, it is
 * necessary to copy the file palette.raw directly
 * to the script folder (where also this file is loacted).
 * Unfortunately A8 cannot load palettes during runtime,
 * so the palette needs to be put in place before starting
 * the script!
 * 
 * So if you get weird looking colors during script execution
 * you most likely forgot to copy palette.raw
 */
 
void main(void)
{
	/* wok - preconverted */
	STRING* strFile = str_create("..\\..\\preconverted\\wok\\forest3.wm3");

	/* you may use these lcoation strings if you convert to the predefined folders */	
	//STRING* strFile = str_create("..\\..\\dump\\tlol\\tlol.wm3");
	//STRING* strFile = str_create("..\\..\\dump\\wok\\forest3.wm3");
	//STRING* strFile = str_create("..\\..\\dump\\skaphander\\skaph.wm3");
	//STRING* strFile = str_create("..\\..\\dump\\vrdemo\\vrdemo.wm3");


	level_load(""); /* load empty level */
	WM3_load(strFile);
	ptr_remove(strFile);

	sun_light = 30; /* looks better - A3 levels were not made for sunlight */

	on_esc = NULL; /* disable default exit */
	/* from default.c */
	def_moveset();

	while(key_esc == 0)
		wait (1);
	
	WM3_unload();
	sys_exit("");
}
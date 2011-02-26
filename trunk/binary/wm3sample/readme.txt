WM3 loader sample
-----------------

[wm3sample.exe]

This is the binary version of the WM3 loader sample
application.

By default it opens and runs a preconverted version
of the World of Kandoria forest level.

For loading different levels, go to the source folder, 
then to "wm3load" and adjust the wm3 location string
in "wm3sample.c".
In the same folder the WM3 loader utility script is
located.

IMPORTANT:
In order to get the right color palette, it is
necessary to copy the file palette.raw directly
to the script folder (where also this file is loacted).
Unfortunately A8 cannot load palettes during runtime,
so the palette needs to be put in place before starting
the script!
 
So if you get weird looking colors during script execution
you most likely forgot to copy palette.raw


By default the World of Kandoria palette has been copied
to the binary/wm3sample folder.


Levels loaded with the WM3 loader run remarkably faster
than levels loaded by the map converter.
The reason is that the internal texture/shader achitecture
can be optimized for the wm3 file, but not so easily
during generation of the level mesh and objects.
Many level areas with sky textures may get slow in the
map converter, but run just fine when using the WM3
loader utility script.


Controls
--------

F5: change resolution
ESC: exit
WASD/arrow keys/Maus: move camera
PGUP/PGDN: tilt camera
POS1/END: adjust camera height
0: lock/unlock camera movement

Some demos only show a blue colored screen after start.
The reason is, that the original level was built further
away from the coordiante center.
Use arrow keys to turn around and locate the level,
then move towards it to see more.

A3 map converter
----------------

[a3conv.exe]

This folder contains a compiled version of the
A3 map converter.
Some sample config files are included.

In order to start a sample, run any of the
.bat files for different exampel levels.

The .bat files start the engine with -cfg xxx.ini
as parameter. This way a config file can be
specified.

Feel free to change the config files to load
different levels at different scales and export
WM3 with different file names.

If no config file is given via parameter, the
map converter will search for config.ini and run it
by default.

Always run a3conv.exe. Running a3convmap.exe might 
result in palette errors.

The conversion process may take a while. Just wait
a while before hastily shutting down the converter
via task manager!


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

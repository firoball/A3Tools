A3 Map Converter
----------------
1998.
Congratulations! You have purchased the conitec 3D GameStudio. 
This toolkit now allows you to create 3-D demos,
role playing, action, adventure or racing games without programming 
knowledge and to publish them subsequently without having to pay royalties 
if you should wish to do so.
In order to construct a game you have to create a script file (WDL) which 
will contain the 'source-code' for the game world with specifications 
concerning textures, regions, things, and actors. The level topograpy is 
contained in a second file (WMP) with the coordinates (vertices) of all objects. 
(Text taken from 3D Gamestudio manual)

2011.
Congratulations! You have downloaded the A3 map converter for 
Conitec 3D Gamestudio.
Finally it is possible to view levels created for the old raycaster engine in
a modern, mesh based 3D engine.

Doing so, may have different reasons, like curiousity, time travel, retro 
projects, checking out contest submissions, or simply boredom.
Personally, for me it was an interesting challenge with many hurdles to master,
and a learned a lot by continuously enhancing this project.

So, thanks for downloading and have fun with your personal virtual time travel.


Folder Structure
----------------

A3GAMES    - contains original A3 games/demos
|-SKAPHANDER (Skaphander Demo)
|-TLOL       (The Lord of Lightning)
|-VRDEMO     (Virtual Reality Demo)
|-WOK        (World of Kandoria Contest Version)
BINARY     - contains all executables
|-WM3SAMPLE - samples for preconverted A3 levels
|-A3CONV   - sample configurations for A3 WMP Converter
DUMP       - empty folder, can be used for own map conversions
PRECONVERTED
|-WOK      - preconverted version of World of Kandoria (used for WM3sample)
SOURCE     - source code (Lite-C)
|-A3CONV   - source for converting A3 WMP/WDL to .WM3
|-HELPERS  - some dirty little helpers for various things. Not directly used
|-MAKETRIS - source code of triangulation DLL
|-SHARED   - shared files/includes
|-WM3SAMPLE- example for .WM3 loader


Known issues:
-------------
- Due to some palette problem, it can happen that resized bitmaps show
wrong colors when a3convmap is called without previous calling of a3conv.
To avoid this, always run a3conv before running a3convmap.
a3conv automatically calls a3convmap.

- No animations are supported.

- Skies are only displayed simplified. This can cause wrong offset and
testure distortions

- advanced engine features like multiple texture sides and attach textures
are not supported by this version

- defines in the source WDL files are not evaluated. This may lead to warnings.


The future:
-----------
As this tool is only useful for a very small group of people and since it
was a learning project to improve my skills, I don't have further plans
with it.
If someone really wants to use it in order to redo some A3 game in A8, give
me a shot. I'm willing to further improve the converter to support a serious 
retro project.

License:
--------
Pick whatever you need - modify it, rewrite it and use it in any project - 
commercial or non commercial.
If you want to say thanks, give me credit. If you don't want to say thanks,
then simply don't.

A3 game demos are explicitly excluded from this license!
Triangulation source has its own license. Please check README in
source\maketris\original\


A3conv Credits:
---------------
Main programming: Robert Jäger (firoball)
A3 Sky shader: Christian Behrenberg (HeelX)
Triangulation Source: Atul Narkhede

The triangulation source is free to use for NON COMMERCIAL projects.


A3games Credits:
----------------
VRDemo: Property of oP Group Germany
Skaphander: Property of oP Group Germany
The Lord of Lightning: Property of Alexander Seifriz (Bluemamba)
World of Kandoria: Property of Robert Jäger (firoball)

None of the files contained in these games may be used in other projects 
without permission granted by the respective owner!



Always remember your origin!
-firoball

folder structure

A3GAMES    - contains original A3 games/demos
|-skaphander (Skaphander Demo)
|-tlol       (The Lord of Lightning)
|-vrdemo     (Virtual Reality Demo)
|-wok        (World of Kandoria Contest Version)
BINARY     - contains all executables
|-WM3LOAD  - samples for preconverted A3 levels
| |-skaphander
| |-tlol
| |-vrdemo
| |-wok
|-WMPCONV  - sample configurations for A3 WMP Converter
DUMP       - empty folder, can be used for own map conversions
PRECONVERTED
SOURCE     - source code (Lite-C)
|-MAKETRIS - source code of triangulation DLL
|-SHARED   - shared files/includes
|-WM3LOAD  - example for .WM3 loader
|-WMPCONV  - source for converting A3 WMP/WDL to .WM3


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
Main progeramming: Robert Jäger (firoball)
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


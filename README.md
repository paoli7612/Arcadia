#
<table width="100%">
 <tr>
  <td><img src="doc/loco.png" width="100px"></td>
  <td><h1>  The world of ARCADIA </h1></td>
   <td><img src="doc/loco.png" width="100px"></td>
  </tr>

 </table>

## - Install LOVE2d

- **WINDOWS**:
 Installation isn't required, LOVE is in love2d folder.
- **LINUX**:
```shell
  $ sudo add-apt-repository ppa:bartbes/love-stable
  $ sudo apt-get update
  $ sudo apt-get install love
 ```

## - Play

- **WINDOWS**:
  run run_win.bat
- LINUX:
  if you have love2d, run run_linx.sh

## - Game
- press i key to see inventory
- press q key to acion with another things (npc, cartel, doors...)

## SCREEN
<a href="screen"> Screen Folder </a>

# MAP_EDITOR - PYTHON
This simply program allow you to create or change all game map. All game map saved in maps folder. If you give this program a name of a exists map, the program allow you to change this. Else the program create a new map with this new name. [pygame is required]
## run
in map_editor folder there is main.py.
WINDOWS: use run_win.bat in map_editor folder for give name of map to create/change
LINUX: type `python main.py` in map_editor folder to see help of argparse

![alt text](doc/img/013.png)

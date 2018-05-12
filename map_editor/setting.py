from screeninfo import get_monitors

width = 0
for m in get_monitors():
    if width<m.width: width=m.width

class Setting:
    TITLE = "Map editor"
    TILE = TILE_X, TILE_Y = 40,25
    TILE_SIZE = width // 60
    WIDTH = TILE_X * TILE_SIZE
    HEIGHT = TILE_Y * TILE_SIZE
    SIZE = WIDTH, HEIGHT

    LUA_FORMAT = ".lua"
    IMAGE_FORMAT = ".png"
    JSON_FORMAT = ".json"


    TOOLBAR_X = TILE_SIZE * 19
    TOOLBAR_Y = HEIGHT + TILE_SIZE * 3


    class Colors:
        BLACK = (0,0,0)
        WHITE = (255,255,255)
        RED = (255,0,0)
        GREEN = (0,255,0)
        BLUE = (0,0,255)

    FONT_COLOR = Colors.WHITE
    FONT_COLOR_CHOICE = {True: Colors.GREEN, False: Colors.RED}

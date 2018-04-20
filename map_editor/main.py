import pygame, time, os
from setting import Setting

class Game:
    def __init__(self, argv):
        self.opt = Setting()
        self.name_map = argv[1]
        self.screen = pygame.display.set_mode((self.opt.SIZE))
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.path.dirname(__file__)
        self.path_maps = os.path.join(self.path, ".." , "src", "img")
        self.load_map(self.name_map)

    def load_map(self, name_map):
        print(os.path.join(self.path_maps, name_map) + self.opt.LUA_FORMAT)



# test


if __name__ == "__main__":
    import sys
    g = Game(sys.argv)
    time.sleep(2)

# now we start with "python main.py [map_name]"

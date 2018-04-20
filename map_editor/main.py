import pygame, time, os
from setting import Setting
from spritesheet import Spritesheet
from converter import Converter

class Program:
    def __init__(self, argv):
        self.opt = Setting()
        self.name_map = argv[1]
        self.screen = pygame.display.set_mode((self.opt.SIZE))
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.path.dirname(__file__)
        self.load_map()
        self.load_images()

    def load_images(self):
        self.path_img = os.path.join(self.path, ".." , "src", "img")
        self.images = Spritesheet(self)

    def load_map(self):
        self.path_maps = os.path.join(self.path, ".." , "src", "maps", self.name_map + self.opt.LUA_FORMAT)
        self.converter = Converter(self)


# test
if __name__ == "__main__":
    import sys
    g = Program(sys.argv)
    time.sleep(2)

# now we start with "python main.py [map_name]"

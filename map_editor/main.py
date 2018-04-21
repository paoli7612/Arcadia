import pygame, time, os
from setting import Setting
from spritesheet import Spritesheet
from converter import Converter
from map import Map
from builder import Builder
from argparser import Argparser

class Program:
    def __init__(self,arg):
        self.opt = Setting()
        self.name_map = arg.name_map
        self.screen = pygame.display.set_mode((self.opt.SIZE))
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.path.dirname(__file__)
        self.path_img = os.path.join(self.path, ".." , "src", "img")
        self.images = Spritesheet(self)
        self.path_maps = os.path.join(self.path, ".." , "src", "maps", self.name_map + self.opt.LUA_FORMAT)
        if not os.path.exists(self.path_maps):
            print("creator map isn't ready")
        else:
            self.converter = Converter(self)
            self.map = Map(self)
            self.builder = Builder(self)
            raw_input()

# test
if __name__ == "__main__":
    a = Argparser()
    if a.start:
        g = Program(a)


# now we start with "python main.py [map_name]"

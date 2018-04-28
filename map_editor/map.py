import pygame
from sprites import TYPES_NAME_SECONDARY

class Map:
    def __init__(self, program, matrix=False):
        self.program = program
        self.matrix = matrix
        if not matrix: self.convert_matrix()
        self.draw_matrix()

    def convert_matrix(self):
        self.matrix = list()
        x,y,row = 0,0,list()
        for p in self.program.converter.data:
            row.append(int(p))
            if x == self.program.opt.TILE_X-1:
                self.matrix.append(row)
                x, y, row = 0, y+1, list()
            else: x += 1
        self.draw_matrix()

    def draw_matrix(self):
        self.screen = pygame.Surface(self.program.opt.SIZE)
        prop = self.program.converter.properties
        for y,row in enumerate(self.matrix):
            for x,cell in enumerate(row):
                if cell in list(range(1,20)):   # WALL
                    for element in prop["wall"]:
                        if element["id"] == cell: self.screen.blit(self.program.images.images["basictiles"]["wall"][element["code"]], (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))
                if cell in list(range(20,40)):   # FLOOR
                    for element in prop["floor"]:
                        if element["id"] == cell: self.screen.blit(self.program.images.images["basictiles"]["floor"][element["code"]], (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

        for type_name in TYPES_NAME_SECONDARY:
            for element in prop[type_name]:
                self.screen.blit(self.program.images.images["basictiles"][type_name][element["code"]],
                (element["coord_x"]*self.program.opt.TILE_SIZE, element["coord_y"]*self.program.opt.TILE_SIZE))

import pygame
from sprites import TYPES_NAME
class Map:
    def __init__(self, program, matrix=False):
        self.program = program
        self.matrix = matrix
        self.draw_matrix()

    def draw_matrix(self):
        self.screen = pygame.Surface(self.program.opt.SIZE)
        prop = self.program.converter.properties

        for type_name in TYPES_NAME:
            for element in prop[type_name]:
                #try:
                print(element)
                print(type_name,element["code"])
                self.screen.blit(self.program.images.images[type_name][element["code"]],
                (element["coord_x"]*self.program.opt.TILE_SIZE, element["coord_y"]*self.program.opt.TILE_SIZE))
                #except: print("Image without CODE")

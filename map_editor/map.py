import pygame
class Map:
    def __init__(self, program, matrix=False):
        self.program = program
        self.matrix = matrix
        if not matrix: self.convert_matrix()
        self.load_matrix()

    def convert_matrix(self):
        self.matrix = list()
        x,y = 0,0
        row = list()
        for p in self.program.converter.data:
            row.append(int(p))
            if x == self.program.opt.TILE_X-1:
                x,y = 0, y+1
                self.matrix.append(row)
                row = list()
            else: x += 1
        self.load_matrix()

    def load_matrix(self):
        for y,row in enumerate(self.matrix):
            for x,cell in enumerate(row):
                if cell in list(range(1,20)):   # WALL
                    for element in self.program.converter.properties["walls"]:
                        if element["id"] == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["wall"][element["color"]][element["type"]],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

                if cell in list(range(20,40)):   # FLOOR
                    for element in self.program.converter.properties["floors"]:
                        if element["id"] == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["floor"][element["bloke"]][element["type"]],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

                if cell in list(range(40,60)):   # DOORS
                    for element in self.program.converter.properties["doors"]:
                        if element["id"] == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["door"][element["type"]],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

        #load others
        for element in self.program.converter.properties["decor"]:  # DECOR
            self.program.screen.blit(self.program.images.images["basictiles"]["decor"][element["type"]],
            (element["coord_x"]*self.program.opt.TILE_SIZE, element["coord_y"]*self.program.opt.TILE_SIZE))
        for element in self.program.converter.properties["torch"]:  # TORCH
            self.program.screen.blit(self.program.images.images["things"]["torch"][element["color"]],
            (element["coord_x"]*self.program.opt.TILE_SIZE, element["coord_y"]*self.program.opt.TILE_SIZE))
        for element in self.program.converter.properties["npc"]:  # TORCH
            self.program.screen.blit(self.program.images.images["characters"][element["type"]],
            (element["coord_x"]*self.program.opt.TILE_SIZE, element["coord_y"]*self.program.opt.TILE_SIZE))


        pygame.display.flip()

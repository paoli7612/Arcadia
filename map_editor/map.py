import pygame
class Map:
    def __init__(self, program):
        self.program = program

        # compose matrix
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


        for y,row in enumerate(self.matrix):
            for x,cell in enumerate(row):
                if cell in list(range(1,20)):   # WALL
                    for id, color, type in self.program.converter.properties["walls"]:
                        id = id.split("=")[-1]
                        color = color.split("=")[-1].split("\"")[1]
                        type = int(type.split("=")[-1])-1
                        if int(id) == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["wall"][color][type],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

                if cell in list(range(20,40)):   # FLOOR
                    for id, bloke, type in self.program.converter.properties["floors"]:
                        id = id.split("=")[-1]
                        bloke = bloke.split("=")[-1].split("\"")[1]
                        type = int(type.split("=")[-1])-1
                        if int(id) == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["floor"][bloke][type],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

                if cell in list(range(40,60)):   # DOORS
                    for id, dest, coord_x, coord_y, type in self.program.converter.properties["doors"]:
                        print(id, dest, coord_x, coord_y,type)
                        id = id.split("=")[-1]
                        dest = dest.split("=")[-1].split("\"")[1]
                        coord_x = int(coord_x.split("=")[1])
                        coord_y = int(coord_y.split("=")[1])
                        type = int(type.split("=")[-1])-1
                        print(id, dest, coord_x, coord_y,type)
                        if int(id) == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["door"][type],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))



        pygame.display.flip()

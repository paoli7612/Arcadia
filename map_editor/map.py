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
                        print(id,color,type)
                        id = id.split("=")[-1]
                        color = color.split("=")[-1].split("\"")[1]
                        type = int(type.split("=")[-1])-1
                        print(id,color,type)
                        if int(id) == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["wall"][color][type],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))

                if cell in list(range(20,40)):   # FLOOR
                    for id, bloke, type in self.program.converter.properties["floors"]:
                        print(id,bloke,type)
                        id = id.split("=")[-1]
                        bloke = bloke.split("=")[-1].split("\"")[1]
                        type = int(type.split("=")[-1])-1
                        print(id,color,type)
                        if int(id) == cell:
                            self.program.screen.blit(self.program.images.images["basictiles"]["floor"][bloke][type],
                            (x*self.program.opt.TILE_SIZE, y*self.program.opt.TILE_SIZE))





        pygame.display.flip()

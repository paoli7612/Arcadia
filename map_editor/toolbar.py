import pygame
from sprites import TYPES_NAME_PRIMARY, TYPES_NAME_SECONDARY

class Toolbar:
    def __init__(self, program):
        self.program = program
        self.opt = program.opt
        self.screen = pygame.Surface((self.opt.TOOLBAR_X,self.opt.TOOLBAR_Y))
        self.reset_screen()

    def reset_screen(self):
        self.screen.fill(self.opt.Colors.BLUE)
        prop = self.program.converter.properties
        images = self.program.images.images

        # PRIMARY
        for x,type_name in enumerate(TYPES_NAME_PRIMARY):
            for y,element in enumerate(prop[type_name]):
                image = images["basictiles"][type_name][element["code"]]
                self.screen.blit(image, (x*self.opt.TILE_SIZE,y*self.opt.TILE_SIZE))

        # SECONDARY
        px = 2
        tns = TYPES_NAME_SECONDARY
        del tns[tns.index("npc")]
        for x,type_name in enumerate(tns):
            ay = 0
            for y,image in enumerate(images["basictiles"][type_name].values()):
                if y-ay > self.opt.TILE_Y-1:
                    ay += self.opt.TILE_X+1
                    px += 1
                self.screen.blit(image, ((x+px)*self.opt.TILE_SIZE,(y-ay)*self.opt.TILE_SIZE))

        #for x,image in enumerate(images["characters"]["npc"].values()):
        #    self.screen.blit(image, ((x-ay)*self.opt.TILE_SIZE,(y+1+px)*self.opt.TILE_SIZE))


    def update():
        pass

    def draw(self, screen):
        screen.blit(self.screen,(self.opt.WIDTH+self.opt.TILE_SIZE,0))

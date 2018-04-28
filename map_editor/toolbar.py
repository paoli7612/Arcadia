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
        for y,type_name in enumerate(TYPES_NAME_PRIMARY):
            for x,element in enumerate(prop[type_name]):
                image = images["basictiles"][type_name][element["code"]]
                self.screen.blit(image, (x*self.opt.TILE_SIZE,y*self.opt.TILE_SIZE))

        # SECONDARY
        py = 2
        tns = TYPES_NAME_SECONDARY
        del tns[tns.index("npc")]
        for y,type_name in enumerate(tns):
            ax = 0
            for x,image in enumerate(images["basictiles"][type_name].values()):
                if x-ax > self.opt.TILE_X-2:
                    ax += self.opt.TILE_X+2
                    py += 1
                self.screen.blit(image, ((x-ax)*self.opt.TILE_SIZE,(y+py)*self.opt.TILE_SIZE))

        for x,image in enumerate(images["characters"]["npc"].values()):
            self.screen.blit(image, ((x-ax)*self.opt.TILE_SIZE,(y+1+py)*self.opt.TILE_SIZE))


    def update():
        pass

    def draw(self, screen):
        screen.blit(self.screen,( 0,self.opt.HEIGHT+self.opt.TILE_SIZE))

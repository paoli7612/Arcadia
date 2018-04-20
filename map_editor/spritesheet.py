import pygame, os


class Images:
    def __init__(self, image_path):
        self.image = pygame.image.load(image_path).convert()

    def get_image(self, x, y):
        image = pygame.Surface((16, 16))
        image.blit(self.image, (0, 0), (x*16, y*16, 16, 16))
        image = pygame.transform.scale(image, (16 * 2, 16 * 2))
        image.set_colorkey((0,0,0))
        return image

class Spritesheet:
    def __init__(self, program):
        self.program = program
        self.images = dict()
        self.basictiles = Images(os.path.join(self.program.path_img,"basictiles" + self.program.opt.IMAGE_FORMAT))
        self.images["basictiles"] = dict()
        get_image = self.basictiles.get_image
        # WALL
        self.images["basictiles"]["wall"] = dict()
        self.images["basictiles"]["wall"]["blue"] = [get_image(0,0),get_image(1,0),get_image(2,0),get_image(3,0)]
        self.images["basictiles"]["wall"]["red"] = [get_image(4,0),get_image(5,0),get_image(6,0),get_image(7,0)]
        self.images["basictiles"]["wall"]["stone"] = [get_image(0,10),get_image(1,10)]
        self.images["basictiles"]["wall"]["wood"] = [get_image(0,11),get_image(1,11)]
        # FLOOR
        self.images["basictiles"]["floor"] = dict()
        self.images["basictiles"]["floor"]["grass"] = [get_image(0,8),get_image(1,8),get_image(3,1),get_image(4,1)]
        self.images["basictiles"]["floor"]["wood"] = [get_image(0,1),get_image(0,2),get_image(2,10),get_image(2,11),get_image(0,9)]
        self.images["basictiles"]["floor"]["ice"] = [get_image(5,3),get_image(5,4)]
        self.images["basictiles"]["floor"]["stone"] = [get_image(6,1),get_image(1,9)]
        self.images["basictiles"]["floor"]["carpet"] = [get_image(1,2)]
        self.images["basictiles"]["floor"]["color"] = [get_image(1,1),get_image(3,1)]
        # DECOR
        self.images["basictiles"]["decor"] = dict()
        self.images["basictiles"]["decor"]["shelf"] = get_image(7,6)
        self.images["basictiles"]["decor"]["chest"] = get_image(4,4)
        self.images["basictiles"]["decor"]["table"] = get_image(6,6)
        self.images["basictiles"]["decor"]["urn"] = get_image(3,3)
        self.images["basictiles"]["decor"]["bed_down"] = get_image(5,6)
        self.images["basictiles"]["decor"]["bed_up"] = get_image(5,5)
        self.images["basictiles"]["decor"]["throne"] = get_image(6,5)
        self.images["basictiles"]["decor"]["statue"] = get_image(7,5)
        self.images["basictiles"]["decor"]["tower"] = get_image(7,5)
        self.images["basictiles"]["decor"]["statue"] = get_image(7,5)
        self.images["basictiles"]["decor"]["tag_armor"] = get_image(6,8)
        self.images["basictiles"]["decor"]["tag_magic"] = get_image(7,8)
        self.images["basictiles"]["decor"]["tag_weapon"] = get_image(6,9)
        self.images["basictiles"]["decor"]["tag_potion"] = get_image(7,9)

        self.characters = Images(os.path.join(self.program.path_img,"characters" + self.program.opt.IMAGE_FORMAT))
        self.things = Images(os.path.join(self.program.path_img,"things" + self.program.opt.IMAGE_FORMAT))

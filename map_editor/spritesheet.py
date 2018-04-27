import pygame, os, json

class Images:
    def __init__(self, image_path):
        self.image = pygame.image.load(image_path).convert()

    def get_image(self, x, y):
        image = pygame.Surface((16, 16))
        image.blit(self.image, (0, 0), (x*16, y*16, 16, 16))
        image = pygame.transform.scale(image, (22, 22))
        image.set_colorkey((0,0,0))
        return image

class Spritesheet:
    def __init__(self, program):
        self.program = program
        self.images = dict()
# BASICTILES_____________________________________________________________________________________________________
        self.basictiles = Images(os.path.join(self.program.path_img,"basictiles" + self.program.opt.IMAGE_FORMAT))
        self.images["basictiles"] = dict()
        get_image = self.basictiles.get_image

        coords = json.load(open(os.path.join(self.program.path_img,"basictiles" + self.program.opt.JSON_FORMAT)))
        for item_type, item_coords in coords.items():
            self.images["basictiles"][item_type] = dict()
            for code,coord in item_coords.items():
                if code == "_cumment": continue
                self.images["basictiles"][item_type][code] = get_image(coord["x"],coord["y"])
# CHARACTERS_____________________________________________________________________________________________________
        get_image = Images(os.path.join(self.program.path_img,"characters" + self.program.opt.IMAGE_FORMAT)).get_image

        # CHARACTERS
        self.images["characters"] = dict()
        self.images["characters"]["man"] = get_image(1,0)
        self.images["characters"]["boy"] = get_image(4,0)
        self.images["characters"]["brown_girl"] = get_image(7,0)
        self.images["characters"]["alien"] = get_image(10,0)
        self.images["characters"]["slime"] = get_image(1,4)
        self.images["characters"]["bat"] = get_image(4,4)
        self.images["characters"]["ghost_white"] = get_image(7,4)
        self.images["characters"]["spider"] = get_image(10,4)
        self.images["characters"]["libri"] = get_image(1,8)
        self.images["characters"]["barra"] = get_image(4,8)
        self.images["characters"]["blonde_girl"] = get_image(7,8)
        self.images["characters"]["red_girl"] = get_image(10,8)
        self.images["characters"]["ghost_yellow"] = get_image(1,12)
        self.images["characters"]["ghost_red"] = get_image(4,12)
        self.images["characters"]["ghost_blue"] = get_image(7,12)
        self.images["characters"]["ghost_green"] = get_image(10,12)

        get_image = Images(os.path.join(self.program.path_img,"specials" + self.program.opt.IMAGE_FORMAT)).get_image
        self.images["characters"]["king"] = get_image(0,0)
        self.images["characters"]["queen"] = get_image(1,0)
        self.images["characters"]["seller_blue"] = get_image(2,0)
        self.images["characters"]["seller_blueHair"] = get_image(3,0)
        self.images["characters"]["seller_red"] = get_image(4,0)
        self.images["characters"]["seller_redHair"] = get_image(5,0)
        self.images["characters"]["seller_green"] = get_image(2,1)
        self.images["characters"]["seller_greenHair"] = get_image(3,1)
        self.images["characters"]["seller_yellow"] = get_image(4,1)
        self.images["characters"]["seller_yellowHair"] = get_image(5,1)

# THINGS_____________________________________________________________________________________________________
        get_image = Images(os.path.join(self.program.path_img,"things" + self.program.opt.IMAGE_FORMAT)).get_image

        #TORCH
        self.images["things"] = dict()
        self.images["things"]["torch"] = dict()
        self.images["things"]["torch"]["yellow"] = get_image(0,4)
        self.images["things"]["torch"]["blue"] = get_image(0,5)
        self.images["things"]["torch"]["red"] = get_image(0,6)
        self.images["things"]["torch"]["green"] = get_image(0,7)

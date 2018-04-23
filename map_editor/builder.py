import template

class Builder:
    def __init__(self,program):
        self.program = program
        if self.program.create: self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"w")
        f.write(template.empty %self.program.name_map)

    def save(self):
        data = str()
        for y in self.program.map.matrix:
            for x in y:
                if x < 10: x = "0" + str(x)
                data+=",%s"%str(x)
            data+="\n\t\t\t\t\t\t"
        data = data[1:] # remove first ","

        down = "\n\t\t\t\t\t\t\t\t\t\t"
        walls, floors, doors, npcs, decors, torchs, cartels = str(),str(),str(),str(),str(),str(),str()

        props = self.program.converter.properties
        for wall in props: walls.append((template.walls %(wall["id"],wall["color"],wall["type"]+1)) + down)
        for floor in props: floors.append((template.floors %(floor["id"],floor["bloke"],floor["type"]+1)) + down)
        for door in props: doors.append((template.doors %(door["id"],door["dest"],door["coord_x"],door["coord_y"],door["type"]+1)) + down)
        for npc in props: npcs += (template.npc %(npc["type"],npc["coord_x"],npc["coord_y"],npc["offset_x"],npc["offset_y"])) + down
        for decor in props: decors += (template.decor %(decor["type"],decor["coord_x"],decor["coord_y"])) + down
        for torch in props: torchs += (template.torch %(torch["color"],torch["coord_x"],torch["coord_y"])) + down
        for cartel in props: cartels += (template.cartel %(cartel["text"],cartel["coord_x"],cartel["coord_y"])) + down

        f = open(self.program.path_maps, "w")
        f.write(template.to_fill %(self.program.name_map, walls, floors, doors, npcs, decors, torchs, cartels))
        f.close()

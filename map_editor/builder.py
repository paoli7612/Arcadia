import template

class Builder:
    def __init__(self,program):
        self.program = program
        if self.program.create: self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"w")
        f.write(template.empty %self.program.name_map)

    def save(self):
        down = "\n\t\t\t\t\t\t\t\t\t\t"
        walls, floors, doors, npcs, decors, torchs, cartels, waters = str(),str(),str(),str(),str(),str(),str(),str()

        props = self.program.converter.properties

        for wall in props["wall"]: walls += str(wall) + down
        for floor in props["floor"]: floors += str(floor) + down
        for door in props["door"]: doors += str(door) + down
        for npc in props["npc"]: npcs += str(npc) + down
        for decor in props["decor"]: decors += str(decor) + down
        for torch in props["torch"]: torchs += str(torch) + down
        for cartel in props["cartel"]: cartels += str(cartel) + down
        for water in props["water"]: waters += str(water) + down

        f = open(self.program.path_maps, "w")
        f.write(template.to_fill %(self.program.name_map, walls, floors, doors, npcs, decors, torchs, cartels, waters))
        f.close()

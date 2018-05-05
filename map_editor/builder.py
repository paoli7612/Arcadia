import template
from sprites import TYPES_NAME
class Builder:
    def __init__(self,program):
        self.program = program
        if self.program.create: self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"w")
        f.write(template.empty %self.program.name_map)

    def save(self):
        down = "\n\t\t\t\t\t\t\t\t\t\t"
        props = self.program.converter.properties
        strings = dict()
        for type in TYPES_NAME:
            strings[type] = str()
            for element in props[type]:
                strings[type] += str(element) + down

        f = open(self.program.path_maps, "w")
        f.write(template.to_fill %(self.program.name_map, *strings.values()))
        f.close()

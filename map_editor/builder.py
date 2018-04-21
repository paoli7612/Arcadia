from template import template

class Builder:
    def __init__(self,program):
        self.program = program
        self.write()

    def write(self):
        f = open(self.program.path_maps,"a")
        f.write(template %self.program.name_map)

import os, re
from argparser import Argparser

class Program:
    def __init__(self, argv):
        self.sprites_list = list()
        self.path = os.path.dirname(__file__)
        name_file = argv.json_name + ".json"
        self.json_path = os.path.join(self.path, "..", "src", "img", name_file)
        self.json_text = self.get_text(self.json_path)
        self.start()

    def start(self):
        for i in re.findall('"[A-Za-z]*[0-9][0-9]+"', self.json_text):
            id = i.replace('"','')
            id = int(id)
            try:
                if id  in self.sprites_list:
                    self.sprites_list.append(id_1 + 1)
                    id_1 = id_1 + 1
                    print(id_1)
                else:
                    id_1 = id
                    self.sprites_list.append(id)
            except: pass
        print(self.sprites_list)

    def get_text(self,file_name):
        string = str()
        for row in open(file_name, "r"):
            string += row.strip()
        return string

if __name__ == "__main__":
    a = Argparser()
    p = Program(a)

import sys, os

class Argparser:
    def __init__(self):
        if len(sys.argv) == 2:
            self.name_map = sys.argv[1]
        else:
            for map in os.listdir(os.path.join(os.path.dirname(__file__), ".." , "src", "maps")):
                print('\t' + map.split('.lua')[0])
            self.name_map = input("Inserire il nome della mappa\n-> ")

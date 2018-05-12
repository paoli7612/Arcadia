import sys

description = """
        MAP EDITOR
        This simply program allow you to create or change
        all game map. All game map saved in maps folder.
        If you give this program a name of a exists map, the program
        allow you to change this. Else the program create a new map
        with this new name.

        Key S to save
        Key D to resize
"""
class Argparser:
    def __init__(self):
        if len(sys.argv) == 2:
            self.name_map = sys.argv[1]
        else:
            print(description)
            self.name_map = input("Inserire il nome della mappa\n-> ")

import sys
import argparse

description = """
        MAP EDITOR
        This simply program allow you to create or change
        all game map. All game map saved in maps folder.
        If you give this program a name of a exists map, the program
        allow you to change this. Else the program create a new map
        with this new name.
"""
class Argparser:
    def __init__(self):
        self.start = True
        self.parser = argparse.ArgumentParser(description=description)
        self.parser.add_argument("map name", metavar="NAME_MAP", type=str,
                                    help="the name of the map")
        self.args = self.parser.parse_args()
        dict = vars(self.args)
        self.name_map = dict["map name"]

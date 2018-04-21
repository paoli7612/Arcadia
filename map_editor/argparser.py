import sys
import argparse

description = """
        MAP EDITOR
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

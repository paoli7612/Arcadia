import sys
import argparse

description = """
        MAP EDITOR


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('integers', metavar='N', type=int, nargs='+',
                    help='an integer for the accumulator')
parser.add_argument('--sum', dest='accumulate', action='store_const',
                    const=sum, default=max,
                    help='sum the integers (default: find the max)')

args = parser.parse_args()
print(args.accumulate(args.integers))
"""
class Argparser:
    def __init__(self):
        self.start = True
        self.parser = argparse.ArgumentParser(description=description)
        self.parser.add_argument("map mode", metavar="MODE_MAP", type=str,
                                    help="mode of use map (-n NEW, -c CHANGE)")
        self.parser.add_argument("map name", metavar="NAME_MAP", type=str,
                                    help="the name of the map")
        self.args = self.parser.parse_args()
        self.name_map = vars(self.args)["map name"]
        self.mode_map = vars(self.args)["map mode"]

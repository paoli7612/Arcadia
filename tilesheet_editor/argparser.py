import sys
import argparse

description = """
        TILESHEET EDITOR

"""
class Argparser:
    def __init__(self):
        self.start = True
        self.parser = argparse.ArgumentParser(description=description)
        self.parser.add_argument("data name", metavar="DATA_NAME", type=str,
                                    help="the name of the file json")
        self.args = self.parser.parse_args()
        dict = vars(self.args)
        self.json_name = dict["data name"]

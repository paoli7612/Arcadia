empty ="""return {
    	name = "%s",
    	properties={
    			wall={
    			},
    			floor={
    			},
    			door={
    			},
    			npc={
                },
    			decor={
                },
    			torch={
    			},
    			cartel={
                }
                water={
                },
                lever={

                },
                chest={

                }
    		}
    	}
"""

to_fill ="""return {
    	name = "%s",
    	properties={
    			wall={
                    %s
    			},
    			floor={
                    %s
    			},
    			door={
                    %s
    			},
    			npc={
                    %s
                },
    			decor={
                    %s
                },
    			torch={
                    %s
    			},
    			cartel={
                    %s
                },
                water={
                    %s
                },
                lever={
                    %s
                },
                chest={
                    %s
                }

    		}
    	}
"""


wall = "{code = \"%s\", coord_x = %d, coord_y = %d},"
floor = "{code = \"%s\", coord_x = %d, coord_y = %d},"
door = "{dest = \"%s\", code = \"%s\", coord_x = %d, coord_y = %d, dest_x = %d, dest_y = %d, id = %d},"
npc = "{code = \"%s\", coord_x = %d, coord_y = %d, allow_x = %d, allow_y = %d, nickname = \"%s\"},"
decor = "{code = \"%s\", coord_x = %d, coord_y = %d},"
torch = "{code = \"%s\", coord_x = %d, coord_y = %d},"
cartel = "{text = \"%s\", code = \"%s\", coord_x = %d, coord_y = %d},"
water = "{code = \"%s\", coord_x = %d, coord_y = %d},"
lever = "{datasheet = \"%s\", code = \"%s\", coord_x = %d, coord_y = %d}"
chest = "{datasheet = \"%s\", code = \"%s\", coord_x = %d, coord_y = %d}"

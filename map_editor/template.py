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
                }

    		}
    	}
"""


wall = "{code = \"%s\", coord_x = %d, coord_y = %d},"
floor = "{code = \"%s\", coord_x = %d, coord_y = %d},"
door = "{dest = \"%s\", code = \"%s\", coord_x = %d, coord_y = %d, dest_x = %d, dest_y = %d},"
npc = "{code = \"%s\", coord_x = %d, coord_y = %d, allow_x = %d, allow_y = %d, nickname = \"%s\"},"
decor = "{code = \"%s\", coord_x = %d, coord_y = %d},"
torch = "{code = \"%s\", coord_x = %d, coord_y = %d},"
cartel = "{text = \"%s\", code = \"%s\", coord_x = %d, coord_y = %d},"
water = "{code = \"%s\", coord_x = %d, coord_y = %d},"

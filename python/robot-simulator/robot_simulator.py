# Globals for the bearings
# Change the values as you see fit

EAST = (1, 0)
NORTH = (0, 1)
WEST = (-1, 0) 
SOUTH = (0, -1) 


class Robot(object):
    def __init__(self, bearing=NORTH, x=0, y=0):
        self.bearing = bearing
        self.coordinates = (x, y)

    def bearing(self):
        return self.bearing

    def turn_right(self):
        self._turn(1)

    def turn_left(self):
        self._turn(-1)

    def advance(self):
        x, y, dx, dy = *self.coordinates, *self.bearing
        self.coordinates = (x + dx, y + dy)

    def simulate(self, instructions):
        ops = {"L": self.turn_left,
               "R": self.turn_right,
               "A": self.advance}
        for i in instructions:
            ops[i]()

    def _turn(self, num):
        dirs = [NORTH, EAST, SOUTH, WEST]
        self.bearing = dirs[(dirs.index(self.bearing) + num) % 4]


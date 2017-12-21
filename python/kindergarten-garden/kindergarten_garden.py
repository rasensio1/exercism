default_students = list("ABCDEFGHIJKL")
plants = {"G": "Grass", "C": "Clover", "R": "Radishes", "V": "Violets"}

class Garden(object):
    def __init__(self, diagram, students=None):
        self.students  = "".join([s[0] for s in 
            sorted((students or default_students))])

        top, bottom = diagram.split("\n")
        self.chunks = [top[i:i+2] + bottom[i:i+2] for i in range(0, len(top), 2)]

    def plants(self, name):
        lets = self.chunks[self.students.index(name[0])]
        return [plants[let] for let in lets]

from collections import defaultdict

class School(object):
    def __init__(self, name):
        self.students = defaultdict(set)

    def add(self, name, n):
        self.students[n].add(name)

    def grade(self, n):
        return tuple(sorted(self.students[n]))

    def sort(self):
        return ((g, self.grade(g)) for g in sorted(self.students.keys()))

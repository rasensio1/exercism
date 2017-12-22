from collections import defaultdict

class School(object):
    def __init__(self, name):
        self.students = defaultdict(set)

    def grade(self, n):
        return self.students[n]

    def add(self, name, n):
        self.students[n].add(name)

    def sort(self):
        return ((grade, tuple(sorted(students))) for grade, students in
                sorted(self.students.items()))

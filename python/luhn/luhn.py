import re

class Luhn(object):
    def __init__(self, num):
        self.clean = num.replace(" ", "")

    def is_valid(self):
        if any([self.shorter_than_two_chars(self.clean),
                self.contains_non_digits(self.clean)]):
            return False

        return self.divis_by_10(self.clean)

    def divis_by_10(self, nums):
        return sum(self.transform_nums(nums)) % 10 == 0

    def transform_nums(self, nums):
        return [self.double_or_nothing(idx, l) for idx, l in enumerate(self.clean[::-1])]

    def double_or_nothing(self, idx, num):
        return self.double_flat(int(num)) if idx % 2 == 1 else int(num)

    @staticmethod
    def contains_non_digits(string):
        return re.match(r".*[\D].*", string)

    @staticmethod
    def shorter_than_two_chars(string):
        return len(string) < 2

    @staticmethod
    def double_flat(num):
        mult = num * 2
        return mult if mult < 9 else mult - 9

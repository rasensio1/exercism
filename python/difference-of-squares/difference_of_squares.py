from functools import reduce

def square_of_sum(n):
    return ((n**2 + n) / 2) ** 2

def sum_of_squares(n):
    return reduce(lambda x,y: x + y**2, range(1, (n + 1)))

def difference(n):
    return square_of_sum(n) - sum_of_squares(n)

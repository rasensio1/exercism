from functools import reduce

def sum_of_multiples(limit, multiples):
    return sum(reduce(lambda x,y: x.union(y),
                      [set(range(0, limit, m)) for m in multiples], set()))

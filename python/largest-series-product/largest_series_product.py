from functools import reduce 

def largest_product(series, size):
    if size == 0:
        return 1

    def product(coll): return reduce(lambda x,y: x*y, coll)
    return max(map(lambda coll: product(coll), slices(series, size)))


def slices(series, length):
    if length not in range(1, len(series) + 1):
        raise ValueError("Invalid length")
    end_len = len(series) - length + 1
    return [list(map(int, series[i:i+length])) for i in range(end_len)]

    

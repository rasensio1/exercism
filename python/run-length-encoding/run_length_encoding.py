from itertools import groupby
import re

def return_empty(f):
    def wrapper(string):
        if not string:
            return string
        else:
            return f(string)
    return wrapper


@return_empty
def decode(string):
    return "".join(map(expand, re.findall(r'([0-9]*[a-zA-Z\s]{1})', string)))

@return_empty
def encode(string):
    return "".join(map(enc_from_group, groupby(string)))

def expand(grp):
    if len(grp) == 1:
        return grp
    else:
        return grp[-1] * int(grp[:-1])

def enc_from_group(grp):
    size = len(list(grp[1]))
    let = grp[0]
    if size == 1:
        return let
    else:
        return str(size) + let


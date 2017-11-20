from itertools import groupby
import re

def decode(string):
    return make_str(expand, re.findall(r'(\d*)([a-zA-Z\s])', string))

def encode(string):
    return make_str(enc_group, groupby(string))

def expand(grp):
    return grp[1] * int((grp[0] or 1))

def enc_group(grp):
    size, let  = len(list(grp[1])), grp[0]
    return let if size == 1 else str(size) + let

def make_str(f, group):
    return "".join(map(f, group))


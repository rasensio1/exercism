import re

def abbreviate(words):
    splits = re.split(r'[\s-]', words.upper())
    return "".join((word[0] for word in splits))

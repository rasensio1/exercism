import string
LETS = string.ascii_lowercase

def rotate(text, key):
    return "".join([new_char(ch, key) for ch in text])

def new_char(ch, key):
    if not ch.isalpha():
        return ch
    rot = LETS[(LETS.index(ch.lower()) + key) % 26]
    return rot.upper() if ch.isupper() else rot


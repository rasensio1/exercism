import string

lets = string.ascii_lowercase
table = str.maketrans(lets, lets[::-1], " .,")

def encode(plain_text):
    compressed = plain_text.lower().translate(table)
    return " ".join([compressed[i:i+5] for i in range(0, len(compressed), 5)])

def decode(ciphered_text):
    return ciphered_text.translate(table)

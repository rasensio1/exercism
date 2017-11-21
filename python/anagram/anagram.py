from collections import Counter

def detect_anagrams(word, candidates):
    return [w for w in candidates if is_anagram(word.lower(), w.lower())]

def is_anagram(word, can):
    if word == can:
        return False 
    else: 
        return Counter(word) == Counter(can)


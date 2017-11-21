def detect_anagrams(word, candidates):
    w = word.lower()
    is_ana = lambda c: c != w and sorted(w) == sorted(c)
    return [c for c in candidates if is_ana(c.lower())]


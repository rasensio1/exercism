def sieve(limit):
    if limit < 2:
        return []

    seive = [2] + list(range(3, limit +1, 2))
    i = 1
    while i < len(seive):
        n = seive[i]
        j = i + 1
        while j < len(seive):
            if seive[j] % n == 0:
                del(seive[j])
            else:
                j += 1
        i += 1
    return seive

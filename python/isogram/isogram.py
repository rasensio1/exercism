import re
from collections import Counter

def is_isogram(string):
    myc = Counter(re.sub(r'[\s-]', '', string.lower()))
    if not string or myc.most_common(1)[0][1] == 1:
        return True
    else:
        return False

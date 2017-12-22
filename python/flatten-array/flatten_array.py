
def flatten(iterable):
    done = []
    todo = list(reversed(iterable))

    while todo:
        item = todo.pop()
        if item and (type(item) is list): #non-empty list
            todo.extend(list(reversed(item)))
        elif type(item) in [int, str]:
            done.append(item)
    return done


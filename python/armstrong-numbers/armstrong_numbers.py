def is_armstrong(number):
    exp = len(str(number))
    return number == sum((int(a) ** exp for a in str(number)))

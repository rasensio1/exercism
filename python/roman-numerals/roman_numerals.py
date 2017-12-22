code = {1: "I",
        4: "IV",
        5: "V",
        9: "IX",
        10: "X",
        40: "XL",
        50: "L",
        90: "XC",
        100: "C",
        400: "CD",
        500: "D",
        900: "CM",
        1000: "M"}

def numeral(number, result=""):
    if number == 0:
        return result
    else:
        part, new_number = part_and_remainder(number)
        return numeral(new_number, result + part)

def part_and_remainder(number):
    for num in reversed(list(iter(code.keys()))):
        if num <= number:
            return code[num], (number - num)

# But you hardcoded the tricky parts!
# Yeah... if there were numerals up to 10e9, I would probably generate
# the 9's and 4's in the 'code', and leave the functions the same.

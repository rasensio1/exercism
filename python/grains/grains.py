def require_valid_input(func):

    def wrapper(integer_number):
        if integer_number < 1 or integer_number > 64:
            raise ValueError("Bad input")
        else:
            return func(integer_number)
    return wrapper

@require_valid_input
def on_square(integer_number):
    return 1 << (integer_number - 1)

@require_valid_input
def total_after(integer_number):
    return (1 << integer_number) - 1


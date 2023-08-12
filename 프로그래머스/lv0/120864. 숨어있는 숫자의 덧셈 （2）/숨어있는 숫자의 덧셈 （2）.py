def solution(my_string):
    result = 0
    number_string = ""
    for char in my_string:
        if char.isdigit():
            number_string += char
        else:
            if not number_string == "":
                result += int(number_string)
                number_string = ""
    if not number_string == "":
        result += int(number_string)
    return result
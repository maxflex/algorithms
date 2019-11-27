def sum_of_numbers_in_string(string):
  result = 0
  digit_string = ''

  def add_result():
    nonlocal digit_string
    nonlocal result
    if len(digit_string) > 0:
      result += int(digit_string)
      digit_string = ''

  for char in string:
    if char.isdigit():
      digit_string += char
    else:
      add_result()

  add_result()

  return result


# START

t = int(input())

for i in range(t):
  input_string = str(input())
  print(sum_of_numbers_in_string(input_string))


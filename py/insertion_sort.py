import random

def insertion_sort(a):
  for i in range(1, len(a)):
    val = a[i]
    index = i
    while index > 0 and a[index - 1] > val:
      a[index] = a[index - 1]
      index = index - 1
    a[index] = val

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

random.shuffle(a)

insertion_sort(a)

print(a)
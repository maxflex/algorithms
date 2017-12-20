# https://practice.geeksforgeeks.org/problems/reverse-a-linked-list

'''Please note that it's Function problem i.e.
you need to write your solution in the form of Function(s) only.
Driver Code to call/invoke your function would be added by GfG's Online Judge.'''


# Node Class
class Node:
  def __init__(self, val):
    self.val  = val
    self.next = None

class LinkedList:
  def __init__(self, val):
    self.head = Node(val)

  def add(self, val):
    current = self.head
    while current.next != None:
      current = current.next
    current.next = Node(val)

  def show(self):
    current = self.head
    while current != None:
      print(current.val)
      current = current.next


  def reverse(self):
    current = self.head
    prev = None
    while current != None:
      nxt = current.next
      current.next = prev
      prev = current
      current = nxt
      if current == None:
        self.head = prev



# your task is to complete this function
# function shouldn't return anything
# use self.head to access head in the method
def reverseList(self):
    # Code here
    if self.head is None:
        return None


ll = LinkedList(5)
ll.add(10)
ll.add(15)
ll.reverse()
ll.show()

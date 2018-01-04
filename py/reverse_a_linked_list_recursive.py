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


  def reverse(self, node):
    if node.next == None:
      self.head = node
      return
    self.reverse(node.next)
    node.next.next = node
    node.next = None

  def reverse_print(self, node):
    if node.next != None:
      self.reverse_print(node.next)
    print(node.val)

ll = LinkedList(5)
ll.add(10)
ll.add(15)
ll.reverse_print(ll.head)
print('-----')
ll.reverse(ll.head)
ll.show()

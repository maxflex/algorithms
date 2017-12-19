# https://practice.geeksforgeeks.org/problems/array-to-bst

class Node():
  def __init__(self, val, **args):
    self.val = val
    if 'left' in args.keys():
      self.left = args['left']
    if 'right' in args.keys():
      self.right = args['right']
    if 'parent' in args.keys():
      self.parent = args['parent']


class BST():
  def __init__(self, arr):
    self.root = self.__get_node(arr, 0, len(arr) - 1)

  def __get_node(self, arr, s, e):
    if s <= e and s >= 0 and e < len(arr):
      mid = (s + e) // 2
      left_node  = self.__get_node(arr, s, mid - 1)
      right_node = self.__get_node(arr, mid + 1, e)
      return Node(arr[mid], left = left_node, right = right_node)
    return None

  def preorder_traverse(self, node):
    if node != None:
      print(node.val, end = " ")
      if node.left != None:
        self.preorder_traverse(node.left)
      if node.right != None:
        self.preorder_traverse(node.right)

#
# START
#

t = int(input())

for i in range(0, t):
  # array size (not needed)
  n = int(input())
  arr = list(map(int, input().split()))
  bst = BST(arr)
  bst.preorder_traverse(bst.root)
  if i < (t - 1):
    print()
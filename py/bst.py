import math

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

  def show(self, node):
    print(node.val)
    if node.left != None:
      self.show(node.left)
    if node.right != None:
      self.show(node.right)

  def show2(self, node, depth=0):
    ret = ""

    # Print right branch
    if node.right != None:
        ret += self.show2(node.right, depth + 1)

    # Print own val
    ret += "\n" + ("    "*depth) + str(node.val)

    # Print left branch
    if node.left != None:
        ret += self.show2(node.left, depth + 1)

    return ret

bst = BST([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

print(bst.show2(bst.root))
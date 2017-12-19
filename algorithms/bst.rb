class Node
  attr_accessor :val, :left, :right, :parent

  def initialize(val, hash = {})
    @val    = val
    @left   = hash[:left]   if hash[:left]
    @right  = hash[:right]  if hash[:right]
    @parent = hash[:parent] if hash[:parent]
  end
end

class BST
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def add_left(node, val)
    node.left = Node.new(val, parent: node)
  end

  def add_right(node, val)
    node.right = Node.new(val, parent: node)
  end

  def show_ordered(node)
    if node != nil
      show_ordered(node.left)
      puts(node.val)
      show_ordered(node.right)
    end
  end

  def show(node)
    puts node.val
    show(node.left) if node.left
    show(node.right) if node.right
  end
end

bst = BST.new(20)

root = bst.root
left = bst.add_left(root, 15)
right = bst.add_right(root, 25)

bst.add_left(left, 13)
bst.add_right(left, 17)

bst.add_left(right, 23)
bst.add_right(right, 27)

bst.show_ordered(bst.root)
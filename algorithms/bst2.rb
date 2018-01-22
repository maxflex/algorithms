class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
  end
end

class BST
  attr_accessor :root

  def initialize
    @root = 1111
  end

  def insert(val)
    _insert(@root, val)
  end

  def _insert(node, val)
    node = val
    puts node.object_id
    return node
    if node == nil
      node = Node.new(val)
    elsif val > node.val
      _insert(node.right, val)
    else
      _insert(node.left, val)
    end
  end

  def traverse(node, type = 'inorder')
    if node != nil
      puts(node.val) if type == 'preorder'
      traverse(node.left, type)
      puts(node.val) if type == 'inorder'
      traverse(node.right, type)
      puts(node.val) if type == 'postorder'
    end
  end
end


a = 5
puts a.object_id << 1
a = 4
puts a.object_id << 1

# bst = BST.new()
#
# puts bst.root.object_id
# bst.root = 999
# puts bst.root.object_id
# bst._insert(bst.root, 999)
# bst.insert(7)
# bst.insert(8)
# bst.insert(17)
# bst.insert(1)
# bst.insert(20)

# puts(bst.root)
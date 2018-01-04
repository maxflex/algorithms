class Node
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    @next = next_node
    @val  = val
  end
end

class Stack
  def initialize(head = nil)
    @head = head
  end

  def push(val)
    new_node = Node.new(val, @head)
    @head = new_node
  end

  def pop
    return nil if @head == nil
    node = @head
    @head = @head.next
    return node.val
  end

  def empty?
    @head == nil
  end

  def print
    current = @head
    while current != nil
      puts(current.val)
      current = current.next
    end
  end
end

str = 'My name is Max'
s = Stack.new()

for i in 0..str.length - 1
  s.push(str[i])
end

for i in 0..str.length - 1
  str[i] = s.pop
end

puts(str)
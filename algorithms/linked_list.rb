class Node
  attr_accessor :val, :next, :prev

  def initialize(val, next_node, prev)
    @val = val
    @next = next_node
    @prev = prev
  end
end

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val, nil, nil)
  end

  def add(val)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(val, nil, current)
  end

  def insert_at(val, index)
    if index == 0
      new_node = Node.new(val, @head, nil)
      @head.prev = new_node
      @head = new_node
    else
      current_index = 0
      current = @head
      while current_index != index
        current = current.next
        current_index += 1
      end
      new_node = Node.new(val, current, current.prev)
      current.prev.next = new_node
      current.prev = new_node
    end
  end

  def show
    current = @head
    values = [current.val]
    while current.next != nil
      current = current.next
      values.push(current.val)
    end
    puts values.join(', ')
  end
end

# l = LinkedList.new(13)
# l.add(15)
# l.add(16)
# l.insert_at(14, 1)
# l.insert_at(12, 0)
# l.add(17)
# l.show
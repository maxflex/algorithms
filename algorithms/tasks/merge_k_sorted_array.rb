class QueueNode
  def initialize(a, i = 0)
    @a = a
    @i = i
  end

  def next!
    @i += 1
    return @i < @a.size
  end

  def val
    @a[@i]
  end
end

class Queue
  def initialize(nodes)
    @nodes = nodes
    build_min_heap
  end

  def add(node)
    @nodes << node
    min_heapify((@nodes.size - 1) / 2, true)
  end

  def pop
    @nodes[0], @nodes[-1] = @nodes[-1], @nodes[0]
    node = @nodes.delete_at(-1)
    min_heapify(0)
    return node
  end

  def empty?
    @nodes.size < 1
  end

  def min_heapify(i, bottom_up = false)
    return if i >= @nodes.size / 2 # leaves are good

    min_index = i
    l_index = 2 * i + 1
    r_index = 2 * i + 2

    min_index = l_index if l_index < @nodes.size && @nodes[l_index].val < @nodes[min_index].val
    min_index = r_index if r_index < @nodes.size && @nodes[r_index].val < @nodes[min_index].val

    l = @nodes[l_index]
    r = @nodes[r_index]

    if min_index != i
      @nodes[min_index], @nodes[i] = @nodes[i], @nodes[min_index]
      min_heapify(bottom_up ? (i - 1) / 2 : min_index)
    end
  end

  def print
    values = []
    @nodes.each do |node|
      values << node.val
    end
    puts values.join(', ')
  end

  private

  def build_min_heap
    ((@nodes.size - 1) / 2).downto(0) do |i|
      min_heapify(i)
    end
  end
end


def merge_k_sorted(arr)
  nodes = []
  arr.each {|a|
    nodes << QueueNode.new(a)
  }

  sorted = []

  pq = Queue.new(nodes)

  while !pq.empty?
    pq.print
    node = pq.pop
    sorted << node.val
    if node.next!
      pq.add(node)
    end
  end

  puts '---'
  puts sorted.join(', ')
end


arr = [[9], [1, 4, 5], [7, 8], [2, 3, 6]]
merge_k_sorted(arr)
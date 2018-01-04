# records per read
$run_size = 10000

# runs
$run_count = 100



class QueueNode
  attr_accessor :val

  def initialize(file)
    @file = open(file_path(file))
    self.next!
  end

  def next!
    line = @file.gets
    if line == nil
      @file.close
      @val = nil
    else
      @val = line.to_i
    end
    return @val
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
    # leaves are good
    return if i >= @nodes.size / 2

    min_index = i
    l_index = 2 * i + 1
    r_index = 2 * i + 2

    min_index = l_index if l_index < @nodes.size && @nodes[l_index].val < @nodes[min_index].val
    min_index = r_index if r_index < @nodes.size && @nodes[r_index].val < @nodes[min_index].val

    if min_index != i
      @nodes[min_index], @nodes[i] = @nodes[i], @nodes[min_index]
      min_heapify(bottom_up ? (i - 1) / 2 : min_index, bottom_up)
    end
  end

  def build_min_heap
    (@nodes.size - 1 / 2).downto(0) do |i|
      min_heapify(i)
    end
  end
end

def quick_sort(a, s, e)
  if s < e
    index = partition(a, s, e)
    quick_sort(a, s, index - 1)
    quick_sort(a, index + 1, e)
  end
end

def partition(a, s, e)
  pivot = a[e]
  index = s
  for i in s..e - 1
    if a[i].to_i < pivot.to_i
      a[i], a[index] = a[index], a[i]
      index += 1
    end
  end
  a[e], a[index] = a[index], a[e]
  return index
end

def sort_chunks
  puts 'generating sorted chunks...'
  i = 1
  File.foreach(file_path('output')).each_slice($run_size) do |a|
    quick_sort(a, 0, a.size - 1)
    output = open(file_path("chunk_#{i}"), 'w')
    a.each do |el|
      output.puts(el)
    end
    output.close
    i += 1
  end
end

def merge_chunks
  puts 'merging chunks...'
  nodes = []
  (1..$run_count).each do |i|
    nodes << QueueNode.new("chunk_#{i}")
  end

  pq = Queue.new(nodes)

  output = open(file_path('sorted'), 'w')

  while !pq.empty?
    node = pq.pop
    output.puts(node.val)
    if node.next!
      pq.add(node)
    end
  end
end

def file_path(file)
  "files/#{file}.txt"
end

def generate_random_output
  puts 'generating random output...'
  output = open(file_path('output'), 'w')
  ($run_size * $run_count).times do
    output.puts(rand(1..100))
  end
  output.close
end

generate_random_output
sort_chunks
merge_chunks
def max_heapify(a, i)
  return if i >= (a.length / 2)
  # puts "heapify at index #{i}"
  l_index = 2 * i + 1
  r_index = l_index + 1
  l = a[l_index]
  r = a[r_index]
  max = r == nil ? l : [l, r].max
  if max > a[i]
    max_index = max == l ? l_index : r_index
    # puts "INDEX: #{i} | EL: #{a[i]} | L_INDEX: #{l_index} | R_INDEX: #{r_index} | L: #{l} | R: #{r} | Max: #{max} | Max index: #{max_index}"
    # swap
    a[i], a[max_index] = a[max_index], a[i]
    max_heapify(a, max_index)
  end
end

def heap_sort(a)
  sorted = []
  (a.length - 1).downto(0) do |i|
    # puts "INDEX: #{i}"
    # puts a.join(", ") + "\n"
    a[0], a[i] = a[i], a[0]
    sorted.push(a.delete_at(i))
    max_heapify(a, 0)
  end
  sorted
end

a = Array.new(10) {|i| i + 1}
a = a.shuffle
puts a.join(', ')

((a.length - 1) / 2).downto(0) do |i|
  max_heapify(a, i)
end

puts a.join(', ')

a = heap_sort(a)

puts a.join(', ')
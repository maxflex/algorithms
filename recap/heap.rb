def max_heapify(a, i, size)
  return if i >= size / 2 # leaves are good
  l_index  = i * 2 + 1
  r_index = l_index + 1
  l = a[l_index]
  r = r_index < size ? a[r_index] : nil
  max = r == nil ? l : [l, r].max
  if max > a[i]
    max_index = max == l ? l_index : r_index
    a[i], a[max_index] = a[max_index], a[i]
    max_heapify(a, max_index, size)
  end
end

def build_max_heap(a)
  (a.size / 2 - 1).downto(0) do |i|
    max_heapify(a, i, a.size)
  end
end

def heap_sort(a)
  (a.size - 1).downto(1) do |i|
    a[0], a[i] = a[i], a[0]
    max_heapify(a, 0, i)
  end
end

a = Array.new(10) {|i| i + 1}
build_max_heap(a)
puts a.join(', ')
puts '---'
heap_sort(a)
puts a.join(', ')
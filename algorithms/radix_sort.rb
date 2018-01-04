a = Array.new(10) {|i| i+1 }
a = a.shuffle
a = merge_sort(a)

puts a.join(', ')
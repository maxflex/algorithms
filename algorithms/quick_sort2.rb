a = Array.new(10) {|i| i+1 }
a = a.shuffle
quick_sort(a)

puts a.join(', ')
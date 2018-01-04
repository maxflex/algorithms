def selection_sort(a)
  for i in 0..(a.size-2)
    min_index = i
    for j in (i + 1)..(a.size - 1)
      min_index = j if a[j] < a[min_index]
    end
    a[min_index], a[i] = a[i], a[min_index]
  end
end

a = Array.new(10) {|i| i + 1}
a << 5
a = a.shuffle
selection_sort(a)
puts a

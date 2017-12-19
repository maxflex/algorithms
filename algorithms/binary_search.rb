def binary_search(a, v)
  start_index = 0
  end_index = a.size - 1
  while (start_index != end_index && start_index <= (a.size - 1) && end_index >= 0)
    i = (start_index + end_index) / 2
    if v == a[i]
      return i
    elsif v > a[i]
      start_index += i
    else
      end_index -= i
    end
  end
  return -1
end

a = Array.new(10) {|i| i + 1}
# a = a.shuffle

puts binary_search(a, 3123)
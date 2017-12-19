def quick_sort(a, s, e)
  if s < e
    pi = partition(a, s, e)
    quick_sort(a, s, pi - 1)
    quick_sort(a, pi + 1, e)
  end
end

def partition(a, s, e)
  randomized_partition(a, s, e)
  pivot = a[e]
  pi = s
  for i in s..e-1
    if a[i] <= pivot
      a[pi], a[i] = a[i], a[pi]
      pi += 1
    end
  end
  a[pi], a[e] = a[e], a[pi]
  return pi
end

def randomized_partition(a, s, e)
  random_index = rand(s..e)
  a[random_index], a[e] = a[e], a[random_index]
end

a = Array.new(10) {|i| i + 1}
a = a.shuffle

puts a.join(', ')
quick_sort(a, 0, a.size - 1)
puts a.join(', ')
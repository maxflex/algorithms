def merge_sort(a)
  return a if a.size < 2

  mid = (a.size - 1) / 2
  l = merge_sort(a[0..mid])
  r = merge_sort(a[mid + 1..-1])

  i = j = 0
  sorted = []
  while i < l.size && j < r.size
    if l[i] <= r[j]
      sorted << l[i]
      i += 1
    else
      sorted << r[j]
      j += 1
    end
  end

  if i < l.size
    sorted += l[i..-1]
  elsif j < r.size
    sorted += r[j..-1]
  end

  return sorted
end

a = Array.new(30) {|i| rand(1..100)}
a = a.shuffle
a = merge_sort(a)

puts a.join(', ')
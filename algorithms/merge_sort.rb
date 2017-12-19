def merge_sort(a, p = false)
  if a.length > 1
    l = merge_sort(a[0 .. a.length/2 - 1])
    r = merge_sort(a[a.length/2 .. a.length - 1])

    if p
      puts a.join(', ')
      puts '---L---'
      puts l.join(', ')
      puts '---R---'
      puts r.join(', ')
    end

    i = j = 0

    sorted = []

    begin
      if l[i] <= r[j]
        sorted.push(l[i])
        i = i + 1
      else
        sorted.push(r[j])
        j = j + 1
      end
    end while (i < l.length && j < r.length)

    if i < l.length
      sorted.concat(l[i .. l.length - 1])
    elsif j < r.length
      sorted.concat(r[j .. r.length - 1])
    end
    if p
      puts "===== SORTED ====="
      puts sorted.join(', ')
      puts "\n"
    end
    return sorted
  end
  return a
end

a = Array.new(10) {|i| i + 1}
a = a.shuffle

# puts a
a = merge_sort(a)
puts "\n===RESULT===="
puts a
a = Array.new(10) {|i| rand(1..50)}

for j in 1..(a.length-1)
    val = a[j]
    i = j - 1
    while i >= 0 && a[i] < val
        a[i + 1] = a[i]
        i = i - 1
    end
    a[i + 1] = val
end

puts a
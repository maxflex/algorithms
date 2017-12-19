class Prime
  def self.is_prime(n)
    return false if n <= 1
    return true if n.between?(2, 3)
    return false if n % 2 == 0
    return false if n % 3 == 0

    i = 5
    w = 2

    while (i * i) <= n
      return false if n % i == 0
      i += w
      w = 6 - w
    end

    return true
  end

  def self.next_prime(n)
    for i in (n + 1)..(2 * n)
      return i if self.is_prime(i)
    end
  end
end
#
# for i in 1..101
#   is_prime = Prime::is_prime(i)
#   puts "#{i} \t | " + is_prime.to_s
#   puts "next prime will be " + Prime.next_prime(i).to_s if is_prime
# end
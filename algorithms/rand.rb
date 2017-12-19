class Randomizer
  @seed = 1234
  @increment = 12345
  @modulus = 2 ** 31 - 1
  @multiplier = 1103515245

  # square algo
  def self.next_sqare
    @seed *= @seed
    str = @seed.to_s
    (8 - str.length).times do
      str.prepend('0')
    end
    @seed = str[2..5].to_i
  end

  # square algo
  def self.next_float_sqare
    self.next_sqare / 9999.0
  end

  # linear congruental generator
  def self.next_lcg
    @seed = (@seed * @multiplier + @increment) % @modulus
  end

  # linear congruental generator
  def self.next_float_lcg
    self.next_lcg / @modulus.to_f
  end
end
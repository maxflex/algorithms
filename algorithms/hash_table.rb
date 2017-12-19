require './linked_list'
require './prime'

class HashTable
  attr_accessor :slots

  # for multiplication method
  A = 0.31

  def initialize(size, universe_size = nil)
    @slots = Array.new(size)
    if universe_size != nil
      @prime = Prime::next_prime(universe_size)
      @random_a = rand(0..@prime)
      @random_b = rand(0..@prime)
    end
  end

  def set(key, val)
    i = h(key)
    # if @slots[i] == nil
    #   @slots[i] = LinkedList.new(val)
    # else
    #   @slots[i].insert_at(val, 0) # insert at head
    # @slots[i] = val
  end

  def get(key)
    @slots[h(key)]
  end

  # def h(key)
  #   key % @slots.size
  # end

  # def h(key)
  #   (@slots.size * (key * A % 1)).floor
  # end

  # universal hashing
  def h(key)
    ((@random_a * key + @random_b) % @prime) % @slots.size
  end

  def dump
    @slots.each_with_index do |val, index|
      puts (index + 1).to_s + " \t| #{val}"
    end
  end
end

h = HashTable.new(10, 10001)

indexes = []
for i in 0..10000
  indexes << h.h(i)
end

occurances = Hash.new(0)
indexes.each {|i| occurances[i] += 1}

puts occurances

# h.set(555, 'test')
# h.set(4, 'test3')
# h.set(661, 'test2')
# puts h.get(661)
# h.dump
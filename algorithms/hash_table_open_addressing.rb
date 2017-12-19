require './linked_list'
require './prime'

class HashTable
  attr_accessor :slots

  A = 0.33

  def initialize(size)
    @slots = Array.new(size)
  end

  def set(key, val)
    for trial in 0..(@slots.size - 1)
      i = h(key, trial)
      if i == nil
        @slots[i] = val
        return i
      end
    end
    raise "stack overflow"
  end

  def get(key)
    for trial in 0..(@slots.size - 1)
      i = h(key, trial)
    end
  end

  def h(key, trial)
    (_h(key) + trial) % @slots.size
  end

  def _h(key)
    (@slots.size * (key * A % 1)).floor
  end

  def dump
    @slots.each_with_index do |val, index|
      puts (index + 1).to_s + " \t| #{val}"
    end
  end
end

h = HashTable.new(10)

# indexes = []
# for i in 0..10000
#   indexes << h.h(i)
# end
#
# occurances = Hash.new(0)
# indexes.each {|i| occurances[i] += 1}
#
# puts occurances

h.set(555, 'test')
h.set(4, 'test3')
h.set(661, 'test2')
puts h.get(661)
h.dump
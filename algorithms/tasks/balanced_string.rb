class Stack
  def initialize
    @top = -1
    @stack = []
  end

  def push(val)
    @top += 1
    @stack[@top] = val
  end

  def pop
    return nil if self.empty?
    val = @stack[@top]
    @top -= 1
    return val
  end

  def top
    @stack[@top]
  end

  def empty?
    @top == -1
  end

  def print
    return if self.empty?
    for i in 0..@top
      print(@stack[i])
    end
    puts
  end
end


def is_balanced?(str, opening = '([', closing = ')]')
  s = Stack.new
  opening = opening.split('')
  closing = closing.split('')
  str.each_char do |chr|
    opening_index = opening.index(chr)
    if opening_index != nil
      s.push(opening_index)
    else
      closing_index = closing.index(chr)
      return false if s.empty? || s.pop != closing_index
    end
  end

  return s.empty?
end

str = '(((((((((((([[[[[[[[[[[[()]]]]]]]]]]]]))))))))))))'
puts(is_balanced?(str))
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

str = 'My name is Max'
s = Stack.new()

for i in 0..str.length - 1
  s.push(str[i])
end

for i in 0..str.length - 1
  str[i] = s.pop
end

puts(str)
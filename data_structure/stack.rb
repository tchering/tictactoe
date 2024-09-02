class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(value)
    @stack.push(value)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def is_empty
    @stack.empty?
  end

  def remove(value)
    temp_stack = []
    while !@stack.empty? && @stack.last != value
      temp_stack.push(@stack.pop)
    end
    @stack.pop if !@stack.empty? && @stack.last == value
    while !temp_stack.empty?
      @stack.push(temp_stack.pop)
    end
  end
end

# Example usage:
stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)

p stack.stack # Output: [10, 20, 30]
stack.remove(20)
p stack.stack # Output: [10, 30]
p stack.peek   # Output: 30
p stack.pop    # Output: 30
p stack.is_empty # Output: false
stack.pop
p stack.is_empty # Output: true

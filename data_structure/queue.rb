class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(value)
    @queue.push(value)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end

  def is_empty
    @queue.empty?
  end
end

# Example usage:
queue = Queue.new
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
p queue.queue # Output: [10, 20, 30]
puts queue.peek   # Output: 10
puts queue.dequeue # Output: 10
p queue.queue # Output: [20, 30]
puts queue.is_empty # Output: false
queue.dequeue
queue.dequeue
puts queue.is_empty # Output: true

class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class Queue
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

  def is_empty?
    @queue.empty?
  end
end

class BinaryTree
  def initialize(root)
    @root = root #root object with value 1
  end

  def level_order_traversal
    return if @root.nil?
    queue = Queue.new
    queue.enqueue(@root)

    while !queue.is_empty?
      node = queue.dequeue
      process(node)
      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right
    end
  end

  private

  def process(node)
    puts node.value
  end
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
tree = BinaryTree.new(root)
tree.level_order_traversal

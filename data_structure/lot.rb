
class Queue
  def initialize
    @queue = []
    # binding.pry
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

class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize(root = nil)
    @root = root
  end

  def level_order_traversal
    return if @root.nil?

    queue = Queue.new
    queue.enqueue(@root)

    while !queue.is_empty?
      node = queue.dequeue
      process(node)  # e.g., print node.value

      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right

      # binding.pry

    end
  end

  private

  def process(node)
    puts node.value
  end
end

# Example usage:
root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.left = TreeNode.new(4)
root.left.right = TreeNode.new(5)
root.right.left = TreeNode.new(6)
root.right.right = TreeNode.new(7)

tree = BinaryTree.new(root)
tree.level_order_traversal


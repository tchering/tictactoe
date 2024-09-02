class NodeTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize(root)
    @root = root
  end

  def pre_order_traversal(node = @root)
    return if node.nil?
    process(node)
    pre_order_traversal(node.left)
    pre_order_traversal(node.right)
  end

  private

  def process(node)
    puts node.value
  end
end

root = NodeTree.new(1)
root.left = NodeTree.new(2)
root.right = NodeTree.new(3)
root.left.left = NodeTree.new(4)
root.left.right = NodeTree.new(5)
root.right.left = NodeTree.new(6)
root.right.right = NodeTree.new(7)
tree = BinaryTree.new(root)
tree.pre_order_traversal


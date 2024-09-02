#in order traversal
class NodeClass
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

  def in_order_traversal(node = @root)
    return if node.nil?

    in_order_traversal(node.left) if node.left
    process(node)
    in_order_traversal(node.right) if node.right
  end

  private

  def process(node)
    puts node.value
  end
end

root = NodeClass.new(1)
root.left = NodeClass.new(2)
root.right = NodeClass.new(3)
root.left.left = NodeClass.new(4)
root.left.right = NodeClass.new(5)
root.right.left = NodeClass.new(6)
root.right.right = NodeClass.new(7)

tree = BinaryTree.new(root)
tree.in_order_traversal

#post order node
class NodeClass
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

  def post_order_traversal(node = @root)
    return if node.nil?

    post_order_traversal(node.left) if node.left
    post_order_traversal(node.right) if node.right
    process(node)
  end

  private

  def process(node)
    puts node.value
  end
end

root = NodeClass.new(1)
root.left = NodeClass.new(2)
root.right = NodeClass.new(3)
root.left.left = NodeClass.new(4)
root.left.right = NodeClass.new(5)
root.right.left = NodeClass.new(6)
root.right.right = NodeClass.new(7)

tree = BinaryTree.new(root)
tree.post_order_traversal

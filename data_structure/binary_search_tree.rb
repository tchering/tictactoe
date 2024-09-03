require "pry-byebug"

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left
  end

  def build_tree_from_array(array)
    sorted_array = array.uniq.sort
    @root = build_tree_recursive(@root, sorted_array)
  end

  def insert(value)
    insert_recursive(@root, value)
  end

  def delete(value)
    delete_recursive(@root, value)
  end

  def find(value)
    search_recursive(@root, value)
  end

  def in_order_traversal
    data = []
    in_order_recursive(@root, data)
  end

  private

  def build_tree_recursive(node, array)
    return nil if array.empty?
    mid = array.length / 2
    node = Node.new(array[mid])

    node.left = build_tree_recursive(node.left, array[0...mid])
    node.right = build_tree_recursive(node.right, array[mid + 1..-1])
    node
    # binding.pry
  end

  def insert_recursive(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_recursive(node.left, value)
    elsif value > node.value
      node.right = insert_recursive(node.right, value)
    else
      node.right = insert_recursive(node.right, value)
    end
    node
  end

  def delete_recursive(node, value)
    return nil if node.nil?
    # return nil if node.value == value
    if value < node.value
      node.left = delete_recursive(node.left, value)
    elsif value > node.value
      node.right = delete_recursive(node.right, value)
    else
      if node.left.nil? && node.right.nil? #if node has no child
        return nil
      elsif node.left.nil? #if node has one child(right)
        return node.right
      elsif node.right.nil? #if node has one child(left)
        return node.left
      else #if node has both child
        predecessor = find_max(node.left)
        node.value = predecessor.value
        node.left = delete_recursive(node.left, predecessor.value)
        # binding.pry
      end
    end
    node
  end

  def find_max(node)
    current = node
    current = current.right while current.right
    current
  end

  def search_recursive(node, value)
    return nil if node.nil?
    return "Result : #{node.value}" if node.value == value
    if value < node.value
      search_recursive(node.left, value)
    elsif value > node.value
      search_recursive(node.right, value)
    end
  end

  def in_order_recursive(node, data)
    return nil if node.nil?
    node.left = in_order_recursive(node.left, data)
    data << node.value
    node.right = in_order_recursive(node.right, data)
    data
  end
end

bst = BinarySearchTree.new
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# array = Array.new(30) {rand(1..100)}
bst.build_tree_from_array(array)
puts bst.find(23)
# p bst.in_order_traversal
bst.pretty_print

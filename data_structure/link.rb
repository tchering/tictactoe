# Define the Node class
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

# Define the LinkedList class
class LinkedList
  def initialize
    @head = nil
  end

  # Add a node to the end of the list
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  # Print the list
  def print_list
    current = @head
    while current
      print "#{current.value} -> "
      current = current.next_node
    end
    puts "nil"
  end

  # Find a node with a specific value
  def find(value)
    current = @head
    while current
      return current if current.value == value
      current = current.next_node
    end
    nil
  end

  # Delete a node with a specific value
  def delete(value)
    return if @head.nil?

    if @head.value == value
      @head = @head.next_node
      return
    end

    current = @head
    while current.next_node && current.next_node.value != value
      current = current.next_node
    end

    if current.next_node
      current.next_node = current.next_node.next_node
    end
  end
end

# Example usage:
list = LinkedList.new
list.append("dog")
list.append(2)
list.append(3)
list.print_list # Output: 1 -> 2 -> 3 -> nil

# Find a node
node = list.find(2)
puts node ? "Found node with value #{node.value}" : "Node not found"

# Delete a node
list.delete(2)
list.print_list # Output: 1 -> 3 -> nil

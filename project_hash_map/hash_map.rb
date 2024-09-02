class HashMap
  attr_reader :bucket

  def initialize
    @bucket = Array.new(16) { [] }
    @size = 0 # need to track the size of bucket to calculate load factor
  end

  def hash(key)
    key.to_s.each_char.reduce(0) { |sum, char| sum += char.ord } % @bucket.size
  end

  #to handle collision we will use chaining
  def set(key, value)
    resize if load_factor > 0.75
    index = hash(key)
    bucket = @bucket[index]
    pair = bucket.find { |k, _| k == key }
    if pair
      # if key already exist we will simply replace the value
      pair[1] = value
    else
      # is key doesnot exist will will push both key value pairs inside bucket
      bucket << [key, value]
      @size += 1
    end
  end

  def get(key)
    index = hash(key)
    bucket = @bucket[index]
    pair = bucket.find { |k, _| k == key }
    pair ? pair[1] : "No data found with that key"
  end

  def has?(key)
    index = hash(key)
    bucket = @bucket[index]
    pair = bucket.find { |k, _| k == key }
    pair.nil?
  end

  def remove(key)
    index = hash(key)
    bucket = @bucket[index]
    pair = bucket.find { |k, _| k == key }
    if pair
      bucket.delete_if { |k, _| k == key }
      @size -= 1
      pair[1]
    else
      nil
    end
  end

  def length
    @size
  end

  def clear
    @bucket = Array.new(16) { [] }
    @size = 0
  end

  def keys
    all_keys = []
    @bucket.each do |bucket|
      bucket.each do |k, _|
        all_keys << k
      end
    end
    all_keys
  end

  def values
    all_values = []
    @bucket.each do |bucket|
      bucket.each do |_, v|
        all_values << v
      end
    end
    all_values
  end

  private

  def resize
    old_buckets = @bucket
    @bucket = Array.new(@bucket.size * 2) { [] }
    @size = 0
    old_buckets.flatten(1).each do |key, value|
      set(key, value)
    end
  end

  def load_factor
    @size.to_f / @bucket.size
  end
end

test = HashMap.new
test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")
test.set("moon", "silver")

p test.bucket
# [
#   [],
#   [["banana", "yellow"], ["elephant", "gray"]],
#   [["apple", "red"], ["jacket", "blue"], ["lion", "golden"]],
#   [],
#   [],
#   [],
#   [],
#   [],
#   [],
#   [["ice cream", "white"], ["moon", "silver"]],
#   [["dog", "brown"]],
#   [["carrot", "orange"]],
#   [],
#   [["hat", "black"], ["kite", "pink"]],
#   [["frog", "green"]],
#   [["grape", "purple"]]
# ]

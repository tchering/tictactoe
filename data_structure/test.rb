# array1 = [1, 2, 3, 4, 5, 6]
# array2 = [7, 8, 9, 10]

# old_buckets = array1
# array1 = Array.new(array1.size * 2) { [] }

# def set(array, key)
#   index = key % array.size
#   array[index] << key
# end

# # old_buckets.each do |key|
# #   set(array1, key)
# # end

# # array2.each do |key|
# #   set(array1)
# # end

# def replace_key(array_from,array_to)
#   array_from.each do |key|
#     set(array_to,key)
#   end
# end

# replace_key(old_buckets,array1)
# replace_key(array2,array1)
# p array1

array = [
  ["sonam","sherpa"],
  ["yangji","sherpa"],
  ["chering","sheerpa"]
]

array.flatten(1).each do |key,value|
  puts "#{key} and #{value}"
end

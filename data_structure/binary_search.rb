require "pry-byebug"
array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def binary_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) / 2
    left_side = arr[0...mid]
    right_side = arr[mid...arr.length]
    # binding.pry
    if arr[mid] == target
      return target
    elsif arr[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end
  return -1
end

index = binary_search(array,9)

if index == -1
  puts "Target not found"
else
  puts "Target is #{index}"
end

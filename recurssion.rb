def has_duplicate_value(array)
  existing_numbers = {}
  array.each do |num|
    if existing_numbers[num].nil?
      existing_numbers[num] = true
    else
      return true
    end
  end
  false
end

# Example usage
array = [1, 2, 3, 4, 5, 1]
puts has_duplicate_value(array) # Output: true

def range(start_num, end_num)
  # base cases
  return [] if end_num < start_num
  return [start_num] if end_num == start_num + 1
  # recursive cases
  [start_num] + range(start_num+1, end_num)
end

# p range(1,2) # [1]
# p range(1, 5) # [1, 2, 3, 4]
# p range(3, 7) # [1, 2, 3, 4]

# [start_num] + range(start_num+1, end_num)

# def sum_of_arr
  
# end

def exponent_1(b, exp)
  # base cases
  return 1 if exp == 0
  return 1 if b == 1
  return b if exp == 1
  # recursive
  b * exponent_1(b, exp-1)
end

# p exponent_1(2, 0)
# p exponent_1(2, 1)
# p exponent_1(5, 3)
# p exponent_1(-2, 5)

def exponent_2(b, exp)
    #base
    return 1 if exp == 0
    return b if exp == 1
    #recursive
    if exp.even? 
        half_exp = exponent_2(b, exp / 2)
        half_exp * half_exp
    else  
        half_exp = exponent_2(b, (exp-1)/2)
        b * half_exp * half_exp
    end
end

#p exponent_2(2, 0)
#p exponent_2(2, 1)
#p exponent_2(5, 3)
#p exponent_2(-2, 5)

def deep_dup(arr)
    #base
    #if we have a 1D array we will return a dup
    return arr.dup if arr.none? { |el| el.is_a?(Array)}
    #recursive
    dupped = []
    arr.each do |el|
        if el.is_a?(Array)
            dupped << deep_dup(el)
        else 
            dupped << el
        end
    end
    dupped
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# robot_parts_copy = deep_dup(robot_parts) 
# p robot_parts_copy
# robot_parts_copy[1] << "LEDs"
# p robot_parts[1]
# arr_1  = [1, [2], [3, [4]]]
# arr_1_copy = deep_dup(arr_1)
# arr_1_copy[2][1] << 4
# p arr_1_copy
# p arr_1


def bsearch(arr, target)
  return nil unless arr.include?(target)
  middle_idx = ( arr.length - 1 ) / 2

  return arr.index(target) if arr[middle_idx] == target

 

  if arr[middle_idx] < target
    array_to_search = arr[middle_idx+1..-1]
    idx_to_add = arr[0..middle_idx].length
  else
    array_to_search = arr[0...middle_idx]
    idx_to_add = 0
  end
  idx_to_add + bsearch(array_to_search, target)
  
end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)

    #base case
    if arr.length <= 1
      return arr
    else
      middle_idx = (arr.length - 1) / 2
      lower_half = merge_sort(arr[0..middle_idx])
      upper_half = merge_sort(arr[middle_idx+1..-1])
    end


    return merge(lower_half, upper_half)
end


def merge(lower_half, upper_half)

  merged = []
  until lower_half.empty? || upper_half.empty?
    if lower_half[0] < upper_half[0]
      merged << lower_half.shift
    else
      merged << upper_half.shift
    end
  end

  merged.concat(lower_half).concat(upper_half)
end



p merge_sort([4, 2, 1, 3])
p merge_sort([38, 27, 43, 3, 9, 82, 10])


# [4, 2, 1, 3] 
# [4, 2], [1, 3]
# [4], [2], [1], [3]
# [2, 4], [1, 3]
# [ 1, 2, 3, 4]

# p merge([2, 4], [1, 3])
# p merge([9,82], [10])

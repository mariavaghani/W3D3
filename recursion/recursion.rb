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

  return middle_idx if arr[middle_idx] == target

 

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



# p merge_sort([4, 2, 1, 3])
# p merge_sort([38, 27, 43, 3, 9, 82, 10])


# [4, 2, 1, 3] 
# [4, 2], [1, 3]
# [4], [2], [1], [3]
# [2, 4], [1, 3]
# [ 1, 2, 3, 4]

# p merge([2, 4], [1, 3])
# p merge([9,82], [10])

def subsets(arr)
    #base
    return [] if arr.length == 0
    return [[] ,arr] if arr.length == 1
    
    subset = [[]]
    sub_arrs_without_last = subsets(arr.take(arr.length-1))
    arr_last = arr.last
    sub_arrs_with_last = []
    
    sub_arrs_without_last.each_with_index do |ele, idx|
      sub_arrs_with_last << sub_arrs_without_last[idx] + [arr_last]
    end

    subset += sub_arrs_with_last
    subset += sub_arrs_without_last 
    subset << [arr_last]
    subset.uniq
end


# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# p subsets([1, 2, 3, 4])


def permutations(arr)
  # base cases
  return [[]] if arr.empty? 
  return [arr] if arr.length == 1
  # print "arr"
  # p arr
  last_ele = arr.pop
  prev_perms = permutations(arr)
  new_perms = []
  # print "prev_perms"
  # p prev_perms
  prev_perms.each do |perm_arr|
    new_perms << [last_ele] + perm_arr
    new_perms << perm_arr + [last_ele]
    (0...perm_arr.length).each do |idx|
      new_perms << perm_arr.take(idx) + [last_ele] + perm_arr.drop(idx)
    end
  end
  new_perms.uniq.sort
end


test1 = permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]



test1_res = [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#     [2, 1, 3], [2, 3, 1],
#     [3, 1, 2], [3, 2, 1]]
# puts "TEST 1"
# p test1
# p test1_res
# p test1 == test1_res
# p test1.length
# p test1_res.length

# p permutations([])
# p [].permutation.to_a

# p permutations([1])
# p [1].permutation.to_a

test2 = permutations([5, 6, 3, 8])
test2_res = [5, 6, 3, 8].permutation.to_a

puts "TEST 2========="

p test2_res
p test2
p test2.sort == test2_res.sort
p test2.length
p test2.length

puts "TEST 3========="

test3 = permutations([5, 6, 3, 8, 10])
test3_res = [5, 6, 3, 8, 10].permutation.to_a

puts "========="

p test3_res
p test3
p test3.sort == test3_res.sort
p test3.length
p test3.length

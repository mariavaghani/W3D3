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

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
robot_parts_copy = deep_dup(robot_parts) 
p robot_parts_copy
robot_parts_copy[1] << "LEDs"
p robot_parts[1]
arr_1  = [1, [2], [3, [4]]]
arr_1_copy = deep_dup(arr_1)
arr_1_copy[2][1] << 4
p arr_1_copy
p arr_1
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

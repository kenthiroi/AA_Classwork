# def my_min(list)
#   list.each_with_index do |el, i| 
#     smallest = true
#     list.each_with_index do |el2, j|
#       if i != j 
#         smallest = false if el > el2
#       end
#     end
#     return el if smallest
#   end
# end

# def my_min(list)
#   min = list.first
#   list.each { |el| min = el if el < min }
#   min
# end

# def largest_contiguous_subsum(list)
#   largest_sum = 0
#   i = 0
#   while i < list.length
#     largest_sum = list[i] if list[i] > largest_sum
#     j = i + 1
#     while j < list.length
#       sum = list[i..j].inject {|acc, n| acc+n }
#       largest_sum = sum if sum > largest_sum
#       j += 1
#     end
#     i += 1
#   end
#   largest_sum
# end

def largest_contiguous_subsum(list)
  largest_sum = list.first
  current_sum = list.first
  (1...list.length).each do |i| 
    current_sum = 0 if current_sum < 0
    current_sum += list[i]
    largest_sum = current_sum if largest_sum < current_sum
  end
  largest_sum
end

# Iterate through the array
# Keep track of a current sum as we go
# If we hit a negative number
#   If it is more negative than our current sum
#      Leave current sum as is
#   If not more negative than current sum
#      Add to current sum and store previous sum
#   For the number after the negative, check to see if greater than last number stored in largest_sum

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])
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
  largest_sum = 0
  list.each_with_index do |num, i|
    current_sum = list[i]
    
  end
end

list = [5, 3, -7]
p largest_contiguous_subsum(list)
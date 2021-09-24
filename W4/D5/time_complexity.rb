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

def my_min(list)
  min = list.first
  list.each { |el| min = el if el < min }
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)
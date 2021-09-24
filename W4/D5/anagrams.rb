# def first_anagram?(str1, str2)
#   # chars_hash = Hash.new(0)
#   # chars = str1.split
#   # all_anagrams = []
  
#   # chars.each { |c| chars_hash[c] += 1 }

# end

# def first_anagram?(str1, str2)
#   chars = str1.split('')
#   all_words = chars.permutation.to_a
#   all_words.include?(str2.split(''))
# end

def second_anagram?(str1, str2)
  letters = str2.split('')
  str1.each_char do |char|
    current_char = letters.index(char)
    if current_char
      letters.delete_at(current_char)
    end
    p letters
  end
  letters.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
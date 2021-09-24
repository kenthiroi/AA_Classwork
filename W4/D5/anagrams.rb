
def first_anagram?(str1, str2)
  chars = str1.split('')
  all_words = chars.permutation.to_a
  all_words.include?(str2.split(''))
end

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

def third_anagram?(str1, str2)
   test1 = str1.split('').sort
   test2 = str2.split('').sort
   test1 == test2
end

def fourth_anagram?(str1, str2)
  chars_hash = Hash.new(0)
  chars = str1.split('')
  chars_hash2 = Hash.new(0)
  chars2 = str2.split('')
  
  chars.each { |c| chars_hash[c] += 1 }
  chars2.each { |c| chars_hash2[c] += 1 }

  chars_hash == chars_hash2
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
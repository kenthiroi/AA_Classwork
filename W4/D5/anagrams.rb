def first_anagram?(str1, str2)
  chars_hash = Hash.new(0)
  chars = str1.split
  all_anagrams = []
  
  chars.each { |c| chars_hash[c] += 1 }

end
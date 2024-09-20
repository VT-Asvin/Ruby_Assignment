def substr(word, dictionary)
  result = Hash.new(0)
  word.downcase!
  dictionary.each do |substring|
  
    substring.downcase!

    # Count occurrences of the substring in the word
    count = word_downcase.scan(/#{Regexp.escape(substring_downcase)}/).length
    result[substring_downcase] += count if count > 0
  end

  result
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
puts substrings("below", dictionary) 
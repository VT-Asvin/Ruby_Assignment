def substrings(word, dictionary)
  # Initialize an empty hash to store the results
  result = Hash.new(0)

  # Normalize the word to lowercase for case-insensitive matching
  word_downcase = word.downcase

  # Iterate over each substring in the dictionary
  dictionary.each do |substring|
    # Normalize the substring to lowercase
    substring_downcase = substring.downcase

    # Count occurrences of the substring in the word
    count = word_downcase.scan(/#{Regexp.escape(substring_downcase)}/).length
    result[substring_downcase] += count if count > 0
  end

  result
end

# Example usage
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
puts substrings("below", dictionary)  # => { "below" => 1, "low" => 1 }

def solve(str, num)
	str.each_char.with_index do |char, index|
		if char.match?(/[a-z]/)  # Lowercase letters
			new_char = ((char.ord - 'a'.ord + num) % 26 + 'a'.ord).chr
			str[index] = new_char
		elsif char.match?(/[A-Z]/)  # Uppercase letters
			new_char = ((char.ord - 'A'.ord + num) % 26 + 'A'.ord).chr
			str[index] = new_char
		end
	end
	str
end

puts solve("What a string!", 5)  

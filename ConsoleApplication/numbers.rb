require 'readline'

# Initialize an empty history array
history = []

loop do
  # Use Readline to get user input, enabling history
  name = Readline.readline("Enter your name (or 'exit' to quit): ", true)


  break if name.nil? || name.strip.downcase == 'exit'
  history << name
  
 
  puts "Your name is: #{name}"
end

puts "\nNames entered during this session:"
puts history




require_relative  'config'
require 'rainbow/refinement'
using Rainbow

class Wordle
 
  def initialize
  start_game
  end

  def start_game
     puts "Welcome to the Wordle Game"
     puts "="*27
     puts "Enter your choice"
     puts "1.view Game rules"
     puts "2.start Game"
     user_choice=gets.chomp.to_i
    puts Config::RULES if user_choice==1
    user_guessing
  end

  def user_guessing
     user_attempts=1
     loop do
      puts "Attempt :#{user_attempts},Enter your Guessing Word must be 5 letters"
      guessed_word=gets.chomp.split("")
      if guessed_word.size!=5 
        user_attempts+=1
        next
      end
      user_attempts+=1
      if feedback(guessed_word)
        puts "WELL DONE! YOU HAVE GUESSED CORRECTLY"
        return 
      end

      if user_attempts>=Config::MAX_ATTEMPTS 
        puts "Sorry! You have exceed the attempts"
        return 
      end

     end
  end
  

  def feedback(guessed_word)
     return true if guessed_word.to_s == Config::WORD
     hints=[]
     guessed_word.each_with_index{
      |letter,position|
      
      if !Config::WORD.include?(letter) 
       hints<<(Rainbow(letter).red)
      elsif Config::WORD[position]!=letter
       hints<<(letter.yellow+"")
      elsif Config::WORD[position]==letter
        hints<<(letter.green+"")
      end

     }
     puts hints.join.strip
     false
  end

end
w=Wordle.new
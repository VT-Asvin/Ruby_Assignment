require_relative  'config'
require 'rainbow/refinement'
using Rainbow
require 'dictionary'
class Wordle
  include Config
  def initialize
    start_game
  end
  
  def start_game
     puts "Welcome to the Wordle Game"
     puts "="*27
     puts "Enter your choice"
     puts "1.view Game rules"
     puts "2.start Game"
     user_choice=gets.chomp
     if valid_choice?(user_choice)
         puts Config::RULES if user_choice.to_i==1
         user_guessing
     else 
         puts Rainbow("Invalid Choice.Please Enter  1 or 2").red
         start_game
     end
  end
  
  def user_guessing
     user_attempts=1
     loop do
      puts "Attempt :#{user_attempts},Enter your Guessing Word must be 5 letters"
      guessed_word=gets.chomp.split("")
      if guessed_word.size!=5 
       
        puts Rainbow("Sorry,Enter 5 letter word!!").red
        next
      end
      user_attempts+=1
      return puts "WELL DONE! YOU HAVE GUESSED CORRECTLY" if  feedback(guessed_word)
      return  puts "Sorry! You have exceed the attempts" if user_attempts>=Config::MAX_ATTEMPTS 
     end
  end
  

  def feedback(guessed_word)
     return true if guessed_word.join("")== Config::WORD   
     hints=[]
     
     guessed_word.each_with_index{
      |letter,position|
       lettercount=guessed_word[0 .. position].count(letter)
      
      if !Config::WORD.include?(letter)|| (Config::WORD.include?(letter) &&  lettercount> Config::OCURRENCE_COUNT[letter+""] )
       hints<<(Rainbow(letter).red)
      elsif Config::WORD[position]==letter
        hints<<(letter.green+"")
      elsif Config::WORD[position]!=letter
       hints<<(letter.yellow+"")
      
      end
     }
     display_boxed_word( hints)
     false
  end


end

wordle=Wordle.new
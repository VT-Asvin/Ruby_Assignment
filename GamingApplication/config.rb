module Config
  WORD="cargo"
  OCURRENCE_COUNT=Hash.new(0)
  WORD.each_char{
    |chr|
    OCURRENCE_COUNT[chr]+=1
  }
  MAX_ATTEMPTS=5
  RULES=[
     "1. Guess a Word:",
     "   - Start by entering any five-letter word.",
    "2. Feedback:",
     "     - After each guess, the letters will be color-coded:",
     "     - Green: The letter is in the correct position.",
     "     - Yellow: The letter is in the word but not in the correct position.",
     "     - Red: The letter is not in the word at all.",
    
    "3. Continue Guessing:",
    "   - Use the feedback to inform your next guess. You have a total of six attempts.",
    
    "4. Winning:",
    "   - If you guess the word within six tries, you win! If not, the game reveals the word at the end.",
    
    "5. Daily Challenge:",
    "   - There’s usually one word per day for everyone to guess, creating a shared challenge among players.",
    
    "Have fun playing!"]

    def display_boxed_word(hints)
      top_row = ""
      middle_row = ""
      bottom_row = ""
  
      hints.each do |letter|
        top_row += "┌─┐ "
        middle_row += "│#{letter}│ "
        bottom_row += "└─┘ "
      end
  
      puts top_row.strip
      puts middle_row.strip
      puts bottom_row.strip
    end
end
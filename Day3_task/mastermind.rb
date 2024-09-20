class Mastermind
  COLORS = ["red", "green", "blue", "yellow", "orange", "purple"].freeze
  MAX_ATTEMPTS = 12
  def initialize
    @secret_code = []
  end

  def start_game
    puts "Welcome to Mastermind!"
    puts "Do you want to be the creator of the secret code (C) or the guesser (G)?"
    choice = gets.chomp.upcase
    if choice == 'C'
      create_secret_code
      computer_guessing
    elsif choice == 'G'
      computer_creates_code
      human_guessing
    else
      puts "Invalid choice. Please choose 'C' or 'G'."
    end
  end

  def create_secret_code
    puts "Create your secret code using the following colors: #{COLORS.join(', ')}"
    loop do
      @secret_code = gets.chomp.split
      break if valid_code?(@secret_code)
      puts "Invalid code. Please enter exactly 4 colors from the list."
    end
  end

  def computer_creates_code
    @secret_code = COLORS.sample(4)
    puts "Computer has created a secret code."
  end

  def valid_code?(code)
    return false unless code.length == 4
    code.all? { |color| COLORS.include?(color) }
  end

  def computer_guessing
    attempts = 0
    loop do
      guess = COLORS.sample(4)
      attempts += 1
      puts "Computer guesses: #{guess.join(', ')}"
      feedback = give_feedback(guess)
      puts feedback
      break if feedback == "Correct! The code was #{guess.join(', ')}."
      break if attempts >= MAX_ATTEMPTS
    end
    if attempts < MAX_ATTEMPTS
      puts "Computer took #{attempts} attempts to guess the code."
    else
      puts "Computer exceeded maximum attempts (#{MAX_ATTEMPTS})."
    end
  end

  def human_guessing
    attempts = 0
    loop do
      puts "Enter your guess using the following colors: #{COLORS.join(', ')}"
      guess = gets.chomp.split
      break unless valid_code?(guess)

      attempts += 1
      feedback = give_feedback(guess)
      puts feedback
      break if feedback == "Correct! You've guessed the code."
      break if attempts >= MAX_ATTEMPTS
    end
    if attempts < MAX_ATTEMPTS
      puts "You took #{attempts} attempts to guess the code."
    else
      puts "You've exceeded maximum attempts (#{MAX_ATTEMPTS})."
    end
  end

  def give_feedback(guess)
    exact_matches = guess.zip(@secret_code).count { |g, s| g == s }
    color_matches = guess.uniq.count { |color| @secret_code.include?(color) }
    color_matches -= exact_matches

    if exact_matches == 4
      "Correct! The code was #{@secret_code.join(', ')}."
    else
      "Feedback: #{exact_matches} exact matches and #{color_matches} color matches."
    end
  end
end

game = Mastermind.new
game.start_game

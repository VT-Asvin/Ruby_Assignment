class Game
    
  def initialize
    @board=[[1,2,3],[4,5,6],[7,8,9]]
    @board_values=Hash.new(nil)
    @players=[]
    (1..9).each{
        |i|
        @board_values[i]=nil
    }
    puts "Enter player1's Name:"
    @player_1 = gets.chomp

    puts "Enter player2's Name:"
    @player_2 = gets.chomp
    @players.push(@player_1)
    @players.push(@player_2)
    @dices = { 
      1 => "X",
      2 => "Y"
    }

    puts "Enter player1's choice number:"
    puts "1. X"
    puts "2. Y"
    
    @dice = gets.chomp.to_i

    if @dices.key?(@dice)
      @player_1_dice = @dices[@dice]
      @dices.delete(@dice)
      @player_2_dice = @dices.to_a.last[1]  # Get the value of the last element

      puts "#{@player_1} chose: #{@player_1_dice}"
      puts "#{@player_2} chose: #{@player_2_dice}"
    else
      puts "Invalid choice!"
    end

    @players_symbols = {}
    @players_symbols[@player_1] = @player_1_dice
    @players_symbols[@player_2] = @player_2_dice

    puts "#{@players_symbols}"
  end

  def play
     current_player=@player_1
     current_symbol=@player_1_dice
     puts "#{@board_values}"
      loop do
        print_board
          puts"enter the range of values from 1-9"
          ind=gets.chomp.to_i
           if valid_move?(ind)
                 @board_values[ind] = current_symbol
                 if win?(current_symbol)
                     print_board
                     puts "#{current_player} wins" 
                     break
                 elsif @board_values.values.all?
                     print_board
                     puts "It's a draw!"
                     break

                 end
                 current_player = current_player == @player_1 ? @player_2 : @player_1
                 current_symbol = current_symbol == @player_1_dice ? @player_2_dice : @player_1_dice
                
           else
             puts "Position already taken! Try again."
           end
         
          
      end
    end

  def print_board
    @board.each do |row|
      row_output = row.map { |col| @board_values[col].nil? ? "--" : @board_values[col] }
      puts row_output.join("|")
      puts"\n"
    end

  end

  def valid_move?(input)
     (1..9).include?(input)&&@board_values[input].nil?
  end
  def win?(symbol)
      winning_combinations = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9], 
      [1, 5, 9], [3, 5, 7]       
    ]
     winning_combinations.any? { |combination|

        combination.all?{ |position|
            @board_values[position]==symbol
        }

    }
  end
end


game=Game.new
game.play
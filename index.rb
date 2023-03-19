# Methods for the board class
module Game
  def check_input(chomped)
    valid_inputs = [1, 2, 3]
    until valid_inputs.include?(chomped)
      puts 'Invalid! Enter 1, 2, 3'
      chomped = gets.chomp.to_i
    end
    chomped
  end

  def choice(turn)
    turn.even? ? 'X' : 'O'
  end
end

# Board class
class Board
  include Game
  attr_accessor :row_one, :row_two, :row_three, :board

  def initialize(row_one, row_two, row_three, turn)
    @row_one = row_one
    @row_two = row_two
    @row_three = row_three
    @board = [row_one] + [row_two] + [row_three]
    @turn = turn
  end

  def display_board
    puts @row_one.inspect
    puts @row_two.inspect
    puts @row_three.inspect
  end

  def move
    puts 'Enter Row 1, 2, or 3'
    row_index = gets.chomp.to_i
    row_index = check_input(row_index)

    puts 'Enter Column 1, 2, or 3'
    col_index = gets.chomp.to_i
    col_index = check_input(col_index)

    @board[row_index - 1][col_index - 1] = choice(@turn)
  end
end

def game_start
  board = Board.new(['7', '7', '7'], ['7', '7', '7'], ['7', '7', '7'], 1)
  puts board.display_board
  board.move
  puts board.display_board
end
game_start

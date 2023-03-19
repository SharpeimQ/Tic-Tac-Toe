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
  attr_accessor :row_one, :row_two, :row_three, :board, :turn

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
    puts "Player #{choice(turn)} Enter Row 1, 2, or 3"
    row_index = gets.chomp.to_i
    row_index = check_input(row_index)

    puts "Player #{choice(turn)} Enter Column 1, 2, or 3"
    col_index = gets.chomp.to_i
    col_index = check_input(col_index)

    if @board[row_index - 1][col_index - 1] == 'X' || @board[row_index - 1][col_index - 1] == 'O'
      puts 'That spot is already taken! Enter something else.'
      move
    else
      @board[row_index - 1][col_index - 1] = choice(@turn)
    end
  end

  def turns
    @turn += 1
  end

  def win_condition
    if @row_one.all?('X') || @row_two.all?('X') || @row_three.all?('X')
      puts 'X is the winner!'
      125
    elsif @row_one.all?('O') || @row_two.all?('O') || @row_three.all?('O')
      puts 'O is the winner!'
      125
    end

    if @row_one[0] == 'X' && @row_two[0] == 'X' && @row_three[0] == 'X' &&
       @row_one[1] == 'X' && @row_two[1] == 'X' && @row_three[1] == 'X' &&
       @row_one[2] == 'X' && @row_two[2] == 'X' && @row_three[2] == 'X'
      puts 'X is the winner!'
      125
    elsif @row_one[0] == 'O' && @row_two[0] == 'O' && @row_three[0] == 'O' &&
          @row_one[1] == 'O' && @row_two[1] == 'O' && @row_three[1] == 'O' &&
          @row_one[2] == 'O' && @row_two[2] == 'O' && @row_three[2] == 'O'
      puts 'O is the winner!'
      125
    end

    if (@row_one[0] == 'X' && @row_two[1] == 'X' && @row_three[2] == 'X') ||
       (@row_one[2] == 'X' && @row_two[1] == 'X' && @row_three[0] == 'X')
      puts 'X is the winner!'
      125
    elsif (@row_one[0] == 'O' && @row_two[1] == 'O' && @row_three[2] == 'O') ||
          (@row_one[2] == 'O' && @row_two[1] == 'O' && @row_three[0] == 'O')
      puts 'O is the winner!'
      125
    end
  end
end

def game_start
  board = Board.new(['#', '#', '#'], ['#', '#', '#'], ['#', '#', '#'], 0)
  puts board.display_board
  4.times do
    board.move
    board.turns
    board.win_condition
    puts board.display_board
  end
end
game_start

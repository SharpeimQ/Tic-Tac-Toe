# Game loop to constantly refresh the board until win condition is met
# Create a class for the squares that will be used

# puts [7, 7, 7].inspect
# puts [7, 7, 7].inspect
# puts [7, 7, 7].inspect

# Encase the board inside another array (gameboard)
# Target each square through accessing index in the arrays
# Win-condition will be determined via comparison of index ==

# Class to create rows for board
class Board
  def initialize(row_one, row_two, row_three)
    puts row_one.inspect
    puts row_two.inspect
    puts row_three.inspect
  end
end

board = Board.new([7, 7, 7], [7, 7, 7], [7, 7, 7])
puts board.inspect
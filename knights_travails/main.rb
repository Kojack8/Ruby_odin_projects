require_relative 'board'
require_relative 'knight'

board = Board.new
board.make_board
p board.default
knight = Knight.new([0,0])
knight.possible_moves
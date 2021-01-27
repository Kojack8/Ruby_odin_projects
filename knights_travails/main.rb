require_relative 'board'
require_relative 'knight'

board = Board.new


p knight = Knight.new([6, 6])
knight.determine_right
knight.determine_left
p knight.level_order




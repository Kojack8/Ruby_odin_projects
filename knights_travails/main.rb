require_relative 'board'
require_relative 'knight'

board = Board.new


knight = Knight.new([3, 3])
knight.determine_right
knight.determine_left
knight.find_path([1, 1])





# frozen_string_literal: true

require_relative 'board'
require_relative 'knight'

board = Board.new
i = board.default[rand(63)]
j = board.default[rand(63)]
board.knight_moves(i, j)

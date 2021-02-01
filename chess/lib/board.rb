require_relative 'square'
require_relative './pieces/pawn'

class Board
  attr_reader :default
  def initialize
    @default = make_board
  end

  def fill_board
    fill_pawns
  end

  def fill_pawns 
    p arr = pawn_arr
    # arr.each { |i| 
    #  Pawn.new(i.location)

    #}
  end

  def pawn_arr
    arr = []
    @default.each { |i| 
      if i.location[1] == 1 || i.location[1] == 6
        #arr << i
        p i.occupier = Pawn.new(i.location)
      end
    }
    #arr
  end

  def make_board
    arr = make_board_arr
    arr2 = []
    arr.each { |i| arr2 << Square.new(i)}
    arr2
  end

  def make_board_arr
    arr = []
    (0..7).each do |i|
      (0..7).each do |j|
        arr.push([i, j])
      end
    end
    arr
  end

end
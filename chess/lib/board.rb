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
    @default.each { |i| 
      if i.location[1] == 1 || i.location[1] == 6
        p i.occupier = Pawn.new(i.location)
      end
    }
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
require_relative 'square'
require_relative './pieces/white_pawn'
require_relative './pieces/black_pawn'
require_relative './pieces/rook'
require_relative './pieces/knight'
# Location is decided using tradition chess file(column) by rank(row) 
# [column, row]
class Board
  attr_reader :default
  def initialize
    @default = make_board
  end

  def fill_board
    fill_pawns
    fill_rooks
    fill_knights
    fill_bishops
  end

  def fill_bishops
    @default.each { |i|
      if i.location == [2, 0] || i.location == [5, 0]  
        i.occupier = Bishop.new(i.location, 1)
      elsif i.location == [2, 7] || i.location == [5, 7]
        i.occupier = Bishop.new(i.location, 2)
      end
    }
  end
  
  def fill_knights
    @default.each { |i|
      if i.location == [1, 0] || i.location == [6, 0]  
        i.occupier = Knight.new(i.location, 1)
      elsif i.location == [1, 7] || i.location == [6, 7]
        i.occupier = Knight.new(i.location, 2)
      end
    }
  end

  def fill_rooks
    @default.each { |i|
      if i.location == [0, 0] || i.location == [7, 0]
        i.occupier = Rook.new(i.location, 1)
      elsif  i.location == [0, 7] || i.location == [7, 7]
        i.occupier = Rook.new(i.location, 2)
      end
    }
  end

  def fill_pawns 
    @default.each { |i| 
      if i.location[1] == 1
        i.occupier = WhitePawn.new(i.location)
      end
    }
    @default.each { |i|
      if i.location[1] == 6
        i.occupier = BlackPawn.new(i.location)
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
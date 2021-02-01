require_relative '../modules/verify'

class Knight
  include Verify
  def initialize(loc, color)
    @location = loc
    @moves = determine_moves
    @color = color
  end

  def determine_moves
    arr = []
    move_directons = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    move_directons.each {|i|
      loc = @location.dup
      loc[0] += i[0]
      loc[1] += i[1]
      loc = verify(loc)
      arr << loc
    }
    arr
  end


end
require_relative '../modules/verify'

class King
  include Verify
  def initialize(loc, color)
    @location = loc
    @moves = determine_moves
    @color = color
  end

  def determine_moves
    arr = []
    move_directions = [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], 
    [-1, 0], [-1, 1]]
    move_directions.each { |i|
      loc = @location.dup
      loc[0] += i[0]
      loc[1] += i[1]
      loc = verify(loc)
      arr << loc
    }
    arr
  end

end
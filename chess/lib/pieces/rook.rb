require_relative '../modules/verify'

class Rook
  include Verify
  def initialize(loc)
    @location = loc
    @moves = determine_moves
  end

  def determine_moves
    arr = []
    move_directions = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], 
    [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2],
    [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0],
    [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
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
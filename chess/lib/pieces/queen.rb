require_relative '../modules/verify'

class Queen
  include Verify
  def initialize(loc, color)
    @location = loc
    @moves = determine_moves
    @color = color
  end

  def determine_moves
    arr = []
    move_directions = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], 
    [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2],
    [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0],
    [-4, 0], [-5, 0], [-6, 0], [-7, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], 
    [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], 
    [1, -2], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1],
    [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
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
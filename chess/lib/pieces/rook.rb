require_relative '../modules/verify'

class Rook
  include Verify
  def initialize(loc, color)
    @location = loc
    @moves = determine_moves
    @color = color
  end

  def determine_moves
    arr = []
    right_arr = determine_right
    
    move_directions.each { |i|
      loc = @location.dup
      loc[0] += i[0]
      loc[1] += i[1]
      loc = verify(loc)
      arr << loc
    }
    arr
  end

  def determine_right
    arr = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  end

  def determine_up
    arr = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
  end

  def determine_down
    arr = [[0, -1], [0, -2],[0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
  end

  def determine_left
    arr = [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
  end
end
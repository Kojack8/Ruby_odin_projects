require_relative '../modules/verify'

class BlackPawn
  include Verify
  def initialize(loc)
    @location = loc
    @moves = determine_moves
  end

  def determine_moves
    arr = []
    move_directions = [-1, -2]
    move_directions.each { |i|
      loc = @location.dup
      loc[1] += i
      loc = verify(loc)
      arr << loc
    }
    arr
  end
end
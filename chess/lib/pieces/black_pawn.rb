class BlackPawn
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
      arr << loc
    }
    arr
  end
end
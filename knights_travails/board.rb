
# creates an array containing 64 chess board spaces
class Board
  def initialize
    @root = make_board_arr
  end

  def make_board_arr
    arr = []
    for i in (0..7)
      for j in (0..7)
        arr.push([i, j])
      end
    end
    arr
  end





  attr_reader :root
end

  
# Creates a knights object that tracks its current location and all 8 possible moves it can make
class Knight
  attr_accessor :location, :moves, :children
  def initialize(location)
    # the vertex of this graph is the location aka, board square
    @location = location
    # this is just an an array of the legal moves i can make on the next immediate turn from this location
    @moves = determine_moves
    # children is an array acting as a queue tracking all the nodes left to visit and add new ones to the list
    @children = []
   
  end

  # an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list
  def create_children
    @moves.each { |i|
      if @children.include?(i) == false && i != nil
        tmp = Knight.new(i)
        @children.push(tmp)
      end
    }
    @children
  end



  def determine_moves
    ans = []
    move_directons = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    move_directons.each { |i|
      loc = @location.dup
      loc[0] += i[0]
      loc[1] += i[1]
      if loc[0] < 0 || loc[0] > 7 || loc[1] < 0 || loc[1] > 7
        loc = nil
      end
      ans.push(loc)
    }
    ans
  end
      

 

  



end
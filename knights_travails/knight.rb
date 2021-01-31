# frozen_string_literal: true

# Creates a knights object that tracks its current location and all 8 possible moves it can make
class Knight
  attr_accessor :location, :moves, :children

  def initialize(location)
    # the vertex of this graph is the location aka, board square
    @location = location
    # this is just an an array of the legal moves i can make on the next immediate turn from this location
    @moves = determine_moves
    # children is an array acting as a queue tracking all the nodes left to visit
    @children = []
  end

  # creates (up to) 8 child nodes containing the next locations
  def create_children
    @moves.each do |i|
      if @children.include?(i) == false && !i.nil?
        tmp = Knight.new(i)
        @children.push(tmp)
      end
    end
    @children
  end

  def determine_moves
    ans = []
    move_directons = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    move_directons.each do |i|
      loc = @location.dup
      loc[0] += i[0]
      loc[1] += i[1]
      loc = check_loc(loc)
      ans.push(loc)
    end
    ans
  end

  def check_loc(loc)
    return nil if (loc[0]).negative? || loc[0] > 7 || (loc[1]).negative? || loc[1] > 7

    loc
  end
end

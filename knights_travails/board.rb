
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

  def knight_moves(loc, trgt)
    @trgt = trgt
    @visited = []
    @unvisited = []
    return unless validate(loc) == true
    return unless validate(trgt) == true
    return 'winner' unless loc != @trgt
    knight = Knight.new(loc)
    @visited.push(knight)
    check_children_cycle(knight)


    
    
  end

  # should return the path array to reach the node
  def check_children_cycle(knight)
    handle_unvisited(knight)
    
    check_answer(@unvisited.shift)
    
    
  

    # if it's not there you have to create a new row of children
  end

  def check_answer(knight)
    p knight.location

    if @visited.include?(knight)
      check_answer(@unvisited.shift)
      return
    end
    if knight.location == @trgt
      p knight
      p 'HELL YEAH'
      return true
    end
    @visited.push knight
    check_children_cycle(knight)

  end

  def handle_unvisited(knight)
    knight.create_children
    knight.children.each { |i| 
      if @unvisited.include?(i) == false
        @unvisited.push(i) 
      end
    }
  end

  def check_winner(knight, path = [])

    path.push(knight.location)
    # base case
    if knight.location == @trgt
      return 'winner'
    end
  end

   

  def validate(trgt)
    return false unless trgt.is_a?(Array) && trgt[0].is_a?(Numeric) && trgt[1].is_a?(Numeric) && trgt.length == 2
    if trgt[0] < 0 || trgt[0] > 7 || trgt[1] < 0 || trgt[1] > 7
      p 'I\'m sorry. Those are invalid coordinates.'
      false
    else
      true
    end
  end





  attr_reader :root
end

  
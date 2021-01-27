# Creates a knights object that tracks its current location and all 8 possible moves it can make
class Knight
  attr_accessor :location, :left, :right
  def initialize(location)
    @location = location
    @left = nil
    @right = nil

   
  end

  def find_path(trgt, root = @location, unvisited = [])
    return nil unless validate_target(trgt) != false
    @left.each { |i| p i.location}
    p @right
    sleep(5)
    p trgt_parent = path_recurs(trgt)
  end

  def path_recurs(trgt, root = self, unvisited = [])
    unvisited = handle_unvisited(unvisited, root)
    if unvisited.include?(trgt)
      return root
    end
    for i in 0..(unvisited.length - 1)
      path_recurs(trgt, i, unvisited)
    end
  end

  def handle_unvisited(unvisited, root)
    unvisited.slice!(unvisited.index(root)) if unvisited.include?(root)
    add_unvisited(unvisited, root)
  end

  def add_unvisited(unvisited, root)
    @left.each { |i| if i != nil 
      unvisited.push(i.location) end}
    @right.each { |i| if i != nil 
      unvisited.push(i.location) end}
    unvisited
  end

    # RIGHT NOW YOUR EXPANSION OF CHILD NODES WORKS ON COMMAND WHICH PREVENTS A STACK OVERFLOW. NOW YOU MSUT COMBINED THAT WITH A BREDH FIRST SEARCH?

    # ----------------------------------------------------- STUFF BELOW THIS IS MORE LIKELY TO BE CORRECT ATM ---------------------------------------------------
  #returns an array with four identical objects 
  def dup_location(location)
    dup_arr = []
    for i in 0..3
      dup_arr.push(@location.dup)
    end
    dup_arr
  end

  def determine_right
    right_arr = create_right_arr
    node_arr = []
    for i in 0..(right_arr.length - 1)
      if right_arr[i] != nil
        node_arr.push(Knight.new(right_arr[i]))
      else
        node_arr.push(nil)
      end
    end
    @right = node_arr
  end

  def create_right_arr
    arr = []
    loc_arr = dup_location(@location)
    arr.push(move_five(loc_arr[0]))
    arr.push(move_six(loc_arr[1]))
    arr.push(move_seven(loc_arr[2]))
    arr.push(move_eight(loc_arr[3]))
    arr
  end

  def move_five(loc)
    loc[0] -= 2
    loc[1] -= 1
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def move_six(loc)
    loc[0] -= 1
    loc[1] -= 2
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def move_seven(loc)
    loc[0] += 1
    loc[1] -= 2
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def move_eight(loc)
    loc[0] += 2
    loc[1] -= 1
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def determine_left
    left_arr = create_left_arr
    node_arr = []
    for i in 0..(left_arr.length - 1)
      if left_arr[i] != nil
        node_arr.push(Knight.new(left_arr[i]))
      else
        node_arr.push(nil)
      end
    end
    @left = node_arr

  end

  def create_left_arr
    arr = []
    loc_arr = dup_location(@location)
    arr.push(move_one(loc_arr[0]))
    arr.push(move_two(loc_arr[1]))
    arr.push(move_three(loc_arr[2]))
    arr.push(move_four(loc_arr[3]))
    arr
  end

  def move_one(loc)
    loc[0] += 2
    loc[1] += 1
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def move_two(loc)
    loc[0] += 1
    loc[1] += 2
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def move_three(loc)
    loc[0] -= 1
    loc[1] += 2
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def move_four(loc)
    loc[0] -= 2
    loc[1] += 1
    return nil unless loc[0] > -1 && loc[0] < 8 && loc[1] > -1 && loc[1] < 8
    loc
  end

  def validate_target(trgt)
    return nil unless trgt.is_a?(Array) && trgt[0].is_a?(Numeric) && trgt[1].is_a?(Numeric) && trgt.length == 2
    if trgt[0] < 0 || trgt[0] > 7 || trgt[1] < 0 || trgt[1] > 7
      p 'I\'m sorry. Those are invalid coordinates.'
      false
    else
      true
    end
  end



end
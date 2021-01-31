# frozen_string_literal: true

# creates an array containing 64 chess board spaces
class Board
  attr :default

  def initialize
    @default = make_board_arr
  end

  def make_board_arr
    arr = []
    (0..7).each do |i|
      (0..7).each do |j|
        arr.push([i, j])
      end
    end
    arr
  end

  def knight_moves(loc, trgt)
    @trgt = trgt
    @visited = []
    @unvisited = []
    return unless validate(loc) == true && validate(trgt) == true
    return unless same_space(loc) != false

    knight = Knight.new(loc)
    @visited.push(knight.location)
    path = check_children_cycle(knight)
    print_answer(loc, path)
  end

  def same_space(loc)
    if loc == @trgt
      path = loc
      print_answer(loc, path)
      return false
    end
    true
  end

  def print_answer(loc, path)
    p "Knight Moves(#{loc}, #{@trgt}) == #{path}"
  end

  def check_children_cycle(knight, level_order = [])
    level_order.push(knight)
    @visited.push(knight.location)
    handle_unvisited(knight)
    check_answer(knight, level_order)
  end

  def check_answer(knight, level_order)
    if knight.location == @trgt
      path = []
      path.push(knight.location)
      return find_me(knight, level_order, path)
    end
    @visited.push(knight)
    check_children_cycle(@unvisited.shift, level_order)
  end

  def find_me(knight, level_order, path)
    level_order.each  do |i|
      if i.children.include?(knight)
        path.unshift(i.location)
        find_me(i, level_order, path)
      end
    end
    path
  end

  def handle_unvisited(knight)
    knight.create_children
    knight.children.each do |i|
      @unvisited.push(i) if @unvisited.include?(i) == false && @visited.include?(i.location) == false
    end
  end

  def validate(trgt)
    check_one = check_array(trgt)
    check_two = check_digits(trgt)
    if check_one == true && check_two == true
      true
    else
      p 'I\'m sorry. You\'ve entered an invalid coordinate. Please try again.'
      false
    end
  end

  def check_array(trgt)
    return true if trgt.is_a?(Array) && trgt[0].is_a?(Numeric) && trgt[1].is_a?(Numeric) && trgt.length == 2

    false
  end

  def check_digits(trgt)
    return false if (trgt[0]).negative? || trgt[0] > 7 || (trgt[1]).negative? || trgt[1] > 7

    true
  end
end

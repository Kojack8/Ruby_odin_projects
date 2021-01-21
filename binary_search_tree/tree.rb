# frozen_string_literal: true

require_relative 'node'
require_relative './modules/pretty_print'
# creates a balanced binary tree from an array containing numbers
class Tree
  include PrettyPrint
  def initialize(array)
    # root should use the return value FROM build tree
    @root = build_tree(array)
  end

  # this method should return he level one root node
  def build_tree(array)
    array = array.sort.uniq
    define_node(array)
  end

  def define_node(array)
    mid_index = find_mid(array)
    node = Node.new(array[mid_index])
    left_arr = array[0..(mid_index - 1)]
    right_arr = array[(mid_index + 1)..-1]
    left_node = determine_left(left_arr)
    right_node = determine_right(right_arr)
    node.left = left_node
    node.right = right_node
    node
  end

  def determine_left(array)
    array.length > 2 ? define_node(array) : left_bottom(array)
  end

  def determine_right(array)
    array.length > 2 ? define_node(array) : right_bottom(array)
  end

  def left_bottom(array)
    bottom_nodes = []
    case array.length
    when 2
      left_node = left_bottom(bottom_nodes.push(array[0]))
      Node.new(array[1], left_node)
    when 1
      Node.new(array[0])
    end
  end

  def right_bottom(array)
    bottom_nodes = []
    case array.length
    when 2
      right_node = right_bottom(bottom_nodes.push(array[1]))
      Node.new(array[0], nil, right_node)
    when 1
      Node.new(array[0])
    end
  end

  # returns the INDEX of the arrays middle value
  def find_mid(array)
    start = 0
    finish = array.length - 1
    (start + (finish - start) / 2)
  end
end

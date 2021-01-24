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

  # takes a Numeric and inserts a new node at that location
  def insert(key)
    return unless key.is_a? Numeric

    leaf_root = goto_leaf(key, @root)
    insert_new_node(key, leaf_root)
    # at the end it needs to rebalance the tree but that currently only works with arrays?
    # one of the last items on TOP list is rebalancing so i'll assume its worth doing in order
  end

  # takes the given root and traverses to where the key should be inserted the binary tree
  def goto_leaf(key, root)
    return nil unless key != root.data

    if root.left.nil? == true && root.right.nil? == true
      root
    else
      move_pointer(key, root)
    end
  end

  # moves pointer to key insertion leaf
  def move_pointer(key, root)
    if root.right.nil?
      goto_leaf(key, root.left)
    elsif root.left.nil?
      goto_leaf(key, root.right)
    elsif root.data > key
      goto_leaf(key, root.left)
    elsif root.data < key
      goto_leaf(key, root.right)
    end
  end

  def find(key, root, parent = nil)
    location = []
    location.push(root)
    location.push(parent)
    return location if root.nil? || root.data == key

    parent = root
    if root.data < key
      find(key, root.right, parent)
    else
      find(key, root.left, parent)
    end
  end

  def insert_new_node(key, root)
    new_node = Node.new(key)
    if root.data < key
      root.right = new_node
    else
      root.left = new_node
    end
  end

  def delete(key)
    # find returns an array containing [0] the root node and [1] it's parent node
    node_arr = find(key, @root)
    return if node_arr[0].nil?

    delete_mode(node_arr)
  end

  def delete_mode(node_arr)
    if node_arr[0].left.nil? && node_arr[0].right.nil?
      zero_child_del(node_arr)
    elsif node_arr[0].left.nil? || node_arr[0].right.nil?
      one_child_del(node_arr[0])
    else
      two_child_del(node_arr)
    end
  end

  # node array should contain 2 values. [0] the root node and [1] it's parent node
  def zero_child_del(node_arr)
    if node_arr[1].left == node_arr[0]
      node_arr[1].left = nil
    elsif node_arr[1].right == node_arr[0]
      node_arr[1].right = nil
    end
  end

  def one_child_del(node_arr)
    if node_arr.left.nil? == false
      node_arr.data = node_arr.left.data
      node_arr.left = node_arr.left.left
    else
      node_arr.data = node_arr.right.data
      node_arr.right = node_arr.right.right
    end
  end

  def two_child_del(node_arr)
    successor = recurs_successor(node_arr[0].right, node_arr[0].right, node_arr[0].data)
    location = find(successor.data, @root)
    node_arr[0].data = successor.data
    reassign_two_child(location)
  end

  def reassign_two_child(location)
    if location[1].left == location[0]
      location[1].left = location[1].left.left
    elsif location[1].right == location[0]
      location[1].right = location[1].right.right
    end
  end

  # obtained by finding the minimum value in the children of the relevant node

  def recurs_successor(node, succ, key)
    succ = recurs_successor(node.left, succ, key) unless node.left.nil?
    succ = recurs_successor(node.right, succ, key) unless node.right.nil?
    succ = node if node.data < succ.data && node.data > key
    succ
  end

  attr_reader :root
end

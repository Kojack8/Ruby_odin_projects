require_relative 'node'
require_relative './modules/pretty_print'
# creates a balanced binary tree from an array containing numbers
class Tree
  include PrettyPrint
  def initialize(array)
    # root should use the return value FROM build tree
    p @root = build_tree(array)
  end

  # this method should return he level one root node
  def build_tree(array)
    array = array.sort.uniq
    node = define_node(array)

    
    node
  end


  def define_node(array)
    mid_index = find_mid(array)
    node = Node.new(array[mid_index])
    left_arr = array[0..(mid_index - 1)]
    right_arr = array[(mid_index + 1)..-1]
    left_node = determine_sides(left_arr)
    right_node = determine_sides(right_arr, false)  
    node.left = left_node
    node.right = right_node
    node
  end

  def determine_sides(array, is_left = true)
    if is_left == true
      if array.length > 2
        node = define_node(array)
      else
        node = bottom_node(array)
      end
    else
      if array.length > 2
        node = define_node(array)
      else
        node = bottom_node(array, false)
      end
    end
    node
  end

  def bottom_node(array, is_left = true)
    if is_left == true
      node = left_bottom(array)
    else
      node = right_bottom(array)
    end
    node
    
  end

  def left_bottom(array)
    bottom_nodes = []
    if array.length == 2
      left_node = bottom_node(bottom_nodes.push(array[0]))
      node = Node.new(array[1], left_node)
    elsif array.length == 1
      node = Node.new(array[0])
    end
    node 
  end

  def right_bottom(array)
    bottom_nodes = []
    if array.length == 2
      right_node = bottom_node(bottom_nodes.push(array[1]), false)
      node = Node.new(array[0], nil, right_node)
    elsif array.length == 1
      node = Node.new(array[0])
    end
  end




  




  
      
      


  def find_mid(array)
    start = 0
    finish = array.length - 1
    mid = (start + (finish - start)/ 2)
  end
end
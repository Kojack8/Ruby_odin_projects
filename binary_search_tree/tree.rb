require_relative 'node'

class Tree
  def initialize(array)
    # root should use the return value FROM build tree
    p @root = build_tree(array)
  end

  # this method should return he level one root node
  def build_tree(array)
    p array
    if array.length > 3
      node = define_node(array)
      assemble_nodes(node)
    elsif array.length < 4
      node = bottom_nodes(array)
      assemble_nodes(node)
    end
    node
  end

  def assemble_nodes(node)
    if node.left != nil
      build_tree(node.left)
    end
    if node.right != nil
      node.right
      build_tree(node.right)
    end
  end

  def define_node(array)
    array = array.sort.uniq
    mid_index = find_mid(array)
    mid = array[mid_index]
    left = array[0..(mid_index - 1)]
    right = array[(mid_index + 1)..-1]
    node = Node.new(mid, left, right)
  end

  def bottom_nodes(array)
    if array.length == 3
      mid = []
      left = []
      right = []
      mid = mid.push(array[1])
      left = left.push(array[0])
      right = right.push(array[2])
      node = Node.new(mid, left, right)
    elsif array.length == 2
      mid = []
      left = []
      mid = mid.push(array[1])
      left = left.push(array[0])
      node = Node.new(mid, left)

    elsif array.length == 1
      mid = []
      mid = mid.push(array[0])
      node = Node.new(mid)
    end
    node
  end
      
      


  def find_mid(array)
    start = 0
    finish = array.length - 1
    mid = (start + (finish - start)/ 2)
  end
end
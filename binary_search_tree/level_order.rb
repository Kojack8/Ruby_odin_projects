# frozen_string_literal: true

# Breadth first level order traversal
class LevelOrder
  def initialize(tree)
    @root = tree.root
  end

  # eturns an array of values in breadth-first order
  def level_order(root = @root, unvisited = [], val_arr = [])
    unvisited = handle_unvisited(unvisited, root)
    val_arr.push(root.data) unless val_arr.include?(root.data)
    unvisited.each { |j| level_order(j, unvisited, val_arr) } unless unvisited.empty?
    val_arr
  end

  # if the root node appearsin unvisited array, it is removed
  # then adds the current nodes unvisited children to the array
  def handle_unvisited(unvisited, root)
    unvisited.slice!(unvisited.index(root)) if unvisited.include?(root)
    add_unvisited(unvisited, root)
  end

  # if either child node exists it is added to the unvisited array
  def add_unvisited(unvisited, root)
    unless root.left.nil?
      root.left.data
      unvisited.push(root.left)
    end
    unless root.right.nil?
      root.right.data
      unvisited.push(root.right)
    end
    unvisited
  end
end

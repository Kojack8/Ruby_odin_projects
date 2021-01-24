# frozen_string_literal: true
require_relative './modules/find'
# Allows you to find the height of a tree from a root. Or the depth of a root relative to the roots root
class Position
  include Find
  def initialize(root)
    @root = root
  end

  def height(root = @root, counter = 0)
    counter += 1
    x = y = 0
    if root.left != nil 
      x = height(root.left, counter)
    end
    if root.right != nil 
      y = height(root.right, counter)
    end
    counter = reassign_counter(x, y, counter)
  end

  def reassign_counter(x, y, counter)
    if x > counter
      counter = x
    end
    if y > counter
      counter = y 
    end
    counter
  end

  def depth(key, root = @root)
    x = find(key)
    return nil unless x[0] =! nil
    depth_counter(key)
  end

  def depth_counter(key, root = @root, counter = -1)
    counter += 1
    return counter unless key != @root.data
    if key > root.data && root.right != nil
      counter = depth_counter(key, root.right, counter)
    elsif key < root.data && root.left != nil
      counter = depth_counter(key, root.left, counter)
    end
    counter
  end
    
end
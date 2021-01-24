# frozen_string_literal: true

# Determines the whether or not a tree is balanced
class Balance
  include Find
  def initialize(root)
    @root = root
  end

  def balanced?(root = @root, counter = -1)
    return unless root != nil
    counter += 1
    # base case 
    if root.left != nil && root.right != nil
      return balance_bool(root.left, root.right, counter)
    end
    left = child_height(root.left)
    right = child_height(root.right)
    balance_height(left, right)
  end

  def balance_bool(root_left, root_right, counter)
    left = balanced?(root_left, counter)
    right = balanced?(root_right, counter)
    if left == true && right == true
      return true
    else
      return false
    end
  end

  def child_height(root)
    if root != nil
      position = Position.new(root)
      height = position.height
    else
      height = 0
    end
  end

  def balance_height(left_height, right_height)
    if left_height == right_height
      true
    elsif (left_height + 1) == right_height
      true
    elsif (left_height - 1) == right_height
      true
    else
      false
    end
  end
end
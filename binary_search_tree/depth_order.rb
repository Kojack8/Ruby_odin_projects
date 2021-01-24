# frozen_string_literal: true

# Depth first level order traversal
class DepthOrder
  def initialize(tree)
    @root = tree.root
  end

  def inorder(root = @root, values = [])
    inorder(root.left, values) unless root.left.nil?
    values.push(root.data)
    inorder(root.right, values) unless root.right.nil?
    values
  end

  def preorder(root = @root, values = [])
    values.push(root.data)
    preorder(root.left, values) unless root.left.nil?
    preorder(root.right, values) unless root.right.nil?
    values
  end

  def postorder(root = @root, values = [])
    postorder(root.left, values) unless root.left.nil?
    postorder(root.right, values) unless root.right.nil?
    values.push(root.data)
    values
  end
end

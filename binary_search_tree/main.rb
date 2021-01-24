# frozen_string_literal: true

require_relative 'tree'
require_relative 'level_order'
require_relative 'depth_order'

arr = []
(0..50).each do |i|
  arr.push(i * 2)
end
tree = Tree.new(arr)
tree.pretty_print
depth = DepthOrder.new(tree)
p depth.inorder
p depth.preorder
p depth.postorder

tree = Tree.new([1, 2, 3])
tree.insert(4)
tree.insert(5)
tree.pretty_print
depth = DepthOrder.new(tree)
p depth.inorder
p depth.preorder
p depth.postorder


# p '-------------------------------------------'
# tree = Tree.new([1.05, 7,999999, 4, 76, 23, 33, -8, 9, -4, 3.15, 5, 7, 9, 67.14159, -6345, 324, 23, 4, 76])
# tree.pretty_print

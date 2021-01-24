# frozen_string_literal: true

require_relative 'tree'
require_relative 'level_order'
require_relative 'depth_order'
require_relative 'position'

arr = []
(0..50).each do |i|
  arr.push(i * 2)
end
tree = Tree.new(arr)
tree.pretty_print

position = Position.new(tree)
p position.depth(52)
p position.depth(0)
p position.depth(6)
p position.depth(16)
p position.depth(76)
p position.depth(88)
p position.depth(50)









# tree = Tree.new([1.05, 7,999999, 4, 76, 23, 33, -8, 9, -4, 3.15, 5, 7, 9, 67.14159, -6345, 324, 23, 4, 76])
# tree.pretty_print

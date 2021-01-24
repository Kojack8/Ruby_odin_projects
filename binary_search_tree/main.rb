# frozen_string_literal: true

require_relative 'tree'
require_relative 'level_order'
require_relative 'depth_order'
require_relative 'position'
require_relative 'balanced'

arr = []
(1..10).each do |i|
  arr.push(i * 5)
end
tree = Tree.new(arr)







tree.pretty_print
balanced = Balance.new(tree.root)
p balanced.balanced?










# tree = Tree.new([1.05, 7,999999, 4, 76, 23, 33, -8, 9, -4, 3.15, 5, 7, 9, 67.14159, -6345, 324, 23, 4, 76])
# tree.pretty_print

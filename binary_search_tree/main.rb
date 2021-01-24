# frozen_string_literal: true

require_relative 'tree'

arr = []
(0..50).each do |i|
  arr.push(i * 2)
end
tree = Tree.new(arr)

order = LevelOrder.new(tree)
p order.level_order

p '---------------------------------------------'

 tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
 tree.pretty_print

 order = LevelOrder.new(tree)
 p order.level_order

# p '-------------------------------------------'
# tree = Tree.new([1.05, 7,999999, 4, 76, 23, 33, -8, 9, -4, 3.15, 5, 7, 9, 67.14159, -6345, 324, 23, 4, 76])
# tree.pretty_print

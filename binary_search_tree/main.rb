# frozen_string_literal: true

require_relative 'tree'
require_relative 'level_order'
require_relative 'depth_order'
require_relative 'balanced'
require_relative 'position'

def balance_print(balance)
  if balance.balanced?
    p 'This tree is balanced'
  else
    p 'This tree is NOT correctly balanced.'
  end
end
x = Array.new(15) { rand(1..100) }
tree = Tree.new(x)
tree.pretty_print
balance_print(Balance.new(tree))

level_order = LevelOrder.new(tree)
p "The order of the tree by level is #{level_order.level_order}."
depth_order = DepthOrder.new(tree)
p "The order of the tree by depth(preorder) is #{depth_order.preorder}"
p "The order of the tree by depth(inorder) is #{depth_order.inorder}"
p "The order of the tree by depth(postorder) is #{depth_order.postorder}"

p '-------------------------------------------------------------'
tree.insert(125)
tree.insert(150)
tree.insert(200)
tree.pretty_print

balance = Balance.new(tree)
balance_print(balance)
p '-------------------------------------------------------------'
tree = balance.rebalance
tree.pretty_print
balance_print(Balance.new(tree))
level_order = LevelOrder.new(tree)
p "The order of the tree by level is #{level_order.level_order}."
depth_order = DepthOrder.new(tree)
p "The order of the tree by depth(preorder) is #{depth_order.preorder}"
p "The order of the tree by depth(inorder) is #{depth_order.inorder}"
p "The order of the tree by depth(postorder) is #{depth_order.postorder}"
position = Position.new(tree.root)
p y = rand(0..14)
p "The depth of node #{x[y]} relative to the tree root is #{position.depth(x[y])}"
require_relative 'tree'

tree = Tree.new([2, 4, 6, 8, 10, 12, 14, 16, 18, 20])
tree.pretty_print
tree.insert(-4)
tree.insert(5)
tree.insert(8709)
tree.insert(19)
tree.insert(1)
tree.insert(11)
tree.insert(8710)
tree.insert(8711)
tree.insert(8712)
tree.insert(8713)
tree.pretty_print

#p '-------------------------------------------'
#tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
#tree.pretty_print


#p '-------------------------------------------'
#tree = Tree.new([1.05, 7,999999, 4, 76, 23, 33, -8, 9, -4, 3.15, 5, 7, 9, 67.14159, -6345, 324, 23, 4, 76])
#tree.pretty_print

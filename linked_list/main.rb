# frozen_string_literal: true

require_relative 'linked_list'

list = LinkedList.new

# this should fail, nodes exist
list.remove_at(0)

list.append(5)
list.append('m')
list.append(-99_999)
list.append('n')
list.insert_at(222, 0)

p "The index of the first node with the value \'-99999\' is at #{list.find(-99_999)}"

list.prepend(666)
list.prepend(111)

list.print_head
list.print_tail

p '----------------------'
p 'HERE IS YOUR CURRENT LINKED LIST'
list.print_list

p "At Node #3 you'll find the value #{list.at(2).value}"

list.pop
list.pop

p '----------------------'
p 'HERE IS YOUR POPPED LINKED LIST'
list.print_list

# s_list is similar to print_list but always ends in nil
p 'HERE IS THE TO_S LIST'
list.to_s

list.insert_at(999, 3)
# this should fail, index is out of range
list.insert_at(-1, -1)
list.insert_at(222, 0)
list.insert_at(333, 6)

p '---------------------------'
p 'HERE IS THE TO_S LIST AFTER INSERTION'
list.to_s

list.remove_at(1)
list.remove_at(0)
list.remove_at(5)
# this should fail, exist of range
list.remove_at(5)

p '--------------------------'
p 'THIS IS FINAL LIST TESTING REMOVALS'
list.to_s

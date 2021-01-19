require_relative 'linked_list'

list = LinkedList.new
list.append(5)
list.append(6)
list.append(7)
list.print_list
list.append(3)
list.append(100)
list.append("m")

p "HERE IS YOUR LINKED LIST"
list.print_list
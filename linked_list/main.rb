require_relative 'linked_list'

list = LinkedList.new



list.append(5)
list.append("m")
list.append(-99999)


list.prepend(666)
list.prepend(111)

p "HERE IS YOUR Prepended LINKED LIST"
list.print_list

p "At Node #3 you'll find the value #{list.at(2)[0].value}"
p "At Node #5 you'll find the value #{list.at(4)[0].value}"


list.pop
list.pop

p "HERE IS YOUR Popped off LINKED LIST"
list.print_list

p "Does the list contain the value 111? #{contains?(111)}"







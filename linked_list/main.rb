require_relative 'linked_list'

list = LinkedList.new



list.append(5)
list.append("m")
list.append(-99999)
list.append("n")


list.prepend(666)
list.prepend(111)


p "HERE IS YOUR Prepended LINKED LIST"
list.print_list

p "The index of the first node with the value \'m\' is at #{list.find("m")}"

p "At Node #3 you'll find the value #{list.at(2).value}"
p "At Node #5 you'll find the value #{list.at(4).value}"


list.pop
list.pop

p "HERE IS YOUR Popped off LINKED LIST"
list.print_list

p "Does the list contain the value 111? #{list.contains?(111)[0]}"
p "Does the list contain the value -111? #{list.contains?(-111)[0]}"

p "The index of the first node with the value \'m\' is at #{list.find("m")}"







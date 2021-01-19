require_relative 'node'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    x = Node.new(value)
    add_to_list(x)


  end

  def add_to_list(x)
    if @head == nil
      @head = x
    else
      last_node = traverse_list_forwards(@head)
      last_node.next_node = x
      last_node
    end
  end

  # this should go through the linked list recursively unless next_point is nil
  def traverse_list_forwards(x)
    chain = x
    if chain.next_node == nil
      chain
    else
      chain = chain.next_node
      traverse_list_forwards(chain)
    end
  end

  def print_list
    p @head.value
    chain = @head.next_node
    while chain != nil
      p chain.value
      chain = chain.next_node
    end
    
  end

 
end

require_relative 'node'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    add_to_list(new_node)
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def add_to_list(node)
    if @head == nil
      @head = node
    else
      last_node = traverse_list_forwards(@head)
      last_node.next_node = node
      last_node
    end
  end

  # goes through the linked list recursively unless next_point is nil
  def traverse_list_forwards(node)
    pointer = node
    if pointer.next_node == nil
      pointer
    else
      pointer = pointer.next_node
      traverse_list_forwards(pointer)
    end
  end

  def print_list
    p @head.value
    pointer = @head.next_node
    while pointer != nil
      p pointer.value
      pointer = pointer.next_node
    end
  end

  def size
    if @head != nil
      counter = 1
      pointer = @head.next_node
      while pointer != nil
        counter += 1
        pointer = pointer.next_node
      end
      counter
    else
      0
    end
  end

  def print_head
    if @head == nil
      p "The linked list is currently empty"
    else
      p "The first node in the linked list is #{@head}"
    end
  end

  def print_tail
    if @tail == nil
      p "The linked list is currently empty"
    else
      p "The last node in the linked list is #{@tail}"
    end
  end

  # traverse with index
  def at(index, counter = 0, pointer = @head)
    if counter == index
      pointer
    else
      pointer = pointer.next_node
      counter += 1
      at(index, counter, pointer)
    end
  end

  def pop(pointer = @head)
    if pointer.next_node == @tail
      pointer.next_node = nil
      @tail = pointer
    else
      pointer = pointer.next_node
      pop(pointer)
    end
  end

  def contains?(value, pointer = @head, counter = 0)
    if pointer.value == value
      [true, counter]
    elsif pointer.next_node != nil
      pointer = pointer.next_node
      counter += 1
      contains?(value, pointer, counter)
    else
      [false, nil]
    end
  end

  def find(value)
    contains = contains?(value)
    if contains?(value)[0] == true
      contains[1]
    else
      nil
    end

  end

  
  attr_reader :tail
 
end

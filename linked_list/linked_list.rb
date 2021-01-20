# frozen_string_literal: true

require_relative 'node'

# manages linked list using node.rb
# class is 50 lines too long && to_s and print_list are redundant
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
    if @head.nil?
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
    if pointer.next_node.nil?
      pointer
    else
      pointer = pointer.next_node
      traverse_list_forwards(pointer)
    end
  end

  def print_list
    p @head.value
    pointer = @head.next_node
    until pointer.nil?
      p pointer.value
      pointer = pointer.next_node
    end
  end

  def size(counter = 1)
    if !@head.nil?
      pointer = @head.next_node
      until pointer.nil?
        counter += 1
        pointer = pointer.next_node
      end
      counter
    else
      0
    end
  end

  def print_head
    if @head.nil?
      p 'The linked list is currently empty'
    else
      p "The first node in the linked list is #{@head}"
    end
  end

  def print_tail
    if @tail.nil?
      p 'The linked list is currently empty'
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
    elsif !pointer.next_node.nil?
      pointer = pointer.next_node
      counter += 1
      contains?(value, pointer, counter)
    else
      [false, nil]
    end
  end

  def find(value)
    contains = contains?(value)
    contains[1] if contains?(value)[0] == true
  end

  def to_s(node = @head)
    pointer = node
    if pointer.next_node.nil?
      p nil
    else
      p pointer.value
      pointer = pointer.next_node
      to_s(pointer)
    end
  end

  def insert_at(value, index)
    length = size
    if index.zero?
      prepend(value)
    elsif index == length - 1
      append(value)
    elsif index < length - 1 && index.positive?
      insert_assist(value, index)
    else
      p "I'm sorry. That index does not currently exist within this linked list."
    end
  end

  def insert_assist(value, index)
    new_node = Node.new(value)
    tmp1 = at(index - 1)
    tmp2 = at(index)
    tmp1.next_node = new_node
    new_node.next_node = tmp2
    new_node
  end

  def remove_at(index)
    length = size
    if length != 0
      remove_assist(index, length)
    else
      p 'No nodes exist in this linked list'
    end
  end

  def remove_assist(index, length)
    if index.zero?
      @head = @head.next_node
    elsif index == (length - 1)
      tmp = at(index - 1)
      tmp.next_node = nil
    elsif index < length - 1 && index.positive?
      remover(index)
    else
      p "I'm sorry. That index does not currently exist within this linked list."
    end
  end

  def remover(index)
    tmp1 = at(index)
    tmp2 = at(index - 1)
    tmp2.next_node = tmp1.next_node
  end
end

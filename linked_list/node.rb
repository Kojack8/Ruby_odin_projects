# frozen_string_literal: true

# creates new nodes containing a value and a pointer to the next item in the list
class Node
  def initialize(value)
    @value = value
    @next_node = nil
  end

  attr_reader :value
  attr_accessor :next_node
end

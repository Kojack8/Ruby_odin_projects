# frozen_string_literal: true

# creates and modifies nodes to be used within the balanced binary search tree
class Node
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
  attr_accessor :left, :right, :data
end

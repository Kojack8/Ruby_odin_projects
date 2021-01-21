class Node
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
  attr_accessor :left, :right, :data
end

  
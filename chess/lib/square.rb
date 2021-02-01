# Location is decided using tradition chess rank(row) and file(column)
class Square
  attr_reader :location
  attr_accessor :occupier
  def initialize(loc)
    @location = loc
    @occupier = nil
  end
end
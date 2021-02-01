# Location is decided using tradition chess file(column) by rank(row) 
class Square
  attr_reader :location
  attr_accessor :occupier
  def initialize(loc)
    @location = loc
    @occupier = nil
  end
end
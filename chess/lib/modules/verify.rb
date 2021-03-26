require_relative '../board'

module Verify
  def verify(loc)
    if loc[0] < 0 || loc[0] > 7 || loc[1] < 0 || loc[1] > 7
      loc = nil
    end
    loc
  end

end
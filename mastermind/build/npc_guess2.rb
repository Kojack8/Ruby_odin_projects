class NpcGuess
  def initialize
    @s = []
    @x = [1, 1, 1, 1]
  end

  def inc_zero

    i = 0
    @x = @x.map { |n|
      if i == 0
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
  end

  def inc_one
    i = 0
    @x = @x.map { |n|
      if i == 1
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
  end


  def inc_two

    i = 0
    @x = @x.map { |n|
      if i == 2
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
  end

  def inc_three
    i = 0
    @x = @x.map { |n|
      if i == 3
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
  end

  def add_arr
    @s << @x
  end
  attr_reader :s
end





class NpcGuess
  def initialize
    @counter_zero = 0
    @counter_one = 0
    @counter_two = 0
    @counter_three = 0
    @s = []
    @x = [1, 1, 1, 1]
  end

  def inc_zero

    i = 0
    @x = @x.map { |n|
      if i == 0
        n += 1
        if n == 6
          n = 1
        end
      end
      i += 1
      n
    }
    @counter_zero += 1
  end

  def inc_one
    i = 0
    @x = @x.map { |n|
      if i == 1
        n += 1
        if n == 6
          n = 1
        end
      end
      i += 1
      n
    }
    @counter_one += 1
  end


  def inc_two

    i = 0
    @x = @x.map { |n|
      if i == 2
        n += 1
        if n == 6
          n = 1
        end
      end
      i += 1
      n
    }
    @counter_two += 1
  end

  def inc_three
    i = 0
    @x = @x.map { |n|
      if i == 3
        n += 1
        if n == 6
          n = 1
        end
      end
      i += 1
      n
    }
    @counter_three += 1
  end

  def add_arr
    @s << @x
  end
  attr_reader :s
end

guess = NpcGuess.new
guess.add_arr

counter = 0
while counter < 4
  y = guess.inc_three
  counter += 1
  guess.add_arr
end

counter = 0
while counter < 4
  y = guess.inc_two
  i = 0
  while i < 5
    y = guess.inc_three
    i += 1
    guess.add_arr
  end
  counter += 1
end


puts guess.s.to_s



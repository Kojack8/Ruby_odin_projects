module Generator
  def inc_zero(guess)
    i = 0
    guess = guess.map { |n|
      if i == 0
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
    return guess
  end

  def inc_one(guess)
    i = 0
    guess = guess.map { |n|
      if i == 1
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
    return guess
  end


  def inc_two(guess)
    i = 0
    guess = guess.map { |n|
      if i == 2
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
    return guess
  end

  def inc_three(guess)
    i = 0
    guess = guess.map { |n|
      if i == 3
        n += 1
        if n == 7
          n = 1
        end
      end
      i += 1
      n
    }
    return guess
  end
end
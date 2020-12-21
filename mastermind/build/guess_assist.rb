require_relative 'npc_guess2'

guess = NpcGuess.new
guess.add_arr

# first round
counter = 0
while counter < 5
  y = guess.inc_three
  counter += 1
  guess.add_arr
end
# second round
counter = 0
while counter < 5
  y = guess.inc_two
  i = 0
  while i < 6
    y = guess.inc_three
    i += 1
    guess.add_arr
  end
  counter += 1
end

# third round
counter = 0
while counter < 5
  guess.inc_one
  j = 0
  while j < 6
    y = guess.inc_two
    i = 0
    while i < 6
      y = guess.inc_three
      i += 1
      guess.add_arr
    end
    j += 1
  end
  counter += 1
end

puts "HERE WE GO ASSHOLE "

# fourth round
counter = 0
while counter < 5 
  guess.inc_zero
  k = 0
  while k < 6
    guess.inc_one
    j = 0
    while j < 6
      y = guess.inc_two
      i = 0
      while i < 6
        y = guess.inc_three
        i += 1
        guess.add_arr
      end
      j += 1
    end
    k += 1
  end
  counter += 1
end




puts guess.s.to_s
puts guess.s.length


z = guess.s
z.uniq!
puts z.length

puts z[1].to_s
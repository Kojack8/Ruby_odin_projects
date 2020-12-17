# frozen_string_literal: true
require_relative 'compare_answer'
require_relative 'check_winner'
require_relative 'take_input'
class HumanGuess
  include CheckWinner, TakeInput
  def initialize(key, player)
    @key = key
    @player = player
    @guess_counter = 0
    @winner = false
    # @final (to be renamed?) will be an array containing [bool, num]
    # bool is true of false whether or not the current guess phase should end
    # and num is the number of points to add onto the scoreboard
    @final
  end
  def human_guess
    p 'KEY?!?!? ' + @key.to_s
    while @guess_counter < 12 && @winner == false
      @guess_counter += 1
      puts ' _____________ '
      puts '|             |'
      puts '| 1 - RED     |'
      puts '| 2 - GREEN   |'
      puts '| 3 - BLUE    |'
      puts '| 4 - WHITE   |'
      puts '| 5 - YELLOW  |'
      puts '|_____________|'
      puts "Guess ##{@guess_counter}/12 for Agent #{@player}. Using the numbers below enter your four guesses" \
      ' one at a time.'
      answer = take_input
      # not winning returns false
      # I THINK THIS WHOLE THING WILL PROBABLY RETURN FALSE TO THE PARENT CLASS/METHOD
     if check_winner(@key, answer) == true 
        @winner = true
        break
      end
      p 'KEY?!?!? ' + @key.to_s
      compare = CompareAnswer.new(@key, answer)
      comparison = compare.run_comparison
      puts 'WHAT FOLLOWS SHOULD BE THE COMPARISON ARRAY'
      p comparison
    end
    @guess_counter
  end
  
end
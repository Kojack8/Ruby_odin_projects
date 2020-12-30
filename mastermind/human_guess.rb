# frozen_string_literal: true

require_relative 'compare_answer'
require_relative 'check_winner'
require_relative 'take_input'
# Recieves human guess and compares it to the key
class HumanGuess
  include TakeInput
  include CheckWinner
  def initialize(key, player)
    @key = key
    @player = player
    @guess_counter = 0
    @winner = false
  end

  def human_guess
    while @guess_counter < 12 && @winner == false
      @guess_counter += 1
      puts ' _____________ '
      puts '|             |'
      puts '| 1 - RED     |'
      puts '| 2 - GREEN   |'
      puts '| 3 - BLUE    |'
      puts '| 4 - CYAN    |'
      puts '| 5 - YELLOW  |'
      puts '| 6 - MAGENTA |'
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
      compare = CompareAnswer.new(@key, answer)
      comparison = compare.run_comparison
      puts 'WHAT FOLLOWS SHOULD BE THE COMPARISON ARRAY'
      p comparison
    end
    # gives a bonus point if you go the whole round without getting any
    @guess_counter += 1 if @guess_counter == 12
    @guess_counter
  end
end

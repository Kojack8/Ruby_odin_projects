# frozen_string_literal: true
require_relative 'compare_answer'
require_relative 'check_winner'
require_relative 'take_input'
class HumanGuess
  include CheckWinner, TakeInput
  def initialize(key, player)
    # these are always either 12 rounds long or until you get the correct answer
    # removed an arg guess_counter that needs to be added directly into this method!!!
    p 'KEY?!?!? ' + key.to_s
    guess_counter = 0
    while guess_counter < 12
      guess_counter += 1
      puts ' _____________ '
      puts '|             |'
      puts '| 1 - RED     |'
      puts '| 2 - GREEN   |'
      puts '| 3 - BLUE    |'
      puts '| 4 - WHITE   |'
      puts '| 5 - YELLOW  |'
      puts '|_____________|'
      puts "Guess ##{guess_counter}/12 for Agent #{player}. Using the numbers below enter your four guesses" \
      ' one at a time.'
      answer = take_input
      check_winner(key, answer)
      p 'KEY?!?!? ' + key.to_s
      comparison = CompareAnswer.new(key, answer)
      puts 'WHAT FOLLOWS SHOULD BE THE COMPARISON ARRAY'
      p comparison
    end
  end
  
end
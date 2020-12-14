# frozen_string_literal: true

require_relative 'user_input'

class GameRun
  include UserInput
  def initialize(game_mode, key)
    p game_mode
    p key
    @player_one_score = 0
    @player_two_score = 0
    human_turn(key)
  end

  # THIS IS THE KEY
  def human_turn(key)
    puts ' _____________ '
    puts '|             |'
    puts '| 1 - RED     |'
    puts '| 2 - GREEN   |'
    puts '| 3 - BLUE    |'
    puts '| 4 - WHITE   |'
    puts '| 5 - YELLOW  |'
    puts '|_____________|'
    puts "It's your turn to guess. Using the numbers below enter your four guesses" \
    ' one at a time.'
    answer = take_input
    @comparison = compare_answer(key, answer)
  end

  # 2 = RED PEG - Correct color and location
  # 1 = WHITE PEG - Correct color; incorrect location
  # 0 = NO PEG - Wrong color and location
  def compare_answer(key, answer)
    comparison = []
    successful_colors = []
    round_end if answer == key
    # creates 2 arrays. one which will contain the feedback peg colors and another
    # which will help validate 'correct color and incorrect placement' choices
    (0..3).each do |i|
      if answer[i] == key[i]
        comparison.push(2)
        successful_colors.push(answer[i])
      else
        comparison.push(nil)
      end
    end
    # removes successful matches from both arrays for just color check
    successful_colors.each do |x|
      key.slice!(key.index(x))
      answer.slice!(answer.index(x))
    end
    # Take the comparison array and maps nils to 1 for correct color
    # or 0 for no correct features
    supercounter = -1
    comparison.map! do |x|
      counter = 0
      correct_colors = []
      while counter < answer.length
        correct_colors.push(check_color(answer[counter], key))
        counter += 1
      end
      if x.nil?
        supercounter += 1
        x = if correct_colors[supercounter] == true
              1
            else
              0
            end
      else
        x = x
      end
    end
    # returns completed array to parent function self.METHOD_turn
    comparison
  end

  def check_color(answer, key)
    if key.include?(answer)
      true
    else
      false
    end
  end

  def round_end
    puts 'YOU HAVE SUCCESSFULLY CRACKED THE CODE'
  end
end

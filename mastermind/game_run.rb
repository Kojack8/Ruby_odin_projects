# frozen_string_literal: true

require_relative 'user_input'
require_relative 'compare_answer'

class GameRun
  include CompareAnswer
  include UserInput
  def initialize(game_mode, key)
    p game_mode
    p key
    @player_one_score = 0
    @player_two_score = 0
    @confirmed_wrong_loc = {}
  end

  def player_one_plus
    @player_one_score += 1
  end

  def player_two_plus
    @player_two_score += 1
  end

  def human_guess(key, guess_counter, player, player_points)
    if player_points == 1
      player_one_plus
    else
      player_two_plus
    end
    puts ' _____________ '
    puts '|             |'
    puts '| 1 - RED     |'
    puts '| 2 - GREEN   |'
    puts '| 3 - BLUE    |'
    puts '| 4 - WHITE   |'
    puts '| 5 - YELLOW  |'
    puts '|_____________|'
    puts "Guess ##{guess_counter + 1}/12 for Agent #{player}. Using the numbers below enter your four guesses" \
    ' one at a time.'
    answer = take_input
    if answer == key
      round_end
      return true
    end
    @comparison = compare_answer(key, answer)
    puts 'WHAT FOLLOWS SHOULD BE THE COMPARISON ARRAY'
    p @comparison
    false
  end

  def round_end
    puts 'YOU HAVE SUCCESSFULLY CRACKED THE CODE'
  end

  # npc starts by guess 4 colors at random
  # it memorizes correct (RED) comparisons and will attempt to reuse white elsewhere
  def npc_guess(key, guess_counter, player_points)
    if player_points == 1
      player_two_plus
    else
      player_one_plus
    end
    puts "This is Agent Ruby's guess ##{guess_counter + 1}/12."
    sleep(2)
    puts 'Agent Ruby is finalizing their guess.'
    # THIS PART DETERMINES WHETHER TO START FROM A BLANK ARRAY OR USE SOMETHING PASSED IN
    if guess_counter.zero?
      colors = [1, 2, 3, 4, 5]
      @answer = []
      (0..3).each do |_i|
        @answer.push(colors[rand(5)])
      end
      p "NPC ANSWER#{@answer}"
      @comparison = compare_answer(key, @answer)
      p "COMPARISON ONE = #{@comparison}"
    else
      counter = -1
      confirmed_wrong_colors = []
      @answer.map! do |x|
        counter += 1
        case @comparison[counter]
        when 2
          x = x

        when 1
          # key is the space-number and the values are an array which contains the colors
          # that the npc should not guess at the keys location again
          begin
            @confirmed_wrong_loc[counter] << x
          rescue StandardError
            @confirmed_wrong_loc[counter] = [x]
          end
          x = intel_guess(confirmed_wrong_colors, counter)

          # if at the location of this comparison the value is nil
          # that means the color and location is wrong
          # so the color in the answer at the same location can be added to the wrong
          # array
        else
          confirmed_wrong_colors.push(x)
          x = intel_guess(confirmed_wrong_colors, counter)

        end
      end
      p 'NPC ANSWER ' + @answer.to_s
      @comparison = compare_answer(key, @answer)
      p @comparison
      if @answer == key
        round_end
        return true
      end
    end
    false
  end

  # NPC maintains an array of possible answers
  # Any number that is determined to definetly not be in the key is sliced out
  def intel_guess(confirmed_wrong_colors, counter)
    possible_answers = [1, 2, 3, 4, 5]
    possible_answers.each do |x|
      possible_answers.slice!(possible_answers.index(x)) if confirmed_wrong_colors.include?(x)
    end
    final = guess_possibles(possible_answers, counter)
  end

  # Takes the array of possible answers minus answers we know won't be included
  def guess_possibles(possible_answers, counter)
    # Generates one random number from that array
    answer = possible_answers[rand(0..(possible_answers.length - 1))]
    if @confirmed_wrong_loc.key?(counter)
      # Checks the WHITE PEG hash to see if this color in this location is a repeat
      if @confirmed_wrong_loc[counter].include?(answer)
        # if it is, just rerun the whole thing
        answer = guess_possibles(possible_answers, counter)
      else
        # stores answer not to be repeated
        begin
          @confirmed_wrong_loc[counter] << answer
        rescue StandardError
          @confirmed_wrong_loc[counter] = [answer]
        end
      end
    end
    # stores answer not to be repeated
    begin
      @confirmed_wrong_loc[counter] << answer
    rescue StandardError
      @confirmed_wrong_loc[counter] = [answer]
    end
    
    return answer
  end


  attr_reader :player_one_score, :player_two_score
end

class Child < GameRun

end

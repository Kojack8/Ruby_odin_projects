# frozen_string_literal: true

require_relative 'user_input'
require_relative 'compare_answer'

class GameRun
  include UserInput, CompareAnswer
  def initialize(game_mode, key)
    p game_mode
    p key
    @player_one_score = 0
    @player_two_score = 0
  end

  def human_guess(key, guess_counter, player, player_points)
    if player_points == 1
      @player_two_score += 1
    else
      @player_one_score += 1
    end
    puts ' _____________ '
    puts '|             |'
    puts '| 1 - RED     |'
    puts '| 2 - GREEN   |'
    puts '| 3 - BLUE    |'
    puts '| 4 - WHITE   |'
    puts '| 5 - YELLOW  |'
    puts '|_____________|'
    puts "Guess ##{(guess_counter + 1)}/12 for Agent #{player}. Using the numbers below enter your four guesses" \
    ' one at a time.'
    answer = take_input
    if answer == key
      round_end
      return true
    end
    comparison = compare_answer(key, answer)
    puts "WHAT FOLLOWS SHOULD BE THE COMPARISON ARRAY"
    p comparison
    return false
  end

  

  def round_end
    puts 'YOU HAVE SUCCESSFULLY CRACKED THE CODE'
  end


  public
  # npc starts by guess 4 colors at random
  # it memorizes correct (RED) comparisons and will attempt to reuse white elsewhere
  def npc_guess(key, guess_counter, player_points)
  p "KEY" + key.to_s
    if player_points == 1
    @player_two_score += 1
  else
    @player_one_score += 1
  end
  puts "This is Agent Ruby's guess ##{(guess_counter + 1)}/12."
  sleep(2)
  puts "Agent Ruby is finalizing their guess."
  # THIS PART DETERMINES WHETHER TO START FROM A BLANK ARRAY OR USE SOMETHING PASSED IN
  if guess_counter == 0
    colors = [1, 2, 3, 4, 5]
    answer = []
    (0..3).each do |_i|
      answer.push(colors[rand(5)])
    end
    comparison = compare_answer(key, answer)
    p "NPC GUESS = " + answer.to_s
    p "Comparison generated for NPC (NEEDED FOR LIGHTS FOR USERS SATISFACTION!!!!!"
    p comparison
  else
    counter = 0
    confirmed_wrong_loc = {}
    confirmed_wrong_colors = []
    p "ANSWER PHASE TWO" + answer.to_s
    answer = answer.map { |x|
      
      if comparison[counter] == 2
        x = x

      elsif comparison[counter] == 1
        # key is the space-number and the values are an array which contains the colors
        # that the npc should not guess at the keys location again
        begin 
          confirmed_wrong_loc[counter] << x
        rescue 
          confirmed_wrong_loc[counter] = [x]
        end
        # temp_guess = [1, 2, 3, 4, 5]
        temp_guess =
        x = intel_guess(confirmed_wrong_loc, confirmed_wrong_colors)


        # if at the location of this comparison the value is nil
        # that means the color and location is wrong
        # so the color in the answer at the same location can be added to the wrong
        # array
      else
        confirmed_wrong_colors.push(x)
        x = intel_guess(confirmed_wrong_loc, confirmed_wrong_colors)
     
      end
      counter += 1
    }
  end
  # IT DOESN'T ACTUALLY RUN THE COMPARISON UNTIL ALL THE DOWN HERE
  
  false
  end

  def intel_guess(confirmed_wrong_loc, confirmed_wrong_colors)
    p "WRONG LOCS" + confirmed_wrong_loc.to_s
    p "WRONG COLORS" + confirmed_wrong_colors.to_s
  end

  attr_reader :player_one_score, :player_two_score
end

# frozen_string_literal: true

require_relative 'user_input'

class GameRun
  include UserInput
  def initialize(game_mode, key)
    p game_mode
    p key
    @player_one_score = 0
    @player_two_score = 0
  end

  # THIS IS THE KEY
  def human_guess(key,guess_counter)
    puts ' _____________ '
    puts '|             |'
    puts '| 1 - RED     |'
    puts '| 2 - GREEN   |'
    puts '| 3 - BLUE    |'
    puts '| 4 - WHITE   |'
    puts '| 5 - YELLOW  |'
    puts '|_____________|'
    puts "Guess ##{(guess_counter + 1)}/12. Using the numbers below enter your four guesses" \
    ' one at a time.'
    answer = take_input
    if answer == key
      round_end
      return true
    end
    @comparison = compare_answer(key, answer)
    puts "WHAT FOLLOWS SHOULD BE THE COMPARISON ARRAY"
    p @comparison
    return false
  end

  # 2 = RED PEG - Correct color and location
  # 1 = WHITE PEG - Correct color; incorrect location
  # 0 = NO PEG - Wrong color and location
  def compare_answer(key, answer)
    key_save = []
    counter = 0
    while counter < 4
      key_save.push(key[counter])
      counter += 1
    end
    comparison = []
    successful_colors = []
    # creates 2 arrays. one which will contain the feedback peg colors and another
    # which will help validate 'correct color and incorrect placement' choices
    (0..3).each do |i|
      if answer[i] == key[i]
        comparison.push(2)
        successful_colors.push(answer[i])
      else
        successful_colors.push(nil)
        comparison.push(nil)
      end
    end
  
    # removes successful matches from both arrays for just color check
    #successful_colors.each do |x|
    #  key.slice!(key.index(x))
    #  answer.slice!(answer.index(x))
    #end
    # Take the comparison array and maps nils to 1 for correct color
    # or 0 for no correct features
    correct_colors = check_color(answer, key)
    p "CORRECT COLORS"
    p correct_colors
    
    supercounter = -1
    p comparison
    comparison.map! do |x|
      supercounter += 1
      if x.nil?
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

  # CHECK COLOR DOESN'T WORK RIGHT. THIS IS WHERE YOU LEFT OFF
  def check_color(answer, key)
    temp_key = []
    temp_answer = []
    i = 0
    while i < 4
      temp_key.push(key[i])
      temp_answer.push(key[i])
      i += 1
    end
    final = []

    temp_key.map! { |x| 
      counter = 0
      while counter < 4
        if x == answer[counter]
          x = nil
        else
          x = x
        end
        counter += 1
      end
    }

    temp_answer.map! { |x|
      counter = 0
      while counter < 4
        if temp_key[counter] == nil
          x = nil
        else
          x = x
        end
        counter += 1
      end
    }

    counter = 0
    while counter < 4
      if temp_key.include?(answer[counter])
        temp_key.map! { |x| 
            if x == answer[counter]
              x = nil
            else
              x = x
            end
        }
        temp_answer.map! { |x|
          if temp_key[counter] == nil
            x = nil
          else
            x = x
          end
        }
        final.push(true)
      else
        final.push(false)
      end
      counter += 1
    end

    p "COLOR CHECK"
    p final
    return final
  end

  def round_end
    puts 'YOU HAVE SUCCESSFULLY CRACKED THE CODE'
  end
end

public
# npc starts by guess 4 colors at random
# it memorizes correct (RED) comparisons and will attempt to reuse white elsewhere
def npc_guess(key, guess_counter)
  puts "This is Agent Ruby's guess ##{(guess_counter + 1)}/12."
  sleep(2)
  puts "Agent Ruby is finalizing their guess."
  # needs to determind if computers first guess this turn
  # if yes just guess at random
  # if no checks @comparison
  # for colors at positions w/ 2 repeat guess
  if guess_counter == 0
    colors = [1, 2, 3, 4, 5]
    answer = []
    (0..3).each do |_i|
      answer.push(colors[rand(5)])
    end
  else
    counter = 0
    confirmed_wrong_loc = {}
    answer = answer.map { |x|
      
      if @comparison[counter] == 2
        x = x
      elsif @comparison[counter] == 1
        # key is the space-number and the values are an array which contains the colors
        # that the npc should not guess at the keys location again
        begin 
          confirmed_wrong_loc[counter] << x
        rescue 
          confirmed_wrong_loc[counter] = [x]
        end
        x = nil
      else
        x = nil        
      end
      counter += 1
    }
    p answer
    

  end
  @comparison = compare_answer(key, answer)
  p "KEY"
  p key
  p "NPC ANSWER"
  p answer
  p "Comparison array"
  p @comparison
end

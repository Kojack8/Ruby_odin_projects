# frozen_string_literal: true
require_relative 'compare_answer'
require_relative 'check_winner'

class NPCGuess
  include CheckWinner
  # npc starts by guess 4 colors at random
  # it memorizes correct (RED) comparisons and will attempt to reuse white elsewhere
  def initialize(key)
    @key = key
    @answer = [1, 1, 2, 2]
    @guess_counter = 0
    @winner = false
  end
  
  # removing all 3 args that originally started this method. this will be messy
  # need to built in a guess counter somewhere again
  # THINGS WORK BETTER NOW BUT THE NEXT THING I HAVE TO DO IS CREATE THE ROUND COUNTER
  # WHERE I LEFT OFF- THIS FUNCITON IS DEF MISSING AN END SOMEWHERE. WHILE PAIRS WITH FINAL END
  def npc_guess
    while @guess_counter < 12 && @winner == false
      puts "This is Agent Ruby's guess ##{@guess_counter + 1}/12."
      sleep(2)
      puts 'Agent Ruby is finalizing their guess.'
      
      unless @guess_counter.zero?
      
        
      end

      # ############################
      # EVERYTHING FROM HERE DOWN SHOULD WORK CORRECTTLY
      @guess_counter += 1
      compare = CompareAnswer.new(@key, @answer)
      @comparison = compare.run_comparison
      if check_winner(@key, @answer) == true 
        @winner = true
        break
      end
    end
    # gives a bonus point if you go the whole round without getting any
    if @guess_counter == 12
      @guess_counter += 1
    end
    @guess_counter
  end

  # COMPARE ANSWER ACTUALLY WORKS OKAY, BUT INTEL-GUESS IS TOTALLY WRONG!
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
end
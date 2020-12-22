# frozen_string_literal: true
require_relative 'compare_answer'
require_relative 'check_winner'
require_relative './knuth/knuth_initial'
require_relative './knuth/knuth_comparison'

class NPCGuess
  include CheckWinner
  def initialize(key)
    @key = key
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
      # Creates an array containing all 1296 possible guesses
      knuth = KnuthInitial.new
      knu_arr = knuth.generator
      
      if @guess_counter.zero?
        @guess_counter += 1
        guess = [1, 1, 2, 2]
        compare = CompareAnswer.new(@key, guess)
        @comparison = compare.run_comparison
        knu_arr.slice!(knu_arr.index(guess))
        knuthcomparison = KnuthComparison.new

        comparison_arr = knuthcomparison.run_comparison(@key, knu_arr)
        # knu_arr_two contains the all the arrays that match the comparison return
        knu_arr_two = knuthcomparison.remove_comparisons(knu_arr, comparison_arr, @comparison)

        p @comparison
      elsif @guess_counter == 1
        @possibilities_arr = knuthcomparison.default_possibilities
        @g_score_arr = []
        knu_arr.each { |g| 
          g.each{ |x|
            compare = CompareAnswer.new(x, g)
            compare = compare.run_comparison
            @possibilities_arr = knuthcomparison.calc_possibilities(compare, @possibilities_arr)
            # this is the least informative possible result of guessing g
            g_score = @possibilities_arr.sort_by { |k, v| v }.last
            p "G SCORE " + g_score.to_s
            
          }
          # THIS IS ON THE TRAIL OF SOMETHING BUT G SCORE IS NOT YET CORRECT
          
          @possibilities_arr = knuthcomparison.default_possibilities
          p @g_score_arr
        }
       

        



        



      end

      if check_winner(@key, @answer) == true 
        @winner = true
        break
      end

      

      
    end
    @guess_counter
  end

      
end
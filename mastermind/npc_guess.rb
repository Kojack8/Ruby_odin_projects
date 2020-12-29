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

      
      if @guess_counter.zero?
        knuth = KnuthInitial.new
        knu_arr = knuth.generator
        untried_codes = knu_arr.dup
        @guess_counter += 1
        guess = [1, 1, 2, 2]
        compare = CompareAnswer.new(@key, guess)
        comparison = compare.run_comparison

        knu_arr.slice!(knu_arr.index(guess))
        untried_codes.slice!(untried_codes.index(guess))


        # Removes from S any code that wuld not give the same response if the current guess were the code
        knuthcomparison = KnuthComparison.new
        comparison_arr = knuthcomparison.run_comparison(comparison, guess, knu_arr)

        knu_arr = knuthcomparison.remove_comparisons(knu_arr, comparison_arr)

        p comparison
      else
        @guess_counter += 1
        # MOSTLY THIS WHOLE STEP NEEDS TO BE REWRITTEN. THIS SHOULD BE THE START OF STEP 6
        # I ALSO NEED TO MAKE SURE THAT ANYTHING THAT SATISFIES STEP 5 GOING FORWARD IS REPEATED. THATS IT

        @possibilities_arr = knuthcomparison.default_possibilities
        @g_score_arr = []
        for i in 0..(untried_codes.length - 1)
          guess = untried_codes[i]
          for j in 0..(knu_arr.length - 1)
            hidden_code = knu_arr[j]
            compare = CompareAnswer.new(hidden_code, guess)
            compare = compare.run_comparison
            @possibilities_arr = knuthcomparison.calc_possibilities(compare, @possibilities_arr)
          end
          guess = @possibilities_arr.sort_by { |k, v| v }.last
          @g_score_arr << guess[1]
          
          @possibilities_arr = knuthcomparison.default_possibilities
        end
        p "G SCORE" + @g_score_arr.to_s
        p "G SCORE LEN" + @g_score_arr.length.to_s
        p "ORG ARR LEN" + untried_codes.length.to_s
        p "UNTRIED" + untried_codes.to_s
        g_min = @g_score_arr.min
        p "G MIN? " + g_min.to_s
        @final_choices = []
        counter = 0
        @g_score_arr.each { |i|
          
          if i == g_min
            @final_choices << untried_codes[counter]
          end
        
          counter += 1
        }
        p "FINAL CHOICE ARRAY 1"
        p @final_choices
        p "FINAL CHOICE ARRAY 2"
        p @final_choices = @final_choices.sort_by { |a, b| a }
        @final_choices = @final_choices.sort_by { |a, b| a }
        final_bool = false
        @final_choices.each { |i| 
          knu_arr.each { |j| 
            if i == j
              guess = i
              final_bool = true
              break
            end
          }
        }
        if final_bool == false
          guess = @final_choices.first
        end

        #guess needs to be a little more complicated. it should take the first element in final choices that also exists in knu_arr
        untried_codes.slice!(untried_codes.index(guess))

        p "Agent Ruby has submitting their final guess."
        p guess.to_s
        comparison = CompareAnswer.new(@key, guess)
        comparison = comparison.run_comparison
        p compare.to_s

        knuthcomparison = KnuthComparison.new
        comparison_arr = knuthcomparison.run_comparison(comparison, guess, knu_arr)
        p "KNNNU ARR " + knu_arr.to_s
        p comparison_arr
        knu_arr = knuthcomparison.remove_comparisons(knu_arr, comparison_arr)
        p "END OF ROUND KNU ARR"
        p knu_arr.to_s

      end

      if check_winner(@key, guess) == true 
        @winner = true
        break
      end

      
     

      p "KNU ARR" + knu_arr.length.to_s
      p "ORG AGG" + untried_codes.length.to_s

      

      
    end
    @guess_counter
  end

      
end
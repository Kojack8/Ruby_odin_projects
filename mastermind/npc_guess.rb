# frozen_string_literal: true
require_relative 'compare_answer'
require_relative 'check_winner'
require_relative './knuth/knuth_initial'

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
      
      if @guess_counter.zero?
        @guess_counter += 1
        compare = CompareAnswer.new(@key, [1, 1, 2, 2])
        @comparison = compare.run_comparison
        p "COMPARE = " + @comparison.to_s
      else
        knuth = KnuthInitial.new
        knu_arr = knuth.generator
        p knu_arr
        p knu_arr.length



      end

      if check_winner(@key, @answer) == true 
        @winner = true
        break
      end

      

      
        
    end
    @guess_counter
  end

      
end
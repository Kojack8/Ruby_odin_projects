require_relative 'human_guess'
require_relative 'display'
require_relative 'revealed'

class GameRun
  def initialize(key)
    @key = key
    @display = Display.new
    @guess_count = 0
  end

  
  def game_run
    validate_arr = game_round
    game_end
  end

  # it should display the revealed_letters str at the start of each round
  def game_round
    revealed = Revealed.new(@key)
    revealed.new_revealed_key
    human_guess = HumanGuess.new
    validator = false
    while @guess_count < 7 && validator == false
      user_guess = human_guess.guess
      if check(user_guess) == true
        display_answer = revealed.reveal_letter(user_guess)
        unless display_answer.include?("__  ")
          validator = true
        end
        @guess_count -= 1
      else
        @display.portray(@guess_count)
      end
      revealed.print_revealed
      @guess_count += 1
    end
  end

  def check(guess)
    if @key.include?guess
      true
    else 
      false
    end
  end

  def game_end
    if @guess_count == 7
      puts "Game Over. Please try again."
    else
      puts "Congratulations! #{@key} is the correct answer."
    end
  end

  
end
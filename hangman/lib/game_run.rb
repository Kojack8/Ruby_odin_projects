require_relative 'human_guess'
require_relative 'display'
require_relative 'revealed'

class GameRun
  def initialize(key)
    @key = key
    @display = Display.new
  end

  
  def game_run
    validate_arr = game_round
    game_end
  end

  # it should display the revealed_letters str at the start of each round
  def game_round
    revealed = Revealed.new(@key)
    puts revealed.revealed_key.join(" ")
    human_guess = HumanGuess.new
    guess_count = 0
    while guess_count < 6
      user_guess = human_guess.guess
      if check(user_guess) == true
        p revealed.reveal_letter(user_guess).join(" ")
      end


      
      guess_count += 1
    end
  end

  def check(guess)
    if @key.include?guess
      true
    else 
      false
    end
  end

  
end
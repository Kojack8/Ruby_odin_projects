require_relative 'human_guess'

class GameRun
  def initialize(key)
    @key = key
    @guess_count = 0
  end
# ask the user if they want to see the rules before the game starts

  # when game runs. key is locked in
  # displays the guess count and current answer
  # asks the user if they want to guess a letter or the whole word
  # guess the whole word incorrectly will result in an instant game over
  # guess a letter and repeat this loop until the game ends
  def game_run
    human_guess = HumanGuess.new
    while @guess_count < 6
      human_guess.guess
      @guess_count += 1
    end
  end
end
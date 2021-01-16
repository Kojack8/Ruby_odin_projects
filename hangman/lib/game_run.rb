require_relative 'human_guess'
require_relative 'compare_answer'
require_relative 'display'

class GameRun
  def initialize(key)
    @key = key
  end
# ask the user if they want to see the rules before the game starts

  
  def game_run
    validate_arr = game_round
    game_end(validate_arr)
  end

  def game_round
    human_guess = HumanGuess.new
    guess_count = 0
    validator = false
    hidden_letters = generate_hidden
    while guess_count < 6 && validator == false
      # guess will return an array containing [int, "str"]. If the int is 0 the guess is a single letter
      # if the int is 1 the guess is for the whole world. str contains the guess
      result = human_guess.guess
      compare = CompareAnswer.new(@key, result, hidden_letters)
      validate_arr = compare.compare_answer
      validator = validate_arr[0]
      guess_count += 1
    end
    validate_arr
  end

  def generate_hidden
    hidden_letters = []
    for j in 0..(@key.length - 1)
      hidden_letters.push(@key[j])
    end
    hidden_letters
  end

  def game_end(validate_arr)
    if validate_arr[1] == true 
      final = @key.clone.capitalize
      puts "\'#{@key}\' is correct."
      puts "Excellent work. Your vocabulary saved that man's life."
    else 
      # THIS SHOULD BE THE GAME OVER FUNCTION AND SHOULD PROBABLY MOSTLY USE DISPLAY????
      puts "Game over, you lose."
    end
  end
end
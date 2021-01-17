# frozen_string_literal: true

# Accepts and validates user guess w/ regex
class HumanGuess
  def guess
    valid = false
    while valid == false
      guess = gets.chomp
      valid = validate_guess(guess)
    end
    guess
  end

  def validate_guess(pc_guess)
    if pc_guess.length != 1
      guess_error
      false
    elsif pc_guess =~ /[a-zA-Z]/
      true
    else
      guess_error
      false
    end
  end

  def guess_error
    puts "I'm sorry. That's an invalid entry. Please try again."
  end
end

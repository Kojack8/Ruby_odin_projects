class HumanGuess

  def guess
    switch_guess_txt
    valid = false
    while valid == false
      pc_guess = gets.chomp
      valid = validate_guess(pc_guess)
    end
    if pc_guess.to_i == 1
      guess_word
    else
      pc_guess
    end
  end

  def switch_guess_txt
    puts "If you'd like to guess the whole word, enter the number 1 now."
    puts "Otherwise, make your guess for any remaining correct letters."
  end

  def validate_guess(pc_guess)
    if pc_guess.length != 1
      guess_error
      false
    elsif pc_guess.to_i < 0 || pc_guess.to_i > 1
      guess_error
      false
    else
      true
    end
  end

  def guess_word
    puts "Enter your final guess now. Be careful. If you're wrong, it's game over."
    puts "Or type 1 to cancel and go back to guessing letters."
    final_guess = gets.chomp
    if final_guess.to_i == 1
      guess
    else
      #this should submit the final guess but to where? idk
    end
  end


  def guess_error
    puts "I'm sorry. That's an invalid entry. Please try again."
  end


end
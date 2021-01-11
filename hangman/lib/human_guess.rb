class HumanGuess

  def guess
    switch_guess_txt
    user_guess
  end

  def switch_guess_txt
    puts "If you'd like to guess the whole word, enter the number 1 now."
    puts "Otherwise, make your guess for any remaining correct letters."
  end

  def user_guess
    pc_guess = gets.chomp
    
  end

  def guess_letter
    #TODO
  end

  def guess_word
    puts "Enter your final guess now. Be careful. If you're wrong, it's game over."
    puts "Or type STOP to cancel and go back to guessing letters."
    final_guess = gets.chomp
  end

  def get_guess
    tmp_guess = gets.chomp
  end


end
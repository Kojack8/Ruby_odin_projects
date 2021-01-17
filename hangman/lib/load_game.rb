class LoadGame
  def load_game
    puts "If you'd like to start a new game enter \"1\" now."
    puts "Or if you'd like to load a saved game enter \"2\"."
    correct = false
    while correct == false
      x = gets.chomp
      correct = validate(x)
    end
  end

  def validate(x)
    if x.to_i < 1 || x.to_i > 2 
      puts 'I\'m sorry. That\'s an invalid input. Please try again.'
      false
    else
      true
    end
  end
end
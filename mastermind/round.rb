class Round
  def explain_round
    puts 'Each round is made up of two turns.'
    puts 'During each turn the CodeBREAKER will have 12 opportunities to guess' \
    ' the new code.'
    puts 'For every attempted guess the CodeMASTER earns a single point'
    puts 'The round ends after 12 guesses or when the CodeBREAKER guesses correctly.'
    rounds = get_round
    return rounds
  end

  def get_round
    puts 'How many rounds would you like to play? (min. 1, max. 10)'
    input = gets.to_i
    validation = validate_round(input)
    if validation == true
      return input
    else
      puts "I'm sorry, that's an invalid input. Please try again."
      get_round
    end
  end
  # ALL THE ROUND FUNCTIONS WORKS CORRECTLY BUT THEYRE NOT CONNECTED TO THE GAME RLY
  def validate_round(input)
    if input < 1 || input > 10
      false
    else
      true
    end
  end
end
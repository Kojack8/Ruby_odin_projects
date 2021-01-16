class CompareAnswer
  def initialize(key, result, hidden_letters)
    @key = key 
    @result = result
    @hidden_letters = hidden_letters
  end
  def compare_answer
    puts @result
    if @result[0] == 0
      compare_letter
    else
      compare_word
    end
  end
  def compare_letter
    if @hidden_letters.include?@result[1]
      




  end

  # returns an array containing 2 bools. the first false tells game_run to stop letting you guess
  # and the second is true if the guess was correct or false if incorrect
  def compare_word
    if @result[1].downcase.strip == @key.downcase.strip
      [true, true]
    else
      [true, false]
    end
  end
end

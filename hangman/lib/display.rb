require_relative 'guess_images'

# loads the current display including the revealed answer, guessed letters, 
# and the remaining guess count

class Display
  def initialize
    @hangman_arr = GuessImages::HANGMANPICS
  end
  
  def portray(guess_counter)
    puts @hangman_arr[guess_counter]
  end
end
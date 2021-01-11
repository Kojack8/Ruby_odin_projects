require_relative 'guess_images'

# loads the current display including the revealed answer, guessed letters, 
# and the remaining guess count

class Display
  def initialize
    @guess_image = GuessImages.new
  end
  
  def test
    puts @guess_image.guess_seven
  end
end
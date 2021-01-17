# frozen_string_literal: true

require_relative 'guess_images'

# loads hangman pictures into an array and can print to screen based on guess
class Display
  def initialize
    @hangman_arr = GuessImages::HANGMANPICS
  end

  def portray(guess_counter)
    puts @hangman_arr[guess_counter]
  end
end

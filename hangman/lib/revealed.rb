# frozen_string_literal: true

# contains letters which have already been guessed
class Revealed
  attr_reader :revealed_key

  def initialize(key)
    @key = key.scan(/\w/)
    @revealed_key = []
  end

  def new_revealed_key
    (0..(@key.length - 1)).each do |_j|
      @revealed_key.push('__  ')
    end
    print_revealed
    @revealed_key
  end

  def reveal_letter(user_guess)
    if @key.include?(user_guess)
      counter = 0
      @key.each do |n|
        @revealed_key[counter] = "  #{n} " if n == user_guess
        counter += 1
      end
    end
    @revealed_key
  end

  def print_revealed
    p @revealed_key.join(' ')
  end
end

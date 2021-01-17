class Revealed
  attr_reader :revealed_key
  def initialize(key)
    @key = key.scan /\w/
    @revealed_key = []
  end

  def new_revealed_key
    for j in 0..(@key.length - 1)
      @revealed_key.push("__  ")
    end
    print_revealed
    @revealed_key

  end

  def reveal_letter(user_guess)
    if @key.include?(user_guess)
      counter = 0
      @key.each { |n|
        if n == user_guess
          @revealed_key[counter] = "  #{n} "
        end
        counter += 1

        
      }
    end
    @revealed_key
  end

  def print_revealed
    p @revealed_key.join(" ")
  end



end
class Revealed
  def initialize(key)
    @key = key.scan /\w/
    @revealed_key = []
  end

  def revealed_key
    for j in 0..(@key.length - 1)
      @revealed_key.push("__  ")
    end
    @revealed_key

  end

  def reveal_letter(user_guess)
    if @key.include?(user_guess)
      counter = 0
      @key.each { |n|
        if n == user_guess
          @revealed_key[counter] = n
        end
        counter += 1

        
      }
    end
    @revealed_key
  end



end
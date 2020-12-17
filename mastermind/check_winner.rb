# frozen_string_literal: true

module CheckWinner
  def check_winner(key, answer)
    if key == answer 
      puts 'Congratulations! You cracked the code.'
      true
    end

  end
end
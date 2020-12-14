# frozen_string_literal: true

# On program launch, this class runs returning the num 1-3 to represent which
# game mode is being used
module UserInput
  def take_input
    key = []
    (0..3).each do |_i|
      x = gets.chomp.to_i
      if x < 1 || x > 5
        puts "I'm sorry, that's an invalid input."
        redo
      else
        case x
        when 1
          puts 'RED'
        when 2
          puts 'GREEN'
        when 3
          puts 'BLUE'
        when 4
          puts 'WHITE'
        when 5
          puts 'YELLOW'
        end
        key.push(x)
      end
    end
    key
  end
end

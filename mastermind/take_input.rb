# frozen_string_literal: true

module TakeInput
  def take_input
    key = []
    (0..3).each do |_i|
      x = gets.chomp.to_i
      if x < 1 || x > 6
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
          puts 'CYAN'
        when 5
          puts 'YELLOW'
        when 6
          puts 'MAGENTA'
        end
        key.push(x)
      end
    end
    key
  end
end

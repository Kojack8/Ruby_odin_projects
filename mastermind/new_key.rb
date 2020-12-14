# frozen_string_literal: true

require_relative 'user_input'

# rubocop comment
class NewKey
  include UserInput
  # DELETE ALL THESE PUTS LATER!
  def initialize(mode, player_one)
    case mode
    when 1
      puts 'NPC CODEMAKER v PC BREAKER'
      choose_key_pc
    when 2
      puts 'PC MAKER v NPC BREAKER'
      choose_key_person(player_one)
    when 3
      puts "Agent #{player_one}, as the first player you must now decide. Enter " \
      ' "1" to be the Codemaker. Or "2" to be the Codebreaker.'
      choose_key_person(player_one)
      puts 'PC MAKER v PC BREAKER. Now you must decide the codebreaker'
    end
  end

  def choose_key_person(player_one)
    puts "Good afternoon, Agent #{player_one}. Welcome to Mastermind."
    sleep(1)
    puts 'In a moment, I will ask you to input four colors in order. Simply type ' \
    'in your selection one at a time, hitting enter after each input.'
    sleep(1)
    puts 'Choose four pegs from the following list of colors. You may repeat a color' \
      ' ad nauseam.'
    puts ' _____________'
    puts '|             |'
    puts '| 1 - RED     |'
    puts '| 2 - GREEN   |'
    puts '| 3 - BLUE    |'
    puts '| 4 - WHITE   |'
    puts '| 5 - YELLOW  |'
    puts '|_____________|'
    puts 'Make your selections now.'
    @key = take_input
    p 'Psss... heres the key'
    p @key
  end

  def choose_key_pc
    colors = [1, 2, 3, 4, 5]
    @key = []
    (0..3).each do |_i|
      @key.push(colors[rand(5)])
    end
    puts 'The Codemaker has locked in their code.'
  end

  attr_reader :key
end

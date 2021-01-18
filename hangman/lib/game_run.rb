# frozen_string_literal: true

require 'yaml'
require_relative 'human_guess'
require_relative 'display'
require_relative 'revealed'

# Controls the rules of the game
class GameRun
  def initialize(key)
    @key = key
    @display = Display.new
    @revealed = Revealed.new(@key)
    @validator = false
    @guess_count = 0
  end

  def game_run
    @revealed.new_revealed_key
    game_round
    game_end
  end

  # it should display the revealed_letters str at the start of each round
  def game_round
    human_guess = HumanGuess.new
    while @guess_count < 7 && @validator == false
      save_option
      user_guess = human_guess.guess
      check_correct(user_guess)
      @revealed.print_revealed
      @guess_count += 1
    end
  end

  def check(guess)
    if @key.include? guess
      true
    else
      false
    end
  end

  def check_correct(user_guess)
    if check(user_guess) == true
      correct_guess(user_guess)
    else
      @display.portray(@guess_count)
    end
  end

  def correct_guess(user_guess)
    display_answer = @revealed.reveal_letter(user_guess)
    @validator = true unless display_answer.include?('__  ')
    @guess_count -= 1
  end

  def game_end
    if @guess_count == 7
      puts 'Game Over. Please try again.'
    else
      puts "Congratulations! #{@key} is the correct answer."
    end
  end

  def save_option
    puts "If you'd like to save, type \"save\" now. Otherwise, enter any key."
    tmp = gets.chomp
    if tmp.downcase == 'save'
      save_game
    else
      puts 'Please, make your guess now.'
    end
  end

  def save_game
    puts 'Enter name for your save file now'
    x = gets.chomp
    somefile = File.open("../saved/#{x}.yaml", 'w')
    y = YAML.dump(self)
    somefile.puts y
    somefile.close
    p "If you'd like to continue enter your next guess now."
  end
end

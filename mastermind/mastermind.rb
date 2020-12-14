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
    return key
  end
end

class GameMode
  def initialize
    puts 'How many humans would like to play this game? One or Two?'
    x = gets.chomp.downcase
    x = 'one' if x == '1'
    x = 'two' if x == '2'
    case x
    when 'one'
      @users = x
      turn_order
    when 'two'
      @users = x
      turn_order
    else
      puts "I'm sorry. That's an invalid entry. Please try again."
      initialize
    end
  end

  def turn_order
    if @users == 'one'
      puts "If you'd like to go first as the 'Codebreaker' enter 1 now."
      puts "If you'd like to go first as the 'Codemaker' enter 2 now."
      x = gets.to_i
      case x
      when 1
        # mode one is NPC CODEMAKER v PC BREAKER
        puts 'Enter your name, agent.'
        @name_one = gets.chomp
        @mode = 1
      when 2
        # mode two is PC MAKER v NPC BREAKER
        puts 'Enter your name, agent.'
        @name_one = gets.chomp
        @mode = 2
      else
        puts "I'm sorry. That's an invalid entry. Please try again."
        turn_order

      end
    end
    if @users == 'two'
      # mode three is PC MAKER v PC BREAKER. Player one is always the codemaker
      @mode = 3
      puts 'Player One: Enter your name'
      @name_one = gets.chomp
      puts 'Player Two: Enter your name'
      @name_two = gets.chomp
    end
  end

  attr_reader :mode, :name_one, :name_two
end

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
    p 'ZZZZZZZ'
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

# HERE I AM. ALL VERSIONS OF THE GAME ARE THE SAME AT THEIR CORE. ONE GUESSER GUESSES AND
# IS RETURNED FEEDBACK. EVEN THE COMPUTERS GUESSES SHOULD BE SIMULATED FOR MY PURPOSES
# THERE IS NO TRUE SECOND PLAYER OPTION. ONLY SCORING APPROPRIATELY
# NEEDS A SCOREBOARD FOR THE TWO PLAYERS, A TURN FOR PCS, AND A TURN FOR NPCS
# AFTER THAT, THE KEY IS RUNNING THE GAME CORRECTLY
class GameRun
  include UserInput
  def initialize(game_mode, key)
    p game_mode
    p key
    @player_one_score = 0
    @player_two_score = 0
    human_turn(key)
  end

  # THIS IS THE KEY
  def human_turn(key)
    puts ' _____________ '
    puts '|             |'
    puts '| 1 - RED     |'
    puts '| 2 - GREEN   |'
    puts '| 3 - BLUE    |'
    puts '| 4 - WHITE   |'
    puts '| 5 - YELLOW  |'
    puts '|_____________|'
    puts "It's your turn to guess. Using the numbers below enter your four guesses" \
    ' one at a time.'
    answer = take_input
    @comparison = compare_answer(key, answer)

  end
  # 2 = RED PEG - Correct color and location
  # 1 = WHITE PEG - Correct color; incorrect location
  # 0 = NO PEG - Wrong color and location
  def compare_answer(key, answer)
    comparison = []
    successful_colors = []
    if answer == key
      round_end
    end
    # creates 2 arrays. one which will contain the feedback peg colors and another
    # which will help validate 'correct color and incorrect placement' choices
    for i in 0..3
      if answer[i] == key[i] 
        comparison.push(2)
        successful_colors.push(answer[i])
      else
        comparison.push(nil)
      end
    end
    # removes successful matches from both arrays for just color check
    successful_colors.each do |x|
      key.slice!(key.index(x))
      answer.slice!(answer.index(x))
    end
    # Take the comparison array and maps nils to 1 for correct color
    # or 0 for no correct features
    supercounter = -1
    comparison.map! do |x|
      counter = 0
      correct_colors = []
      while counter < answer.length
        correct_colors.push(check_color(answer[counter], key))
        counter += 1
      end
      if x == nil
        supercounter += 1
        if correct_colors[supercounter] == true
          x = 1
        else
          x = 0
        end
      else
        x = x 
      end
    end
    # returns completed array to parent function self.METHOD_turn
    comparison
  end

  def check_color(answer, key)
    if key.include?(answer)
      true
    else
      false
    end
  end

  def round_end
    puts "YOU HAVE SUCCESSFULLY CRACKED THE CODE"
  end
end

# x.choose_key_pc
mode = GameMode.new
game_mode = mode.mode
player_one = mode.name_one
player_two = mode.name_two
new_key = NewKey.new(game_mode, player_one)
key = new_key.key
game = GameRun.new(game_mode, key)

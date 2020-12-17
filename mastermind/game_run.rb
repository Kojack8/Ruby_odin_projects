# frozen_string_literal: true

require_relative 'npc_guess'
require_relative 'human_guess'
require_relative 'round'
require_relative 'new_key'

class GameRun
  def initialize
    @player_one_score = 0
    @player_two_score = 0
    # GameMode selects the number of human PCs, gets names, and chooses turn order
    mode = GameMode.new
    # gamemodes (1.) NPC v PC 2.) PC v NPC 3.) PC v PC)
    @game_mode = mode.mode
    p "BETA GAME MODE = " + @game_mode.to_s
    # Gets both players user names, substituting 'Ruby' for NPC
    @player_one = mode.name_one
    @player_two = mode.name_two

    round = Round.new
    @round_total = round.get_round
    run_game
  end

  def run_game
    counter = 0
    while counter < @round_total
      turn_order
      counter += 1
    end
  end

  # WHEN TURN ORDER IS CALLED IT MEANS I AM IN ROUND 1/12
  # THAT MEANS NO MATTER WHICH GAME MODE I'M IN I MUST DO THE SAME THING
  # PLAYER_TWO SELECTS A KEY!!!
  # KEY IS MISSING
  # THEN PLAYER ONE(EITHER HUMAN OR NPC) STARTS THEIR FIRST GUESS ROUND WHICH SHOULD BE MADE UP OF 12 TOTAL ROUNDS
  # DURING THAT SERIES OF 12 THE KEY WON'T CHANGE AT ALL.
  # EVERYONE ONE OF THSOE ROUNDS SHOULD INCREASE THE SCORE AND THEY SHOULD END WITH A VERIFICATION FOR VICTORY
  def turn_order
    p "GAME_MODE" + @game_mode.to_s 
    p "@ROUND_TOTAL" + @round_total.to_s
    # GAME MODE ONE MEANS I GO FIRST AND THEN THE COMPUTER GOES. SO ITS JUST HUMAN THEN NPC
    if @game_mode == 0
      # I think maybe the guess functions should return the number to add to the point total
      key = NewKey.new 
      key = key.generate_key(@game_mode, @player_one)
      @player_one_score += HumanGuess.new(key, @player_one)


    elsif @game_mode == 1

    elsif @game_mode == 2

    end
  end



  # i will call for these methods from within the functions that call guesses
  def player_one_plus
    @player_one_score += 1
  end

  def player_two_plus
    @player_two_score += 1
  end



  


  attr_reader :player_one_score, :player_two_score
end


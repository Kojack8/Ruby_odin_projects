# frozen_string_literal: true

require_relative 'game_run'
require_relative 'user_input'
require_relative 'new_key'
require_relative 'game_mode'
require_relative 'round.rb'


# GameMode selects the number of human PCs, gets names, and chooses turn order
mode = GameMode.new
# gamemodes (1.) NPC v PC 2.) PC v NPC 3.) PC v PC)
game_mode = mode.mode
player_one = mode.name_one
player_two = mode.name_two
# Round gets number of rounds to play from user
round = Round.new
rounds = round.explain_round

counter = 0
if game_mode == 1
  while counter < rounds
    new_key = NewKey.new(game_mode, player_one)
    key = new_key.key
    game = GameRun.new(game_mode, key)

    guess_counter = 0
    correct = false
    while guess_counter < 12 && correct == false
      correct = game.human_guess(key, guess_counter)
      guess_counter += 1
    end

    guess_counter = 0
    correct = false
    while guess_counter < 12 && correct == false
      correct = game.npc_guess(key, guess_counter)
      guess_counter += 1
    end
    

    counter += 1
  end 
end







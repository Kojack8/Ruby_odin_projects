# frozen_string_literal: true

require_relative 'game_run.rb'
require_relative 'user_input.rb'
require_relative 'new_key.rb'
require_relative 'game_mode.rb'
require_relative 'round.rb'


# GameMode selects the number of human PCs, gets names, and chooses turn order
mode = GameMode.new
# gamemodes (1.) NPC v PC 2.) PC v NPC 3.) PC v PC)
game_mode = mode.mode
player_one = mode.name_one
player_two = mode.name_two
if player_two == nil
  player_two = 'Ruby'
end
# Round gets number of rounds to play from user
round = Round.new
rounds = round.explain_round

round_counter = 0
if game_mode == 1
  while round_counter < rounds
    new_key = NewKey.new(game_mode, player_one)
    key = new_key.key
    game = GameRun.new(game_mode, key)

    guess_counter = 0
    correct = false
    while guess_counter < 12 && correct == false
      correct = game.human_guess(key, guess_counter, player_one, 1)
      guess_counter += 1
    end


    guess_counter = 0
    correct = false
    while guess_counter < 12 && correct == false
      correct = game.npc_guess(key, guess_counter, 1)
      guess_counter += 1
    end

    puts "ROUND 2: PLAYER ONE SCORE " + game.player_one_score.to_s
    puts "ROUND 2: PLAYER TWO SCORE " + game.player_two_score.to_s
    

    round_counter += 1
  end 
end







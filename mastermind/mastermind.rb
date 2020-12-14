# frozen_string_literal: true

require_relative 'game_run'
require_relative 'user_input'
require_relative 'new_key'
require_relative 'game_mode'

mode = GameMode.new
game_mode = mode.mode
player_one = mode.name_one
player_two = mode.name_two
new_key = NewKey.new(game_mode, player_one)
key = new_key.key
game = GameRun.new(game_mode, key)

# frozen_string_literal: true

require_relative 'load_game'
require_relative 'select_key'
require_relative 'display'
require_relative 'game_run'

def new_game
  select_key = SelectKey.new
  select_key.dict_to_arr
  key = select_key.select_key
  game = GameRun.new(key)
  game.game_run
end

load = LoadGame.new
if load.load_game == true
  new_game
else
  data = load.load_sequence
  unless data == false
    data.game_round
  else
    new_game
  end


end



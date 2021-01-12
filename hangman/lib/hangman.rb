require_relative 'select_key'
require_relative 'display'
require_relative 'game_run'

select_key = SelectKey.new
select_key.dict_to_arr
key = select_key.select_key

game = GameRun.new(key)
game.game_run
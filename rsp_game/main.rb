require_relative 'lib/game'
require_relative 'lib/result_printer'

extend Game::ResultPrinter

game = Game.new

while game.in_progress?
  game.start_game

  # check result
  assign_result(game)
  print_result(game)

  # continue game or exit?
  game.ask_next_step
end

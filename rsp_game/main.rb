require_relative 'lib/game'
require_relative 'lib/result_printer'

game = Game.new
# you cannot initiate a ResultPrinter without a game
printer = ResultPrinter.new(game)

while game.in_progress?
  game.start_game(set_computer_value = nil, set_user_value = nil)

  # check result
  result = printer.check_result

  # continue game or exit?
  game.ask_next_step
end

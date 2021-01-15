require 'game'
require 'result_printer'

describe 'Game' do
  let(:game) { Game.new }
  let(:printer) { ResultPrinter.new(game) }

  it 'user wins the game' do
    expect(game.status).to eq :in_progress

    game.start_game(set_computer_value = 'r', set_user_value = 'p')
    printer.check_result

    expect(game.user_value).to eq('p')
    expect(game.computer_value).to eq('r')
    expect(printer.result).to eq('User win!')
  end

  it 'computer wins the game' do
    expect(game.status).to eq :in_progress

    game.start_game(set_computer_value = 's', set_user_value = 'p')
    printer.check_result

    expect(game.user_value).to eq('p')
    expect(game.computer_value).to eq('s')
    expect(printer.result).to eq('Computer win!')
  end

  it 'dead heat the game' do
    expect(game.status).to eq :in_progress

    game.start_game(set_computer_value = 'r', set_user_value = 'r')
    printer.check_result

    expect(game.user_value).to eq('r')
    expect(game.computer_value).to eq('r')
    expect(printer.result).to eq('Dead heat')
  end
end

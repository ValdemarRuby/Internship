require 'game'
require 'result_printer'

include Game::ResultPrinter

describe Game do
  let(:game) { Game.new }

  describe 'after the start of the game' do
    it 'should be a status in_progress' do
      expect(game.status).to eq :in_progress
    end
  end

  describe 'checking game results' do
    it 'should be a win for the user' do
      game.computer_value = 'p'
      game.user_value = 's'

      check_result(game)
      expect(result).to eq('User win!')
    end

    it 'should be a win for the computer' do
      game.computer_value = 'r'
      game.user_value = 's'

      check_result(game)
      expect(result).to eq('Computer win!')
    end

    it 'should be a draw' do
      game.computer_value = 'p'
      game.user_value = 'p'

      check_result(game)
      expect(result).to eq('It is draw')
    end
  end
end

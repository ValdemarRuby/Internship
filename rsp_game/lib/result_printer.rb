module Game::ResultPrinter
  WINNING_COMBINATIONS_FOR_USER = [%w[r s], %w[s p], %w[p r]].freeze

  attr_accessor :result

  def check_result(game)
    self.result = if game.user_value == game.computer_value
                    'It is draw'
                  elsif user_win?(game)
                    'User win!'
                  else
                    'Computer win!'
                  end
  end

  def print_result(game)
    puts "User value: #{game.user_value}\nComputer value: #{game.computer_value}\n"
    puts "=========== #{result} ==========="
  end

  private

  def user_win?(game)
    WINNING_COMBINATIONS_FOR_USER.include?([game.user_value, game.computer_value])
  end
end

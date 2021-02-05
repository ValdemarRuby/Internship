module Game::ResultPrinter
  WINNING_COMBINATIONS_FOR_USER = [%w[r s], %w[s p], %w[p r]].freeze

  attr_accessor :result

  def assign_result(game)
    self.result = check_result(game)
  end

  def print_result(game)
    puts "User value: #{game.user_value}\nComputer value: #{game.computer_value}\n"
    puts "=========== #{result} ==========="
  end

  private

  def check_result(game)
    return 'User win!' if user_win?(game)

    if draw?(game)
      return 'It is draw'
    else
      return 'Computer win!'
    end
  end

  def draw?(game)
    game.user_value == game.computer_value
  end

  def user_win?(game)
    WINNING_COMBINATIONS_FOR_USER.include?([game.user_value, game.computer_value])
  end
end

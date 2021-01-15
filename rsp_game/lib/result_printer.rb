class ResultPrinter
  WINNING_COMBINATIONS_FOR_USER = [ ['r', 's'], ['s', 'p'], ['p', 'r'] ].freeze

  attr_accessor :result

  def initialize(game)
    @game = game
  end

  def check_result
    if @game.user_value == @game.computer_value
      self.result= 'Dead heat'
    elsif user_win?
      self.result= 'User win!'
    else
      self.result= 'Computer win!'
    end

    print_result(@game.user_value, @game.computer_value)
  end

  private

  def print_result(user_value, computer_value)
    puts "======= #{result} ======="
    puts "User value: #{user_value}\nComputer value: #{computer_value}\n"

    puts "Press Enter if you want to continue or type (exit) to exit: "
  end

  def user_win?
    WINNING_COMBINATIONS_FOR_USER.include?([@game.user_value, @game.computer_value])
  end
end

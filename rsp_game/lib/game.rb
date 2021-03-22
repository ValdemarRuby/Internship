class Game
  attr_reader :game_values
  attr_accessor :status, :user_value, :computer_value

  def initialize
    @status = :in_progress
    @game_values = get_values
  end

  def start_game
    print_welcomes

    # get value for player - computer
    set_computer_value

    print_user_manual

    # get value for player - user
    set_user_value
  end

  def ask_next_step
    puts 'Press Enter if you want to continue or type (exit) to exit: '
    set_command = get_user_value_from_stdin

    complete_game! if set_command == 'exit'
  end

  def in_progress?
    status == :in_progress
  end

  private

  def set_computer_value
    self.computer_value = game_values.to_a.sample[0]
  end

  def set_user_value
    self.user_value = ''

    self.user_value = get_user_value_from_stdin until option_valid?(user_value)
  end

  def get_user_value_from_stdin
    $stdin.gets.chomp
  end

  def option_valid?(option)
    return false if option == ''

    unless permissible_value?(option)
      puts 'Value should be (r), (s) or (p)'
      return false
    end

    true
  end

  def permissible_value?(option)
    game_values.include?(option)
  end

  def complete_game!
    self.status = :completed
  end

  def print_welcomes
    puts "\n ====== Hello! ======"
    puts "This game - rock, scissors and paper.\n"
  end

  def print_user_manual
    puts "\nEnter your value"
    puts 'r - (rock), s - (scissors) or p - (paper)'
  end

  def get_values
    {
      'r' => 'Rock',
      's' => 'Scissors',
      'p' => 'Paper'
    }.freeze
  end
end

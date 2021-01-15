class Game
  attr_reader :game_values
  attr_accessor :status, :user_value, :computer_value

  def initialize
    print_welcomes
    @status = :in_progress
    @game_values = get_values
    @errors = 0
  end

  def start_game(set_computer_value=nil, set_user_value=nil)
    # get value for player №1 - computer
    get_computer_value(set_computer_value)

    # get value for player №2 - user
    get_user_input(set_user_value)
  end

  def in_progress?
    status == :in_progress
  end

  def ask_next_step
    command = get_user_value_from_stdin

    if command == 'exit'
      self.status= :completed
      # status=(:completed) not work!
    else
      start_new_game
    end
  end

  private

  def get_computer_value(set_computer_value=nil)
    self.computer_value= set_computer_value || game_values.to_a.sample[0]
  end

  def get_user_input(set_user_value=nil)
    print_user_messages
    option = set_user_value || get_user_value_from_stdin

    while not_valid?(option)
      option = get_user_value_from_stdin
    end

    self.user_value= option
  end

  def get_user_value_from_stdin
    STDIN.gets.chomp
  end

  def not_valid?(option)
    if option == ''
      @errors += 1
      puts "Your value not be nil\nMake your choice"
      return true
    elsif !option_valid?(option)
      @errors += 1
      puts 'Value should be (r), (s) or (p)'
      return true
    end
  end

  def start_new_game
    reset_gamers_values
  end

  def reset_gamers_values
    self.user_value, self.computer_value = nil, nil
  end

  def print_welcomes
    puts "\n\n ====== Hello! ======"
    puts "This game - rock, scissors and paper.\n\n"
  end

  def print_user_messages
    puts "\nEnter your value"
    puts "r - (rock), s - (scissors) or p - (paper)"
  end

  def option_valid?(option)
    game_values.include?(option)
  end

  def get_values
    {
      'r' => "Rock",
      's' => "Scissors",
      'p' => "Paper"
    }.freeze
  end
end

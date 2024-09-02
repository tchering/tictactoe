# frozen_string_literal: true

module DisplayMessage
  def show_welcome_message
    puts "\e[32mWelcome to TicTacToe.\nPlease follow the instruction.\e[0m"
  end

  def ask_name(number)
    puts "Please enter the name for player #{number}"
  end

  def welcome_player(name)
    puts "Hello #{name} Welcome to this game"
  end

  def ask_symbol(current_player_name)
    puts "#{current_player_name} now please enter the symbol you want to play with"
  end

  def show_instruction
    puts 'The rule are simple. Just select the cells you want to put symbol'
  end

  def symbol_error_message
    puts "\e[31mThat symbol is already taken please choose another.\e[0m"
  end

  def player_turn(current_player_name, current_player_symbol)
    puts "Current player #{current_player_name} ,symbol : #{current_player_symbol}"
  end

  def ask_cells
    puts 'Select the cells you want to put your symbol'
  end

  def display_input_warning
    puts "\ePlease enter the number from 1 to 9 [\e[0m"
  end

  def display_winner_message(winner_name)
    puts "#{winner_name} is the winner."
  end

  def display_tie
    puts 'The game is draw.'
  end

  def display_cell_occupied
    puts 'The cell you selected is occupied'
  end
end

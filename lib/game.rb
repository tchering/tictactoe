# frozen_string_literal: true

require_relative 'display'

class Game
  include DisplayMessage
  attr_reader :player1, :player2, :board, :current_player

  def initialize
    show_welcome_message
    show_instruction
    @player1 = nil
    @player2 = nil
    @current_player = nil
    @board = Board.new
  end

  def play
    game_setting
    board.display_board
    @current_player = @player1
    start_game
  end

  def game_setting
    @player1 = player_setting(1, nil)
    @player2 = player_setting(2, @player1.symbol)
  end

  def player_setting(number, symbol)
    ask_name(number)
    name = gets.chomp
    ask_symbol(name)
    symbol = symbol_set_up(symbol)
    Player.new(name, symbol)
  end

  def symbol_set_up(prev_symbol)
    symbol = gets.chomp
    return symbol if symbol.match?(/[^0-9]$/) && prev_symbol != symbol

    symbol_error_message
    symbol_set_up(prev_symbol)
  end

  def start_game
    loop do
      player_turn(@current_player.name, @current_player.symbol)
      ask_cells
      input = player_response
      if board.valid_move?(input)
        make_move(input, current_player.symbol)
        break if game_over?
      else
        display_cell_occupied
      end
    end
  end

  def player_response
    input = gets.chomp
    if input.match?(/^[1-9]/)
      input.to_i
    else
      display_input_warning
      player_response
    end
  end
# using loop for player_response method
#   def player_response
#     loop do
#       input = gets.chomp
#       if input.match?(/^[1-9]$/)
#         return input.to_i
#       else
#         display_input_warning
#       end
#     end
#   end

  def make_move(input, symbol)
    board.update_board(input, symbol)
    board.display_board
  end

  def game_over?
    if board.game_over?
      display_winner_message(current_player.name)
      true
    elsif board.full?
      display_tie
      true
    else
      switch_player(current_player)
      false
    end
  end

  def switch_player(current_player)
    @current_player = current_player == @player1 ? @player2 : @player1
  end
end

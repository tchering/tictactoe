# frozen_string_literal: true

class Board
  attr_reader :cells

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [6, 4, 2], [0, 4, 8]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts '____________'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '____________'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def valid_move?(number)
    cells[number - 1] = number
  end

  def full?
    cells.all? { |cell| cell.is_a?(String) }
  end

  def update_board(number, symbol)
    cells[number - 1] = symbol
  end

  def game_over?
    WINNING_COMBOS.any? do |combo|
      [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
    end
  end
end

# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/display'
require_relative 'lib/player'

def play_game
  game = Game.new
  game.play
  play_again
end

def play_again
  puts 'Do you want to play again? (y/n)'
  input = gets.chomp.downcase
  input == 'y' ? play_game : puts('Thank you for playing')
end

play_game

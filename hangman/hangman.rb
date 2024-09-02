# frozen_string_literal: true

require 'json'
require 'pry-byebug'

class Hangman
  SAVE_FILE = 'hangman_save.json'
  DICTIONARY_FILE = 'google-10000-english-no-swears.txt'
  MAX_ATTEMPTS = 6

  def initialize
    @secret_word = select_random_word
    @guessed_letter = []
    @incorrect_guesses = []
    @attempts = MAX_ATTEMPTS
    # binding.pry
  end

  def select_random_word
    lines = File.readlines(DICTIONARY_FILE)
    words = lines.map(&:chomp)
    filtered_words = words.select { |word| word.length.between?(6, 12) }
    filtered_words.sample
  end

  def display_word
    @secret_word.chars.map { |char| @guessed_letter.include?(char) ? char : '_' }.join
    #  "__d_e__"
  end

  def display_status
    puts "word : #{display_word}"
    puts "Incorrect guesses : #{@incorrect_guesses.join}"
    puts "Attempts : #{@attempts}"
  end

  def guessed_letter(letter)
    letter.downcase
    if @secret_word.include?(letter)
      @guessed_letter << letter unless @guessed_letter.include?(letter)
    else
      @incorrect_guesses << letter unless @incorrect_guesses.include?(letter)
      @attempts -= 1
    end
  end

  def to_json(*_args)
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end
    JSON.dump obj
  end

  # Either this
  # def to_json
  #   JSON.dump({
  #     secret_word: @secret_word,
  #     guessed_letter: @guessed_letter,
  #     incorrect_guesses: @incorrect_guesses,
  #     attempts: @attempts,
  #   })
  # end

  def save_game
    File.write(SAVE_FILE, to_json)
  end

  # def save_game
  #   File.write(SAVE_FILE,to_json)
  # end

  def load_game
    if File.exist?(SAVE_FILE)
      data = JSON.parse(File.read(SAVE_FILE))
      # to see value of @secret_word after reading and parsing
      # word = data["@secret_word"]
      # binding.pry
      data.each_key do |key|
        instance_variable_set(key, data[key])
      end
      puts 'Game loaded!'
    else
      puts 'No saved game found.'
    end
  end

  #  Either this
  # def load_game
  #   if File.exist?(SAVE_FILE)
  #     data = JSON.parse(File.read(SAVE_FILE))
  #     @secret_word = data["secret_word"]
  #     @guessed_letters = data["guessed_letters"]
  #     @incorrect_guesses = data["incorrect_guesses"]
  #     @remaining_attempts = data["remaining_attempts"]
  #     puts "Game loaded!"
  #   else
  #     puts "No saved game found."
  #   end
  # end

  def play
    puts 'Welcome to Hangman'
    loop do
      display_status
      puts 'Please guess the letter or type save to save the game'
      input = gets.chomp
      if input == 'save'
        save_game
      elsif input.length == 1 && input.match(/[a-zA-Z]/)
        guessed_letter(input)
      else
        puts 'Invalid input please enter alphabet'
      end

      if @attempts.zero?
        puts "You lost the game. The correct word was #{@secret_word}"
        break
      elsif display_word == @secret_word
        puts "You won the game . The word was #{@secret_word}"
        break
      end
    end
  end
end

game = Hangman.new
puts 'Do you want to load the save game? yes/no'
response = gets.chomp.downcase
game.load_game if response == 'yes'
game.play

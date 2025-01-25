# frozen_string_literal: true

require_relative 'hangman'
# Implements the game loop
class Game
  def initialize(dict_arr, min_length, max_length)
    puts 'Welcome to hangman!  Type save anytime to save a game'
    puts 'Or type load now to load a previously saved game'
    dict = dict_arr.select { |word| word.length >= min_length && word.length <= max_length }
    @hangman = Hangman.new(dict.sample)
  end

  def start
    game_over = false
    until game_over
      @hangman.make_guess(read_input)
      @hangman.draw_board
      game_over = @hangman.game_over?
    end
    game_end
  end

  def game_end
    puts @hangman.game_over_result
  end

  def read_input
    puts 'Guess a letter:'
    response = gets.chomp.downcase
    if response == 'save'
      save_game
      puts 'game saved'
      puts 'Guess a letter:'
      response = gets.chomp.downcase
    elsif response == 'load'
      @hangman = load_game
      puts 'game loaded'
      @hangman.draw_board
      puts 'Guess a letter:'
      response = gets.chomp.downcase
    end
    until ('a'..'z').include? response
      puts 'Input not recognized, please guess a letter'
      response = gets.chomp.downcase
    end
    response
  end

  def save_game
    File.open('saved_game.bin', 'w') do |f|
      f.write(Marshal.dump(@hangman))
    end
  end

  def load_game
    data = File.open('saved_game.bin', 'r')
    Marshal.load(data)
  end
end

game = Game.new(File.readlines('../google-10000-english-no-swears.txt', chomp: true), 5, 12)
game.start

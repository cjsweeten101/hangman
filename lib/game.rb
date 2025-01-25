# frozen_string_literal: true

require_relative 'hangman'
# Implements the game loop
class Game
  def initialize(dict_arr, min_length, max_length)
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
  end

  def read_input
    puts 'Guess a letter:'
    response = gets.chomp.downcase
    until ('a'..'z').include? response
      puts 'Input not recognized, please guess a letter'
      response = gets.chomp.downcase
    end
    response
  end
end

game = Game.new(File.readlines('../google-10000-english-no-swears.txt', chomp: true), 5, 12)
game.start

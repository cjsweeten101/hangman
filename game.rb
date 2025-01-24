# frozen_string_literal: true

# Implements the game loop
class Game
  def initialize(dict_arr, min_length, max_length)
    dict = dict_arr.select { |word| word.length >= min_length && word.length <= max_length }
    @hangman = Hangman.new(dict.sample)
  end

  def start
  end
end

game = Game.new(File.readlines('google-10000-english-no-swears.txt', chomp: true), 5, 12)
game.start

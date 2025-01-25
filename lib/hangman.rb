# frozen_string_literal: true

# Implements the hangman game object
class Hangman
  @board_states = ["O'\n'", '/', '|', "\\'\n'", '/', '\\']
  @correct_guesses = []
  @incorrect_guesses = []

  def initialize(secret_word)
    @secret_word = secret_word
    @guess_count = 0
    p @secret_word
    initialize_board
    draw_board
  end

  def make_guess(letter)
    if @secret_word.include? letter
      indexes = []
      @secret_word.split('').each_with_index do |l, i|
        indexes << i if letter == l
      end
      p indexes
    else
      @guess_count += 1
    end
  end

  def draw_board
    puts @correct_guesses
  end

  def initialize_board
    result = ''
    @secret_word.length.times do
      result += '-'
    end
    @correct_guesses = result
  end

  def game_over?
  end
end

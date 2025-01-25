# frozen_string_literal: true

# Implements the hangman game object
class Hangman
  @board_states = ["O'\n'", '/', '|', "\\'\n'", '/', '\\']
  @correct_guesses = []
  @incorrect_guesses = []

  def initialize(secret_word)
    @secret_word_array = secret_word.split('')
    @guess_count = 0
    p @secret_word_array.join('')
    initialize_board
    draw_board
  end

  def make_guess(letter)
    if @secret_word_array.include? letter
      @secret_word_array.each_with_index do |l, i|
        @correct_guesses[i] = letter if letter == l
      end
    else
      @guess_count += 1
    end
  end

  def draw_board
    p @correct_guesses.join('')
  end

  def initialize_board
    result = []
    @secret_word_array.length.times do
      result << '-'
    end
    @correct_guesses = result
  end

  def game_over?
  end
end

# frozen_string_literal: true

# Implements the hangman game object
class Hangman
  @correct_guesses = []

  def initialize(secret_word)
    @board_states = ["   O\n", '  /', '|', "\\\n", '  / ', '\\']
    @secret_word_array = secret_word.split('')
    @incorrect_guess_count = 0
    @incorrect_guesses = []
    initialize_board
  end

  def initialize_board
    result = []
    @secret_word_array.length.times do
      result << '-'
    end
    @correct_guesses = result
  end

  def make_guess(letter)
    if @secret_word_array.include? letter
      @secret_word_array.each_with_index do |l, i|
        @correct_guesses[i] = letter if letter == l
      end
    else
      @incorrect_guesses << letter
      @incorrect_guess_count += 1
    end
  end

  def draw_board
    puts create_hangman_drawing
    puts 'Incorrect Guesses:'
    puts @incorrect_guesses.join(', ')
    puts 'Correct Guesses:'
    puts @correct_guesses.join('')
  end

  def create_hangman_drawing
    result = "---|\n"
    @incorrect_guess_count.times do |i|
      result += @board_states[i]
    end
    result
  end

  def game_over?
    @incorrect_guess_count >= @board_states.length || !@correct_guesses.include?('-')
  end

  def game_over_result
    if @incorrect_guess_count >= @board_states.length
      "Game over, the word was #{@secret_word_array.join('')}"
    elsif !@correct_guesses.include?('-')
      'Game over, you win!'
    end
  end
end

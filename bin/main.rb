#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity

require_relative '../lib/board'

class Game
  attr_accessor :board, :current_player, :player1, :player2, :game

  def initialize
    @player_one = nil
    @player_two = nil
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game = Board.new
  end

  def display_board
    puts '+---+---+---+'
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '+---+---+---+'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '+---+---+---+'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts '+---+---+---+'
  end

  def intro
    puts 'Welcome to Tic Tac Toe game'

    puts 'enter player one name : '
    @player_one = gets.chomp
    firstplayer while @player_one == '' || @player_one == ' ' || @player_one.nil?

    puts 'enter player two name : '
    @player_two = gets.chomp
    secondplayer while @player_two == '' || @player_two == ' ' || @player_two.nil?
    until @player_two != @player_one
      puts 'This name is taken by player one '
      secondplayer
    end
    puts "#{@player_one} will play with X and #{@player_two} will play 0"
    puts "let's start . . ."
  end

  def firstplayer
    puts 'enter player one name : '
    @player_one = gets.chomp
  end

  def secondplayer
    puts 'enter payer two name : '
    @player_two = gets.chomp
  end

  def setup
    @player1 = ['X', @player_one]
    @player2 = ['O', @player_two]
    @current_player = @player1
  end

  WIN_COMBINATION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def update(number, symbol)
    @board[number - 1] = symbol
  end

  def valid_move(number)
    @board[number - 1] == number
  end

  def winner?
    WIN_COMBINATION.any? do |combo|
      [@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq.length == 1
    end
  end

  def user_input(current_player)
    puts "#{current_player[1]} please choose a number"
    input = gets.chomp.to_i
    if valid_move(input)
      update(input, current_player[0])
    else
      puts 'Please choose a valid number'
      user_input(current_player)
    end
  end

  def move
    until full?
      user_input(current_player)
      display_board
      break if winner?

      @current_player = if current_player == @player1
                          @player2
                        else
                          @player1
                        end

    end
    if winner?
      puts "#{current_player[1]} wins"
    else
      puts 'Its A draw'
    end
  end

  def full?
    @board.all? { |x| %w[X O].include?(x) }
  end

  def play
    intro
    setup
    display_board
    move
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
game = Game.new
game.play

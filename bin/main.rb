#!/usr/bin/env ruby
# rubocop:disable Lint/AssignmentInCondition
require_relative '../lib/board'

class Board
  attr_accessor :board, :current_player, :player1, :player2, :game

  def initialize
    @player_one = nil
    @player_two = nil
    @game = Game.new
  end

  def intro
    puts 'Welcome to Tic Tac Toe game'

      puts 'enter player one name : '
    @player_one = gets.chomp
    while @player_one == "" || @player_one == " " || @player_one == nil
      firstplayer
    end

    puts 'enter player two name : '
    @player_two = gets.chomp
    while @player_two == "" || @player_two == " " || @player_two == nil
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

  def switch
    @current_player = if @current_player = @player1
                        @player2
                      else
                        @player1
                      end
  end

  def user_input(current_player)
    puts "#{current_player[1]} please choose a number"
    input = gets.chomp.to_i
    if game.valid_move(input)
      game.update(input, current_player[0])
    else
      puts 'Please choose a valid number'
      user_input(current_player)
    end
  end

  def move
    until game.full?
      user_input(current_player)
      game.display_board
      break if game.winner?

      @current_player = if current_player == @player1
                          @player2
                        else
                          @player1
                        end

    end
    if game.winner?
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
    game.display_board
    move
  end
end
# rubocop:enable Lint/AssignmentInCondition
game = Board.new
game.play

#!/usr/bin/env ruby
class Board
  attr_accessor :board
  
  def intro
    puts 'Welcome to Tic Tac Toe game'
    puts 'enter payer one name : '
    @player_one = gets.chomp
    puts 'enter payer two name : '
    @player_two = gets.chomp
    puts "#{@player_one} will play with X and #{@player_two} will play 0"
    puts "let's start . . ."
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
  WIN_COMBINATION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ].freeze
    
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_one = nil
    @player_two = nil
    @player_one_symbol = 'X'
    @player_two_symbol = 'O'
  end
 
                                  
  def update(number, symbol)
    @board[number - 1] = symbol
  end
  def valid_move(number)
    @board[number - 1]=number 
  end 
  def winner?
    WIN_COMBINATION.any? do |combo|
      [@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq.length == 1
    end
  end 
  def move
    count = 0 
    
        
    until @board.all? { |x| %w[X O].include?(x) }
        if count.even?
          puts "It's #{@player_one} turn"
          puts 'Please Select an available cell from board '
          player_turn = gets.chomp.to_i
          update(player_turn,@player_one_symbol) if valid_move(player_turn)
          count + 1
        else
          puts "It's + #{@player_two} + turn"
          puts 'Please Select an available cell from board '
          player_turn = gets.chomp.to_i
          @board.update(player_turn,@player_two_symbol) && @board.size - 1 if valid_move(player_turn)
          count + 1
        end
      end
   end

  def full?
    @board.all? { |x| %w[X O].include?(x) }
  end 

  def play
    intro
    display_board
    move
  end
end
game = Board.new
game.play

                   
                   
                   
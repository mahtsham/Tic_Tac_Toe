#!/usr/bin/env ruby
puts 'Welcome to Tic Tac Toe game'
puts 'enter payer one name : '
player_one = gets.chomp
puts 'enter payer two name : '
player_two = gets.chomp
puts "#{player_one} will play with X and #{player_two} will play 0"
puts "let's start . . ."
def display_board(board)
  puts '+---+---+---+'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '+---+---+---+'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '+---+---+---+'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts '+---+---+---+'
end
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
display_board(board)

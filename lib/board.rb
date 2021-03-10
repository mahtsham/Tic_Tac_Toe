class Game
  attr_accessor :board

  def display_board
    puts '+---+---+---+'
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '+---+---+---+'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '+---+---+---+'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts '+---+---+---+'
  end

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

  def full?
    @board.all? { |x| %w[X O].include?(x) }
  end
end

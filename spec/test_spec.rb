require_relative '../lib/board'
require_relative '../bin/main'

describe Game do
  
    let(:game) { Game.new }
    let(:board) { Board.new }
    describe 'update' do
    
    it 'update the move' do
        expect(board.update(2, 'X')).to eql('X')
    end
end
describe 'update' do
    
    it 'update the move' do
        expect(board.update(1, 'O')).to eql('O')
    end
end
describe 'winner?' do
    
    it 'checks the winner' do
        expect(game.winner?).to eql(false)
    end
end 

describe 'valid_move' do
    
    it 'checks the valid move' do
        expect(game.valid_move(10)).to eql(false)
    end
end 
describe 'full?' do
    
    it 'checks if board is full' do
        expect(board.full?).to eql(false)
    end
end 
describe 'switch' do
    
    it 'checks if board is full' do
        expect(board.switch).to eql(nil)
    end
end 
describe 'intro' do
  it 'it shows the introduction' do
    expect(game.intro).to eql(puts("Welcome to Tic Tac Toe game \n\n"))
  end
end
end

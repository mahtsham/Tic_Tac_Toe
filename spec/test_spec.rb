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

end

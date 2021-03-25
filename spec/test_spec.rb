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

end

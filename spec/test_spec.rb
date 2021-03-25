require_relative '../lib/board'

describe Board do
  
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
  describe 'update' do
    it 'update the move' do
        expect(board.update(1, 'O')).to eql('O')
        expect(board.update(1, false)).to eql(false)
    end
  end
  describe 'update' do
    it 'update the move' do
      expect(board.update(2, false)).to eql(false)
    end
  end
  describe 'winner?' do
    it 'checks the winner' do
      expect(board.winner?).to eql(false)
    end
  end
  describe 'switch' do
  it 'swtiches players' do
    first_player = 'a'
    second_player = 'b'
    current_player = first_player
    expect(board.switch).to_not eql(second_player)
  end
end

  describe 'valid_move' do
    it 'checks the valid move' do
      expect(board.valid_move(10)).to eql(false)
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
end

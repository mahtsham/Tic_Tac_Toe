require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }
  describe 'update' do
    it 'update the move of player1' do
      expect(board.update(2, 'X')).to eql('X')
    end
  end
  describe 'update' do
    it 'update the move of player2' do
      expect(board.update(1, 'O')).to eql('O')
    end
  end
  describe 'update' do
    it 'not update if already taken' do
      expect(board.update(1, 'O')).to eql('O')
      expect(board.update(1, false)).to_not eql(true)
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
      player1 = 'a'
      player2 = 'b'
      current_player = player1
      expect(board.switch).to_not eql(player2)
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

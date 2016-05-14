class Piece
  attr_accessor :pos, :color
  attr_reader :board

  def initialize(board, pos = nil, color = nil)
    @board = board
    @color = color
    @pos = pos
  end

  def valid_moves
    moves.reject { |end_pos| move_into_check?(end_pos) }
  end

  private

  def move_into_check?(end_pos)
    test_board = board.dup
    test_board.move!(@pos, end_pos)
    test_board.in_check?(color)
  end
end

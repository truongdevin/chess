require_relative 'piece'
require_relative 'SteppingPiece'

class King < Piece
  include SteppingPiece

  def move_dirs
    SteppingPiece::KING_DIR
  end

  def to_s
    color == :white ? " \u2654 " : " \u265A "
  end

end

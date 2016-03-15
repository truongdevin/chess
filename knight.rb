class Knight < Piece
  include SteppingPiece

  def move_dirs
    SteppingPiece::KNIGHT_DIR
  end

  def to_s
    color == :white ? " \u2658 " : " \u265E "
  end

end

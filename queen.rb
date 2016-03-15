

class Queen < Piece
  include SlidingPiece

  def move_dirs
    SlidingPiece::CARDINAL_DIRECTIONS + SlidingPiece::NONCARDINAL_DIRECTIONS
  end

  def to_s
    color == :white ? " \u2655 " : " \u265B "
  end

end



class Rook < Piece
  include SlidingPiece

  def move_dirs
    SlidingPiece::CARDINAL_DIRECTIONS
  end

  def to_s
    " ♖ "
  end

end

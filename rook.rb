
class Rook < Piece
  include SlidingPiece

  def move_dirs
    SlidingPiece::CARDINAL_DIRECTIONS
  end

  def to_s
    color == :white ? " \u2656 " : " \u265C "
  end

end

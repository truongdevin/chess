require_relative 'piece'
require_relative 'SlidingPiece'

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    SlidingPiece::NONCARDINAL_DIRECTIONS
  end

  def to_s
    color == :white ? " \u2657 " : " \u265D "
  end

end

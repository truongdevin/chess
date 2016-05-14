require_relative 'piece'
require_relative 'SlidingPiece'

class Bishop < Piece
  include SlidingPiece

  def to_s
    color == :black ? " \u2657 " : " \u265D "
  end

  private

  def move_dirs
    SlidingPiece::NONCARDINAL_DIRECTIONS
  end

end

require_relative 'piece'
require_relative 'SlidingPiece'

class Queen < Piece
  include SlidingPiece

  def to_s
    color == :white ? " \u2655 " : " \u265B "
  end

  private

  def move_dirs
    SlidingPiece::CARDINAL_DIRECTIONS + SlidingPiece::NONCARDINAL_DIRECTIONS
  end
end

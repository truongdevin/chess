require_relative 'piece'
require_relative 'SlidingPiece'

class Rook < Piece
  include SlidingPiece

  def to_s
    color == :white ? " \u2656 " : " \u265C "
  end

  private

  def move_dirs
    SlidingPiece::CARDINAL_DIRECTIONS
  end
end

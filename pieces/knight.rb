require_relative 'piece'
require_relative 'SteppingPiece'

class Knight < Piece
  include SteppingPiece

  def to_s
    color == :white ? " \u2658 " : " \u265E "
  end

  private

  def move_diffs
    [[-2, -1],
     [-1, -2],
     [-2, 1],
     [-1, 2],
     [1, -2],
     [2, -1],
     [1, 2],
     [2, 1]]
  end
end

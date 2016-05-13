require_relative 'piece'
require_relative 'SteppingPiece'

class King < Piece
  include SteppingPiece

  def move_diffs
    [[-1, -1],
     [-1, 0],
     [-1, 1],
     [0, -1],
     [0, 1],
     [1, -1],
     [1, 0],
     [1, 1]]
  end

  def to_s
    color == :white ? " \u2654 " : " \u265A "
  end

end

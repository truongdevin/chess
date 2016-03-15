class Pawn < Piece
  # include SteppingPiece

  def move_dirs
    # if (pos[0] == 1 && color == :black) || (pos[0] == 6 && color == :white)
    #   move_dirs = [[2,0],[1,0]]
    # elsif board.has_adjacent?
    #   move_dirs = [[1,0], [1,1], ]

  end

  def to_s
    color == :white ? " \u2659 " : " \u265F "
  end

end

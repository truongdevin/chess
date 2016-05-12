
# # require_relative "SlidingPiece"
# require_relative "rook"
# require_relative "bishop"
# # require_relative "queen"
# require_relative "nullpiece"



class Piece
  attr_accessor :pos, :color
  attr_reader :board

  def initialize(board, pos = nil, color = nil)
    @board = board
    @color = color
    @pos = pos
  end




end

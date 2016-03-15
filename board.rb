require_relative "SlidingPiece"
require_relative "piece"
require_relative "rook"
require_relative "display"
require_relative "nullpiece"


class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}}
    populate_board
  end

  def []=(x,y, target)
    @grid[x][y] = target
  end

  def [](x,y)
    @grid[x][y]
  end

  # def show_board
  #   (0..7).each do |row|
  #     (0..7).each do |col|
  #       puts self[row,col]
  #     end
  #     print "\n"
  #   end
  # end

  def rows
    @grid
  end

  def populate_board
    (0..7).each do |row|
      (0..7).each do |col|
        self[row,col] = Rook.new(self) unless row.between?(2,5)
      end
    end
  end

  def move(start, end_pos)
    if !empty_position?(start) && empty_position?(end_pos)
      self[*end_pos] = self[*start]
      self[*start] = NullPiece.new
    end
  end

  def empty_position?(end_pos)   #end_pos is an array returns false if there's a piece in the position
    self[end_pos[0], end_pos[-1]].is_a?(Piece) ? false : true
  end

  def in_bounds?(pos)
    true if pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def valid_pos(pos)

end

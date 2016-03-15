require_relative "SlidingPiece"
require_relative "SteppingPiece"
require_relative "piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "king"
require_relative "knight"
require_relative "display"
require_relative "nullpiece"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}} #TODO Refactor
    populate_board
  end

  def []=(pos, target)
    x, y = pos
    @grid[x][y] = target
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  # def show_board
  #   (0..7).each do |row|
  #     (0..7).each do |col|
  #       puts self[row,col]
  #     end
  #     print "\n"
  #   end
  # end



  def populate_board
    special_pieces = [Rook.new(self), Knight.new(self),
      Bishop.new(self), Queen.new(self), King.new(self),
      Bishop.new(self), Knight.new(self), Rook.new(self) ]

    (0..7).each do |col|
      self[[0,col]] = special_pieces[col]
      self[[0,col]].color = :black
      self[[0,col]].pos = [0,col]
    end

    (0..7).each do |col|
      self[[7,col]] = special_pieces[col].dup
      self[[7,col]].color = :white
      self[[7,col]].pos = [7,col]
    end
  end


  def rows
    @grid
  end

  # def populate_board
  #   (0..7).each do |row|
  #     (0..7).each do |col|
  #       self[[row,col]] = Knight.new(self, [row,col], :white) unless row.between?(2,5)
  #     end
  #   end
  # end


  def move(start, end_pos)
    if !empty?(start)
      if self[start].moves.include?(end_pos)
        self[end_pos] = self[start]
        self[end_pos].pos = end_pos
        self[start] = NullPiece.new
      else
        puts "Invalid Move!  Try again."
        sleep(2)
      end
    end
  end

  def empty?(pos)   #end_pos is an array returns false if there's a piece in the position
    self[pos].is_a?(Piece) ? false : true
  end

  def valid_pos?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7) ? true : false
  end

end

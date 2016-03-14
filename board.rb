require_relative "piece"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate_board
  end

  def []=(x,y, target)
    @grid[x][y] = target
  end

  def [](x,y)
    @grid[x][y]
  end

  def show_board
    (0..7).each do |row|
      (0..7).each do |col|
        self[row,col].is_a?(Piece) ? print("P") : print("-")
      end
      print "\n"
    end
  end

  def populate_board
    (0..7).each do |row|
      (0..7).each do |col|
        self[row,col] = Piece.new unless row.between?(2,5)
      end
    end
  end

  def move(start, end_pos)
    if !empty_position?(start) && empty_position?(end_pos)
      self[end_pos[0], end_pos[1]] = self[start[0], start[1]]
      self[start[0],start[1]] = nil
    end
  end

  def empty_position?(end_pos)   #end_pos is an array returns false if there's a piece in the position
    self[end_pos[0], end_pos[-1]].is_a?(Piece) ? false : true
  end

end

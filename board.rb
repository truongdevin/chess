require_relative 'pieces'

class Board
  attr_reader :grid

  def initialize(fill_board = true)
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}}
    populate_board if fill_board
  end

  def []=(pos, target)
    x, y = pos
    @grid[x][y] = target
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def populate_board
    special_pieces = [Rook.new(self), Knight.new(self),
      Bishop.new(self), Queen.new(self), King.new(self),
      Bishop.new(self), Knight.new(self), Rook.new(self) ]

    (0..7).each do |col|
      #set up black and white pawns
      self[[1,col]] = Pawn.new(self, [1,col], :black)
      self[[6,col]] = Pawn.new(self, [6,col], :white)

      # set up black special pieces
      self[[0,col]] = special_pieces[col]
      self[[0,col]].color = :black
      self[[0,col]].pos = [0,col]

      # set up white special pieces
      self[[7,col]] = special_pieces[col].dup
      self[[7,col]].color = :white
      self[[7,col]].pos = [7,col]
    end
  end

  def rows
    @grid
  end

  def move(color, start, end_pos)
    if empty?(start)
      raise "Selected an empty start position"
    elsif self[start].color != color
      raise "Please select your own pieces"
    elsif !self[start].moves.include?(end_pos)
      raise "You can't move there. Try again."
    elsif !self[start].valid_moves.include?(end_pos)
      raise "You can't move into check"
    else
      self[end_pos] = self[start]
      self[end_pos].pos = end_pos
      self[start] = NullPiece.new
    end
  end

  # moves a piece without checking for check 
  def move!(start, end_pos)
    if self[start].moves.include?(end_pos)
      self[end_pos] = self[start]
      self[end_pos].pos = end_pos
      self[start] = NullPiece.new
    else
      puts "Invalid Move!  Try again."
      sleep(2)
    end
  end

  def dup
    new_board = Board.new(false)

    pieces.each do |piece|
      new_board[piece.pos] = piece.class.new(new_board, piece.pos, piece.color )
    end
    new_board
  end

  def empty?(pos) 
    self[pos].is_a?(Piece) ? false : true
  end

  def valid_pos?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7) ? true : false
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    pieces.any? do |piece|
      piece.color != color && piece.moves.include?(king_pos)
    end
  end

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.select { |p| p.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def find_king(color)
    king = pieces.find { |piece| piece.color == color && piece.is_a?(King) }
    king
  end

  def pieces
    rows.flatten.select { |piece| piece.is_a?(Piece) }
  end

  def adjacents(pos)
    moves = []
    x,y = pos
    

    if self[pos].color == :black
      take_right = [x+1, y+1]
      take_left = [x+1, y-1]
    else
      take_right = [x-1, y-1]
      take_left = [x-1, y+1]
    end

    if self[take_right].color != self[pos].color && self[take_right].is_a?(Piece)
      moves << take_right if valid_pos?(take_right)
    end

    if self[take_left].color != self[pos].color && self[take_left].is_a?(Piece)
      moves << take_left if valid_pos?(take_left)
    end
    moves
  end


end

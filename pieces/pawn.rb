class Pawn < Piece

  def to_s
    color == :white ? " \u2659 " : " \u265F "
  end

  def moves
    forward_moves + diagonal_moves
  end

  private

  def forward_dir
    color == :white ? -1 : 1
  end

  def start_row?
    pos[0] == (color == :white ? 6 : 1)
  end

  def forward_moves
    row, col = pos
    forward_one = [row + forward_dir, col]
    return [] unless board.valid_pos?(forward_one) && board.empty?(forward_one)
    possible_moves = [forward_one]

    forward_two = [row + 2* forward_dir, col]
    possible_moves << forward_two if start_row? && board.empty?(forward_two)
    possible_moves
  end

  def diagonal_moves
    row, col = pos
    diag_moves = [[row + forward_dir, col + 1], [row + forward_dir, col - 1]]

    diag_moves.select do |move|
      (board.valid_pos?(move) && !board.empty?(move) && board[move] != color)
    end
  end

end

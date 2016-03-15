module SteppingPiece

  KING_DIR = [
    [-1, 0],
    [1,0],
    [0,1],
    [0,-1],
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
  ]

  KNIGHT_DIR = [
    [1,2],
    [2,1],
    [2,-1],
    [1,-2],
    [-1,-2],
    [-2,-1],
    [-2,1],
    [-1,2]
  ]

  def moves
    moves = []

    move_dirs.each do |dx,dy|
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end

    moves
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    cur_x, cur_y = pos
    moves = []
    loop do
      cur_x, cur_y = cur_x + dx, cur_y + dy
      new_pos = [cur_x,cur_y]
      break unless board.valid_pos?(new_pos)

      if board.empty?(new_pos)
        moves << new_pos
      else
        moves << new_pos unless board[new_pos].color == color       # TODO
        break
      end
      break if move_dirs == KING_DIR || move_dirs == KNIGHT_DIR

    end

    moves
  end

end

module SlidingPiece

  CARDINAL_DIRECTIONS = [
    [-1, 0],
    [1,0],
    [0,1],
    [0,-1]
  ]

  NONCARDINAL_DIRECTIONS = [
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
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
      pos = [cur_x,cur_y]
      break unless board.valid_pos?(pos)                  # TODO

      if board.empty?(pos)                              # TODO
        moves << pos
      else
        moves << pos if board[pos].color != color       # TODO
        break
      end
    end
  end

end

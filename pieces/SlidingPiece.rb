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
      new_pos = [cur_x,cur_y]
      break unless board.valid_pos?(new_pos)

      if board.empty?(new_pos)
        moves << new_pos
      else
        moves << new_pos unless board[new_pos].color == color       # TODO
        break
      end
    end

    moves
  end

end

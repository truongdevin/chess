class Pawn < Piece
  # include SteppingPiece

  def to_s
    color == :white ? " \u2659 " : " \u265F "
  end
  
  def get_increment
    moves =[]
    if pos[0] == 1 && color == :black
      moves = [[2,0],[1,0]] + board.adjacents(pos)
    else
      moves = [[1,0]] + board.adjacents(pos)
    end

    if pos[0] == 6 && color == :white
      moves = [[-2,0],[-1,0]] + board.adjacents(pos)
    else
      moves = [[-1,0]] + board.adjacents(pos)
    end
    byebug
    moves
  end


  def moves
    moves = []

    get_increment.each do |dx,dy|
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
      break

    end

    moves
  end

end

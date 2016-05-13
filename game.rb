require_relative "board"
require_relative "player"
require 'byebug'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player = Player.new(@display)
  end

  def run
    start_pos = nil
    end_pos = nil
    until false #until checkmate?
      start_pos = @player.move

      # p @board[start_pos].moves
      # sleep(3)

      # p @board[start_pos].color
      # p @board[start_pos].pos
      # p @board.adjacents(start_pos)
      end_pos = @player.move
      @board.move(start_pos,end_pos)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end

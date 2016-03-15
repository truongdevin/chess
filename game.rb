require_relative "board"
require_relative "player"
require 'byebug'

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    start_pos = nil
    end_pos = nil
    until false #until checkmate?
      start_pos = @player.move
      p @board[start_pos].moves
      p @board[start_pos].color
      sleep(2)
      end_pos = @player.move
      @board.move(start_pos,end_pos)
    end

    puts "Hooray, the board is filled!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end

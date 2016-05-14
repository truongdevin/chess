require_relative "board"
require_relative "player"
require 'byebug'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    # @player = Player.new(@display)
    @players = {
      white: Player.new(:white, @display),
      black: Player.new(:black, @display)
    }
    @current_player = :white
  end

  def run
    start_pos = nil
    end_pos = nil
    # until false #until checkmate?
    until @board.checkmate?(@current_player)
      # debugger
      start_pos = @players[@current_player].move
      end_pos = @players[@current_player].move
      @board.move(@current_player,start_pos,end_pos)

      swap_turn!
    end
    # until @board.checkmate?(@current_player)
    #   begin
    #     start_pos = @players[@current_player].move
    #     end_pos = @players[@current_player].move
    #     board.move(start_pos, end_pos)

    #     swap_turn!
    #     # notify_players
    #   rescue StandardError => e
    #     # @display.notifications[:error] = e.message
    #     retry
    #   end
    # end

  end

  def swap_turn!
    @current_player = (@current_player == :white) ? :black : :white
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end

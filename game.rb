require_relative "board"
require_relative "player"
require 'byebug'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: Player.new(:white, @display),
      black: Player.new(:black, @display)
    }
    @current_player = :white
  end

  def run
    start_pos = nil
    end_pos = nil
    until @board.checkmate?(@current_player)
      @display.notifications[:current_player] = "#{@current_player}'s Turn"

      if @board.in_check?(@current_player)
        @display.notifications[:check] = "You're in check!"
      end

      begin
        start_pos = @players[@current_player].move
        end_pos = @players[@current_player].move
        @board.move(@current_player,start_pos,end_pos)

        swap_turn!
      rescue StandardError => e
        @display.notifications[:error] = e.message
        retry
      end
    end

    @display.notifications[:game_over] = "#{@current_player} is checkmated."
    @display.render
  end

  private

  def swap_turn!
    @current_player = (@current_player == :white) ? :black : :white
    @display.reset!
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end

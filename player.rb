require_relative "display"

class Player
  def initialize(color, display)
    @color = color
    @display = display
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end
end

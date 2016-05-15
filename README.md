#Chess

This is a version of chess meant to be played on the terminal. It is built using Ruby with object-oriented programming. At the moment it is not compatible with Windows OS. 

This version currently requires two human players. AI will be implemented in the future. The game continues until a player has been checkmated. White moves first.

## Starting the game
To get started, download this repository and step into it. As mentioned earlier, Ruby will be necessary to run this. After Ruby has been set up, install the colorize gem by typing in the following:

```bash
gem install colorize
``` 
Finally you can start the game by running the following:

```bash
ruby game.rb
```

##Implementation Details

### Check
In order to handle check, I wrote a `Piece#move_into_check?(end_pos)` method which duplicates the `Board` and calls `Board#in_check?`.

```ruby
def move_into_check?(end_pos)
  test_board = board.dup
  test_board.move!(@pos, end_pos)
  test_board.in_check?(color)
end
```

```ruby
def in_check?(color)
  king_pos = find_king(color).pos
  pieces.any? do |piece|
    piece.color != color && piece.moves.include?(king_pos)
  end
end
```

Ruby's native `dup` method does not make a deep copy. I overwrite it with the following:

```ruby
def dup
  new_board = Board.new(false)
  pieces.each do |piece|
    new_board[piece.pos] = piece.class.new(new_board, piece.pos, piece.color )
  end
  new_board
end
```

### Checkmate

If a player is in check, and if none of the player's pieces have any `#valid_moves`, the player is in checkmate.

```ruby
def checkmate?(color)
  return false unless in_check?(color)

  pieces.select { |p| p.color == color }.all? do |piece|
    piece.valid_moves.empty?
  end
end
```

##Future Directions for the Project
- Integrate AI
- Implement support for Windows



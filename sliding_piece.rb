require_relative 'piece'
class SlidingPiece < Piece

  MOVE_DIRECTIONS = {
    :axials => [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ],

    :diagonals => [
      [1, 1],
      [-1, 1],
      [1, -1],
      [-1, -1]
    ]
  }

  def move_directions
  end

  def moves
    moves = []
    move_directions.each do |direction|

      new_pos = [self.position[0] + direction[0],
                 self.position[1] + direction[1]]
      moves += move_in_direction(new_pos, direction)
    end

    moves
  end

  def move_in_direction(pos, direction)

    return [] if !in_bounds?(pos) || on_piece?(pos)

    new_pos = [pos[0] + direction[0], pos[1] + direction[1]]
    [pos] + move_in_direction(new_pos, direction)
  end
end

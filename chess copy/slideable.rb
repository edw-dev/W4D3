require_relative "piece"
module Slideable
    def moves
        moves = []
        case self.move_dirs
        when "horizontal"
            moves += grow_unblocked_moves(horizontal_dirs)
        when "diagonal"
            moves += grow_unblocked_moves(diagonal_dirs)
        when "both"
            moves += grow_unblocked_moves(horizontal_dirs)
            moves += grow_unblocked_moves(diagonal_dirs)
        end
    moves
    end

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def grow_unblocked_moves(direction)
        row, col = self.pos
        direction_moves = []
        direction.each do |dir|
            i = row
            j = col
            idx, jdx = dir
            direction = []
            while valid_pos([i+idx, j+jdx])
                direction << [i + idx, j + jdx]
                i += idx
                j += jdx   
            end
            direction_moves << direction
        end
        direction_moves
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    private
    HORIZONTAL_DIRS = [
        [-1, 0],
        [0, 1],
        [1, 0],
        [0, -1]
    ]

    
end

class Rook < Piece
include Slideable
    def initialize(color, board, pos)
        super
    end

    private
    def move_dirs
        "horizontal"
    end
end
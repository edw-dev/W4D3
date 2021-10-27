require_relative "piece"
module Slideable
    def moves
        moves = []
        if self.move_dirs == "horizontal"
            moves += horizontal_dirs
        end

    moves
    end

    def horizontal_dirs
        row, col = self.pos
        horizontal_moves = []
        HORIZONTAL_DIRS.each do |dir|
            i = row
            j = col
            idx, jdx = dir
            direction = []
            while (i < 7 && i >= 1) && (j < 7 && j >= 1 )
                direction << [i + idx, j + jdx]
                i += idx
                j += jdx   
            end
            horizontal_moves << direction
        end
        horizontal_moves
    end

    def diagonal_dirs

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



require_relative "piece"
module Slideable
    def moves
        moves = []
        case move_dirs
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

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    private
    def grow_unblocked_moves(direction)
        row, col = self.pos
        direction_moves = []
        direction.each do |dir|
            i = row
            j = col
            idx, jdx = dir
            direction = []
            while self.board.valid_pos?([i+idx, j+jdx])
                if self.board[i+idx, j+jdx].empty?     
                    direction << [i + idx, j + jdx] 
                    i += idx
                    j += jdx
                elsif self.board[i+idx, j+jdx].color != self.color
                    direction << [i + idx, j + jdx] 
                    break
                else
                    break
                end   
            end
            direction_moves << direction if !direction.empty?
        end
        direction_moves
    end

    HORIZONTAL_DIRS = [
        [-1, 0],
        [0, 1],
        [1, 0],
        [0, -1]
    ]
    DIAGONAL_DIRS = [
        [-1, -1],
        [-1, 1],
        [1, 1],
        [1, -1]
    ]

    
end





require_relative "piece"
module Stepable
    def moves
        grow_unblocked_moves(move_diffs)
    end

    private
    def grow_unblocked_moves(direction)
        row, col = self.pos
        direction_moves = []
        direction.each do |dir|
            i = row
            j = col
            idx, jdx = dir
            #direction = []
#            while self.board.valid_pos?([i+idx, j+jdx])
                if self.board[i+idx, j+jdx].empty? && self.board.valid_pos?([i+idx, j+jdx])
                    direction_moves << [i + idx, j + jdx] 
                elsif self.board[i+idx, j+jdx].color != self.color && self.board.valid_pos?([i+idx, j+jdx])
                    direction_moves << [i + idx, j + jdx] 
                end   
#            end
#            direction_moves << direction if !direction.empty?
        end
        direction_moves
    end 
end


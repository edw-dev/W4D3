

require_relative "piece"
require_relative "stepable"
class Knight < Piece
    include Stepable
        def initialize(color, board, pos)
            super
            @symbol = :N
        end
    
        def symbol
            @symbol
        end
        private
        def move_diffs
            [
                [1,-2],
                [-1,-2],
                [-1,2],
                [1,2],
                [2,1],
                [2,-1],
                [-2,1],
                [-2,-1]
            ]
        end
    end
require_relative "piece"
require_relative "slideable"
class Bishop < Piece
    include Slideable
        def initialize(color, board, pos)
            super
            @symbol = :B
        end
    
        def symbol
            @symbol
        end
        private
        def move_dirs
            "diagonal"
        end
    end
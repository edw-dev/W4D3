require_relative "piece"
require_relative "slideable"
class Queen < Piece
    include Slideable
        def initialize(color, board, pos)
            super
            @symbol = :Q
        end
    
        def symbol
            @symbol
        end
        private
        def move_dirs
            "both"
        end
    end
require_relative "piece"
require_relative "slideable"
class Rook < Piece
    include Slideable
        def initialize(color, board, pos)
            super
            @symbol = :R
        end
    
        def symbol
            @symbol
        end
        private
        def move_dirs
            "horizontal"
        end
    end
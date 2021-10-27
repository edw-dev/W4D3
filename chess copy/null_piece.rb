


require_relative "piece"
require "Singleton"

class NullPiece < Piece
include Singleton
        attr_reader :symbol, :color
        def initialize
            @symbol = " "
            @color = nil
        end
        def move

        end
end
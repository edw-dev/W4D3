#require "colorize"

class Piece
    attr_reader :board, :pos, :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos 
    end

    def inspect
         @symbol.inspect
    end

    def empty?
        self.symbol == :N ? true : false
    end

end
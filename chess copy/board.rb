


require_relative "piece"
require_relative "null_piece" # REMOVE LATER 
require_relative "pawn" # REMOVE LATER 
require_relative "rook"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "slideable"
require "byebug"
class Board
    attr_reader :grid
    def initialize()
        @grid = Array.new(8){Array.new(8,NullPiece.instance)}
        row_comp(:black, 0)
        row_pawn(:black, 1)
        row_comp(:white, 7)
        row_pawn(:white, 6)
    end

    def row_comp(color, row)
        add_piece(Rook.new(color, self, [row, 0]), [row, 0])
        add_piece(Rook.new(color, self, [row, 7]), [row, 7])
        add_piece(Knight.new(color, self, [row, 1]), [row, 1])
        add_piece(Knight.new(color, self, [row, 6]), [row, 6])
        add_piece(Bishop.new(color, self, [row, 2]), [row, 2])
        add_piece(Bishop.new(color, self, [row, 5]), [row, 5])
        color == :black ? col = 3 : col = 4
        add_piece(King.new(color, self, [row, col]), [row, col])
        color == :black ? col = 4 : col = 3
        add_piece(Queen.new(color, self, [row, col]), [row, col])
    end

    def row_pawn(color, row)
        (0..7).each { |col| add_piece(Pawn.new(color, self, [row, col]), [row, col])}
    end

    def [](pos1, pos2)
        row = pos1
        col = pos2
        @grid[row][col]
    end

    def []=(pos1, pos2, val)
        row = pos1
        col = pos2
        @grid[row][col] = val
    end

    def valid_pos?(pos)
        row, col = pos
        if row > 7 || row < 0 
            return false
        elsif col > 7 || col < 0
            return false
        end
    true
    end

    def add_piece(piece, pos)
        row, col = pos
        @grid[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        # raise "no piece at start position" if self[start_pos].nil?
        #fix conitional logic
        # raise "piece cannot reach end position" if !self[end_pos].nil?
        if self[*start_pos].moves.include?(end_pos)
            self[*end_pos], self[*start_pos] = self[*start_pos], self[*end_pos]
        # else reprompt
        end
    end
end

board = Board.new
p board
#p board.grid.each_with_index {|row, i| row.each_with_index{|ele, j| p ele if i == 2 && j ==0}}
# p board[6, 6].moves
# p board

board.move_piece([0, 5], [3, 6])
p board

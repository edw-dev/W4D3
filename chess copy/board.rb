require_relative "piece"
require_relative "slideable"
require "byebug"
class Board
    attr_reader :grid
    def initialize()
        @grid = Array.new(8){Array.new(8, nil)}
        # @grid.each_with_index do |row, idx1|
        #     if idx1 == 0 || idx1 == 1 || idx1 == 6 || idx1 == 7
        #         row.each_with_index do |ele, idx2|
        #             @grid[idx1][idx2] = Piece.new(:white, self, [idx1, idx2])
        #         end
        #     end
        # end
    add_piece(Rook.new(:black, self, [2,0]), [2,0])
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

    def add_piece(piece, pos)
        row, col = pos
        @grid[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        raise "no piece at start position" if self[start_pos].nil?
        #fix conitional logic
        raise "piece cannot reach end position" if !self[end_pos].nil?
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
end

board = Board.new
p board.grid.each_with_index {|row, i| row.each_with_index{|ele, j| p ele if i == 2 && j ==0}}
p board.grid[2][0].moves

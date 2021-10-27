require_relative "piece"

class Pawn < Piece
        def initialize(color, board, pos)
            super
            @symbol = :P
        end
    
        def symbol
            @symbol
        end
        
        def moves

            [
                [-1, 0],
                [0, 1],
                [1, 0],
                [0, -1],
                [-1, -1],
                [-1, 1],
                [1, 1],
                [1, -1]
            ]
        end
        # private
        def at_start_row?

        end

        def forward_dir
            return 1 if @color == :black
            -1 
        end

        def forward_steps
            return at_start_row? ? 2 : 1
        end

        def side_attacks
            row, col = @pos
            attacks = []
            row += forward_dir
            if !board[row, col + 1].empty? && board[row, col + 1].color != @color
                attacks << [row, col + 1] 
            end
            if !board[row, col - 1].empty? && board[row, col + 1].color != @color
                attacks << [row, col - 1]
            end
        attacks
        end

    end
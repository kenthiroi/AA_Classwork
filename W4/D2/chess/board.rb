require_relative 'piece'
class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = nil
        populate
    end

    def populate
        rooks= [[0,0],[0,7],[7,0],[7,7]]
        kings =[[0,3],[7,3]]
        queens=[[0,4],[7,4]]
        knights=[[0,1], [0,6], [7,1],[7.6]]
        bishops=[[0,2],[0,5],[7,2],[7,5]]

        @rows.each_with_index do |row, i|
            row.each_with_index do |square, j|
                position = [i, j]
                if i==6 || i==1
                    self[position]=(Piece.new("Pawn"))
                elsif i>=2 && i<=5
                    self[position]=nil
                elsif rooks.include?(position)
                    self[position]=(Piece.new("Rook"))
                elsif knights.include?(position)
                    self[position]=(Piece.new("Knight"))
                elsif bishops.include?(position)
                    self[position]=(Piece.new("Bishop"))
                elsif kings.include?(position)
                    self[position]=(Piece.new("King"))
                elsif queens.include?(position)
                    self[position]=(Piece.new("Queen"))
                end
            end
        end
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @rows[pos[0]][pos[1]] = value
    end

    def move_piece( start_pos, end_pos)
        if !self[start_pos].is_a?(Piece)
            raise "Invalid position"
        elsif start_pos[0] < 0 || start_pos[0] > 7 || end_pos[0] < 0 || end_pos[0] > 7
        end
        moved_piece=@rows[start_pos[0]][start_pos[1]]
        self[start_pos]= @rows[end_pos[0]][end_pos[1]]
        self[end_pos]= moved_piece
    end

    def valid_pos?(pos)
        if !self[pos].is_a?(Piece)
            raise "Invalid position"
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end
end
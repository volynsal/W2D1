require_relative "piece.rb"
require 'byebug'
class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) } 
        #@sentinel = NullPiece.new
        setup
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # debugger
        # start = @rows[start_pos]
        # final =  @rows[end_pos]
        raise "no piece at start position" unless self[start_pos].is_a?(Piece)
        raise "piece cannot move to this end position" unless self[end_pos] == nil
        #debugger
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    private

    def setup 
        (0...@rows.length).each do |idx1|
            (0...@rows.length).each do |idx2|
                if [0,1,6,7].include?(idx1)
                    new_piece = Piece.new    
                    @rows[idx1][idx2] = new_piece
                end
            end
        end
    end
end


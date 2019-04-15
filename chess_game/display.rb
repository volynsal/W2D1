require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def render
        system("clear")
        board.rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                # debugger
               if piece.is_a?(Piece) 
                if cursor.cursor_pos == [i,j]
                    print piece.to_s.blue
                else
                    print piece.to_s 
                end
               else
                if cursor.cursor_pos == [i,j]
                    print "o".blue
                else
                    print "o"
                end
               end
            end
            print "\n"
        end

        nil
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    display = Display.new(board)
    display.render
end
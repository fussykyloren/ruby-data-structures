require_relative "board.rb"
require_relative "knight.rb"

def knight_moves(start, target)
    knight = Knight.new
    board = Board.new

    board.move(knight, start, target)
end

knight_moves([3,3],[4,3])
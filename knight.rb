class GameBoard
    attr_accessor = :board
    def initialize
        @board = createBoard()
    end

    def createBoard()
        Array.new(8) {Array.new(8, [])}
    end
end

class Knight
    attr_accessor = :gameboard

    def initialize(gameboard)
        @gameboard = gameboard
    end

    def validate_move(position, possible_moves)
        x = position[0]
        y = position[1]
        
        if x >= 0 && x <= 7 && y >= 0 && y <= 7
            possible_moves << position
        end
    end

    def moves(position)
        x = position[0]
        y = position[1]
        possible_moves = []

        validate_move([x - 1, y + 2], possible_moves)
        validate_move([x - 2, y + 1], possible_moves)
        validate_move([x + 1, y + 2], possible_moves)
        validate_move([x + 2, y + 1], possible_moves)
        validate_move([x - 1, y - 2], possible_moves)
        validate_move([x - 2, y - 1], possible_moves)
        validate_move([x + 1, y - 2], possible_moves)
        validate_move([x + 2, y  - 1], possible_moves)

        return possible_moves
    end

    def knight_moves(start_position, end_position)
        path = []
        path << end_position

        until path.first == start_position
            path.unshift(find_prev_move(start_position, path.first))
        end

        print_path(path)
    end

    def print_path(moves)
        puts "\nYou made it in #{moves.length - 1} moves. Your path was: "
        moves.each do |move|
            print move
        end
    end

    def find_prev_move(start_position, end_position)
        queue = []
        queue << start_position

        until queue.empty?
            position = queue.shift
            possible_moves = moves(position)

            possible_moves.each do |move|
                queue << move

                return position if move == end_position
            end
        end
    end
end

gameboard = GameBoard.new
knight = Knight.new(gameboard)

knight.knight_moves([0,0],[1,2])
knight.knight_moves([1,1],[3,7])
knight.knight_moves([3,3],[6,1])
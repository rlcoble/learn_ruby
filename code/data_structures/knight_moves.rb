class Board

	def initialize
		@moves = []
	end


	def knight_init(origin, parent = 0)
		knight = Knight.new(origin)
		knight.parent = parent if parent != 0
		if origin[0]+2 <= 7
			knight.moves << [origin[0]+2,origin[1]+1] if origin[1]+1 <= 7
			knight.moves << [origin[0]+2,origin[1]-1] if origin[1]-1 >= 0
		end

		if origin[0]-2 >= 0
			knight.moves << [origin[0]-2,origin[1]+1] if origin[1]+1 <= 7
			knight.moves << [origin[0]-2,origin[1]-1] if origin[1]-1 >= 0
		end

		if origin[0]+1 <= 7
			knight.moves << [origin[0]+1,origin[1]+2] if origin[1]+2 <= 7
			knight.moves << [origin[0]+1,origin[1]-2] if origin[1]-2 >= 0
		end

		if origin[0]-1 >= 0
			knight.moves << [origin[0]-1,origin[1]+2] if origin[1]+2 <= 7
			knight.moves << [origin[0]-1,origin[1]-2] if origin[1]-2 >= 0
		end
		return knight
	end

	def bfs(destination, knight)
		queue = [knight]
		queue.each do |node|
			return @moves if destination == node.origin
			node.moves.each do |move|
				if move == destination
					return backtrace(knight_init(move, node), knight.origin)
				end
				queue << knight_init(move, node)
			end
		end
		return nil
	end

	def knight_moves(origin, destination)
		knight = knight_init(origin)
		moves = bfs(destination, knight)
		p moves
	end

	def backtrace(knight, origin)
		@moves << knight.origin
		while knight.origin != origin
			@moves.unshift(knight.parent.origin)
			knight = knight.parent
		end
		return @moves
	end
end

class Knight
	attr_reader :origin
	attr_accessor :moves, :parent
	def initialize(origin)
		@origin = origin
		@moves = []
	end
end

b = Board.new
b.knight_moves([3,3],[4,3])
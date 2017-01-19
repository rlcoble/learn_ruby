class Connect4
	attr_reader :player_1, :player_2
	attr_accessor :board
	
	def initialize
		@board = []
		0.upto(6) do |i|
			@board << Array.new
			0.upto(6){|j| @board[i] << j}
		end
		print "Player 1's Name: "
		@player_1 = Player.new
		@player_1.icon = "o"
		print "Player 2's Name: "
		@player_2 = Player.new
		@player_2.icon = "x"
		@turn = 1
		@game_over = false
		@winner
	end

	def take_turn(player)
		@turn +=1
		move = Array.new
		print "Coordinates: "
		tmp = gets.chomp
		move = tmp.split("")
		move.each_with_index{|s,i| move[i] = s.to_i}
		@board[move[0]][move[1]] = player.icon
		print_board
		win?(player, move)
	end

	def play
		until(@turn==49 || @game_over) do
			@turn.odd? ? take_turn(@player_1) : take_turn(@player_2)
		end
		puts @game_over ? "#{@winner.name} wins!" : "Cat Wins"
	end

	def win?(player, move)
		right = 0
		left = 0
		up = 0
		down = 0
		up_right = 0
		up_left = 0
		down_right = 0
		down_left = 0
		1.upto(3) do |i|
			right += 1 if @board[move[0]][move[1]+i] == player.icon 
			left += 1 if @board[move[0]][move[1]-i] == player.icon 
			up += 1 if @board[move[0]+i][move[1]] == player.icon 
			down += 1 if @board[move[0]-i][move[1]] == player.icon 
			up_right += 1 if @board[move[0]+i][move[1]+i] == player.icon 
			up_left += 1 if @board[move[0]+i][move[1]-i] == player.icon 
			down_right += 1 if @board[move[0]-i][move[1]+i] == player.icon 
			down_left += 1 if @board[move[0]-i][move[1]-i] == player.icon 
		end

		if right==3 || left==3 || up==3 || down==3 || up_right==3 || up_left==3 || down_right==3 || down_left==3
			@game_over = true
			@winner = player 
		else
			return
		end
	end

	def print_board
		print "6: "
		@board[6].each{|i| print " #{i} |"}
		puts ""
		print "5: "
	 	@board[5].each{|i| print " #{i} |"}
	 	puts ""
	 	print "4: "
	 	@board[4].each{|i| print " #{i} |"}
	 	puts ""
	 	print "3: "
	 	@board[3].each{|i| print " #{i} |"}
	 	puts ""
	 	print "2: "
	 	@board[2].each{|i| print " #{i} |"}
	 	puts ""
	 	print "1: "
	 	@board[1].each{|i| print " #{i} |"}
	 	puts ""
	 	print "0: "
	 	@board[0].each{|i| print " #{i} |"}
	 	puts ""
	end
end

class Player
	attr_accessor :name, :icon

	def initialize
		@name = gets.chomp
	end
end

game = Connect4.new
game.play
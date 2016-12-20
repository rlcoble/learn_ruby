class TicTacToe
	 def initialize
	 	@board = ['0','1','2','3','4','5','6','7','8']
	 	@player_1 = Player.new
	 	@player_2 = Player.new
	 	@players = [@player_1, @player_2]
	 	@turn = 1
	 	@game_over = false
	 	@winner
	 end

	 def player_setup
	 	print "Player 1 (x): "
	 	@player_1.name = gets.chomp
	 	@player_1.icon = 'x'

	 	print "Player 2 (o): "
	 	@player_2.name = gets.chomp
	 	@player_2.icon = 'o'

	 	print_board
	 end

	 def win?(player)
	 	@@winning_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	 	@@winning_positions.each do |set| 
	 		return true if @game_over = set.all?{ |pos| @board[pos] == player.icon }
	 	end
	 	false
	 end

	 def play
	 	until (@turn==10 || @game_over) do
	 		@turn.odd? ? take_turn(@player_1) : take_turn(@player_2)
	 	end
	 	9.times{puts @game_over ? "#{@winner} wins!" : "Cat Wins"}
	 end

	 def take_turn(player)
	 	print "Select a cell (0 - 8): "
	 	cell = gets.chomp.to_i
	 	@board[cell] = player.icon
	 	print_board
	 	@turn+=1
	 	@winner = player.name if win?(player)
	 end

	 def print_board
	 	puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	 	puts "---+---+---"
	 	puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	 	puts "---+---+---"
	 	puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	 	puts ""
	 end

	 Player = Struct.new(:name, :icon)
end

g = TicTacToe.new
g.player_setup
g.play
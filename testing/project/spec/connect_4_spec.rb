require "connect_4"

describe Connect4 do 
	game = Connect4.new

	describe ".initialize" do
		context "given user input" do
			it "should save player_1's name" do
				expect(game.player_1.name).to eql("Ryan")
			end

			it "should save player_2's name" do
				expect(game.player_2.name).to eql("Computer")
			end
		end
=begin
		context "after initializing the game board" do
			it "shold be empty" do
				expect(game.board.empty?).to eql(true)
			end
		end
=end	
	end

	describe "#make_move" do
		context "given coordinates" do
			game.make_move
			it "should place them in board array" do
				expect(game.board[0]).to eql([0,0])
			end
		end
	end
end
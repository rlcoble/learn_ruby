class Game
	def initialize(code)
		@code = code
		@turn = 0
		play
	end

	def win?(guess)
		if guess == @code
			puts "You Win!"
			return true
		else
			diff = guess - @code
			puts "You have guessed #{4 - diff.length} correct colors"

			correct_count = 0
			@code.each_with_index do |color,i| 
				correct_count+=1 if color == guess[i]
			end
			puts "And you have #{correct_count} colors in the correct place"
			puts ""
			false
		end
	end

	def play
		until (@turn == 12) do
			puts "Turn: #{@turn}"
			print "Provide a set of 4 colors (no spaces) 'B','G','O','P','R','S','W','Y': "
			guess = gets.chomp.split("")
			win?(guess) ? return : @turn+=1
		end 
		puts "You Lose! Code = #{@code}"
	end
end

class Computer
	
	def initialize
		@colors = ['B','G','O','P','R','S','W','Y']
		@seq = @colors.shuffle[0..3]
		@game = Game.new(@seq)
	end
end


c = Computer.new
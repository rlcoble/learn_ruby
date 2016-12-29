require "yaml"
class Hangman	
	def initialize
		print "Would you like to load a saved game? y or n: "
		if gets.chomp.downcase == "y"
			load_game
		else
			@secret_word = File.readlines("5desk.txt")
			@secret_word.collect!{|word| word.gsub("\r\n",'')}
			@secret_word.select!{|word| word.length.between?(5,12)}
			@secret_word = @secret_word[rand(0..@secret_word.length-1)].downcase

			#puts @secret_word

			@misses_left = 8

			@result = []
			@secret_word.each_char{|char| @result << "_"}
		end
		puts ""
	end

	def save_game
		t = Time.now
		File.open("saves/save_game_#{t.strftime("%b_%d_%I_%M")}.txt",'w') {|f| f.write(YAML::dump(self))}
		exit
	end

	def load_game
		path = "#{Dir.pwd}/saves"
		puts Dir.entries(path)
		print "Choose a save file: "
		file = gets.chomp
		f = YAML.load(File.read("saves/#{file}"))
		@secret_word = f.instance_variable_get(:@secret_word)
		@misses_left = f.instance_variable_get(:@misses_left)
		@result = f.instance_variable_get(:@result)
	end

	def game
		while @misses_left!=0 && @result.join!=@secret_word
			puts @result.join(" ")
			puts ""

			puts "You have #{@misses_left} misses left."
			puts ""

			print "Would you like to save your game and exit? y or n: "
			save_game if gets.chomp.downcase == "y"
			puts ""

			print "What's your guess?: "
			guess = gets.chomp.downcase

			@secret_word.split('').each_with_index do |char,i|
				next unless @result[i] == "_"
				@result[i] = "#{char}" if char==guess
			end
			@misses_left-=1 unless @result.include?("#{guess}")
		end

		puts @result.join==@secret_word ? "YOU WIN!" : "YOU LOSE!"

	end
end

game = Hangman.new
game.game
class Book
	attr_reader :title

	def title=(str)
		new_str = str.split(" ")
		if(new_str.length==1)
			@title=str.capitalize
		else
			tmp = []
			new_str.each do |word|
				if(tmp.length==0)
					tmp.push(word.capitalize)
				elsif((word=="and")||(word=="the")||(word=="of")||(word=="in")||(word=="a")||(word=="an"))
					tmp.push(word)
				else
					tmp.push(word.capitalize)
				end
			end
			@title=tmp.join(" ")
		end
	end
end
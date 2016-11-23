def echo(command)
	command
end

def shout(command)
	command.upcase
end

def repeat(command,times=2)
	((command+" ")*times).strip
end

def start_of_word(word,index)
	word[0..index-1]
end

def first_word(strng)
	words = strng.split(" ")
	words[0]
end

def titleize(strng)
	words = strng.split(" ")
	new_words = []
	if(words.length>1)
		words.each do |word|
			if(((word=="and") || (word=="the") || (word=="over")) && (new_words.length!=0))
				new_words.push(word)
			else
				new_words.push(word.capitalize)
			end
		end
		new_words.join(" ")
	else
		strng.capitalize
	end
end
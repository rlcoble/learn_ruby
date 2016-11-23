def translate(strng)
	new_strng = ""
	tmp = strng.split(" ")
	if(tmp.length==1)
		helper(strng).strip
	else
		tmp.each do |word|
			new_strng+=helper(word)
		end
		new_strng.strip
	end
end

def helper(word)
	new_word = word
	word.each_char do |letter|
		if((letter=="u") && (new_word[-1]=="q") && (word!=new_word))
			tmp = new_word.split("")
			tmp.shift
			new_word=tmp.join
			new_word+=letter
		elsif((letter=="a") || (letter=="e") || (letter=="i") || (letter=="o") || (letter=="u"))
			new_word+="ay"
			break
		else
			tmp = new_word.split("")
			tmp.shift
			new_word=tmp.join
			new_word+=letter
		end
	end
	new_word+" "
end
class CesarCipher  
  def self.cesar_cipher(text,index)
    index%=26
    words = text.split
    new_text = []
    
    words.each do |word|
      new_text.push(CesarCipher.new_word(word,index))
    end
    
    return new_text.join(" ")
  end

  def self.new_word(word,index)
    new_word = []
    
    word.split("").each do |letter|
      if letter =~ /[^A-Za-z]/
        letter = (letter.ord-index).chr
      elsif ((letter =~ /[A-Z]/)&&(letter.ord+index > 90)) || ((letter =~ /[a-z]/)&&(letter.ord+index > 122))
        letter = (letter.ord-26).chr
      end
      new_word.push((letter.ord+index).chr)
    end
    
    return new_word.join
  end
end
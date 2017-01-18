require "cesar_cipher"

describe CesarCipher do
	describe ".cesar_cipher" do
		context "given What a string!, 5" do
			it "returns Bmfy f xywnsl!" do
				expect(CesarCipher.cesar_cipher("What a string!", 5)).to eql ("Bmfy f xywnsl!")
			end
		end
	end
end

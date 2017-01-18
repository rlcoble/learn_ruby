require "enum"

describe "Enumerable" do
	describe "my_each" do
		context "given [1,3,4]" do
			it "returns each element: 1, 3, 4" do
				expect{|element| [1,3,4].my_each(&element)}.to yield_successive_args(1,3,4)
			end
		end
	end
end
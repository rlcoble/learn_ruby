module Enumerable
	def my_each
		for i in (0...self.to_a.length)
			yield(self.to_a[i])
		end
	end

	def my_each_with_index
		for i in (0...self.to_a.length)
			yield(self.to_a[i], i)
		end
	end

	def my_select()
		result = []
		self.my_each do |v|
			if yield(v)
				result.push(v)
			end
		end
		return result
	end

	def my_all?()
		if self==self.my_select{|v| yield(v)}
			return true
		else
			return false
		end
	end

	def my_any?()
		array = self.my_select{|v| yield(v)}
		if array.empty?
			return false
		else
			return true
		end
	end

	def my_none?()
		return !self.my_any?{|v| yield(v)}
	end

	def my_count()
		count = 0
		array = self.my_select{|v| yield(v)}
		array.my_each{|v| count+=1}
		return count
	end

	def my_map(*p)
		array = []
		unless (p.length==1 && (p[0].is_a? Proc))
			raise ArgumentError unless p.length==0
			self.my_each{|v| array.push(yield(v))}
			return array
		end
		self.my_each{|v| array.push(p[0].call(v))}
		return array
	end

	def my_inject(*args)
		value = 0
		if(args.length==0)
			self.my_each_with_index{|v,i| i==0 ? value=v : value = yield(value,v)}
		elsif(args.length==1)
			value = args[0]
			self.my_each{|v| value = yield(value,v)}
		end
		return value
	end

end

def multiply_elys(array)
		array.my_inject{|sum,v| sum*v}
end

#[1,3,4].my_each {|i| puts i}
#{:yo=>1,:bro=>2}.my_each {|k,v| puts "#{k}: #{v}"}

#[1,3,4].my_each_with_index {|v,i| puts "#{v} at index:#{i}"}

#p [1,3,4].my_select{|i| i>2}

#p [1,3,4].my_all?{|i| i>=1}

#p [1,3,4].my_any?{|i| i>=4}

#p [1,3,4].my_none?{|i| i>4}

#p [1,3,4].my_count{|i| i>=1}

#p [1,3,4].my_map{|i| i**2}

#p (5..10).to_a.my_inject{|sum,n| sum+n}
#p (5..10).to_a.my_inject(1){|sum,n| sum+n}
#p multiply_elys([2,4,5])
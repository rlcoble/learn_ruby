def merge_sort(c)
	return c if c.length == 1
	a = c.slice(0,c.length/2)
	b = c.slice(c.length/2,c.length-1)
	merge(merge_sort(a),merge_sort(b))
end

def merge(a,b)
	c = []
	while !a.empty? || !b.empty?
		if a.empty?
			b.each{|i| c<<i}
			b = []
		elsif b.empty?
			a.each{|i| c<<i}
			a = []
		elsif a[0]<b[0] 
			c<<a[0]
			a.delete(a[0])
		else 
			c<<b[0]
			b.delete(b[0])
		end
	end
	return c
end

p merge_sort([6,5,3,1,9,8,7,2,4])
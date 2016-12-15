def bubble_sort(array)
	tail_pointer = array.length - 1
	until tail_pointer==0 do
		0.upto(tail_pointer-1) do |i|
			if(array[i]>array[i+1])
				tmp = array[i+1]
				array[i+1] = array[i]
				array[i] = tmp
			end
		end
		tail_pointer-=1
	end
	p array
end

def bubble_sort_by(array)
	tail_pointer = array.length - 1
	until tail_pointer==0 do
		0.upto(tail_pointer-1) do |i|
			block = yield(array[i],array[i+1])
			if(block > 0)
				tmp = array[i+1]
				array[i+1] = array[i]
				array[i] = tmp
			end
		end
		tail_pointer-=1
	end
	p array
end

bubble_sort([4,3,78,2,0,2])

bubble_sort_by([4,3,78,2,0,2]) do |left,right|
	left - right
end
def add(first,second)
	first+second
end

def subtract(first,second)
	first-second
end

def sum(array)
	total = 0
	array.each do |item|
		total += item
	end
	total
end
 
def multiply(array)
	total = 1
	array.each do |item|
		total *= item
	end
	total
end

def power(first,second)
	first**second
endn

def factorial(num)
	total = 1
	if(num<=1)
		total = 1
	else
		(1..num).each do |i|
			total*=i
		end
	end
	total
end
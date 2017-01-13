def fibs(arry, n)
	return arry if n == 0
	arry.length==1 ? arry<<1 : arry<<arry[-1]+arry[-2]
	fibs(arry,n-1)
end

p fibs([0], 20)
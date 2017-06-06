def dimen(arr)
	dimen = 0
	arr.inject(0) do |tdimen, x|
		if x != 0
			tdimen + x
		else
			dimen = tdimen unless tdimen <= dimen
			tdimen = 0
		end
	end
	dimen
end

puts dimen([1,0,1,1,0,0,1,1,1,1,1,0,1,1,1,0])

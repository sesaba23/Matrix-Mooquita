# Returns the maximun number of times that a given number
# appears joined, one after each other, in an array
def dimen(arr, num)
	dimen = 0
	# calculate tdimen and saved it for next itreration
	arr.inject(0) do |tdimen, x|
		# If num exits in the position x of the array,
		# tdimen is incremented but only if the previous
		# index was also num.
		if x == num
			tdimen + 1
		else
		# save tdimen only if it is bigger than the 
		# previous saved dimen
			dimen = tdimen unless tdimen <= dimen
			tdimen = 0
		end
	end
	# return
	dimen
end

puts dimen([1,0,3,1,0,0,5,5,5,5,1,0,1,5,5,5,0], 5)

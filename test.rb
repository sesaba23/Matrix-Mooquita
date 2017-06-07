array1 = [1, 2, 3, 4, 5]
array2 = [6, 7, 8, 9, 10]
array3 = [11, 12, 13, 14, 15]
array2d = [[array1],[array2],[array3]]
array2d.each_with_index do |array, row|
	array.each_with_index do |x, i|
		array1[i] = x*2
		#x * 2
	end
end
#puts array1
puts array2d

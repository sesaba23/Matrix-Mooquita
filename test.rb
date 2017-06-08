array1 = [1, 2]
array2 = [6, 7]
array3 = [11, 12, 13, 14, 15]
array2d = [[1,1,0],[0,1,1],[1,1,1]]
copy = [[1,1,0],[0,1,1],[1,1,1]]

time = Time.now
for i in 0..array2d.length - 1
	for j in 0..array2d[0].length - 1
		if i != 0
			if array2d[i][j] == 0
				copy[i][j] = 0
			else
				copy[i][j] = copy[i][j] + copy[i-1][j]
			end
		end
	end
end
time = Time.now - time
puts "#{copy} created in #{time}ms"

#puts array1
#puts array2d

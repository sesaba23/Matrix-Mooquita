# Returns the maximun number of times that a given number
# appears joined, one after each other, in an array
def dimen(arr, num=1)
	dimen = 0
	arr << 0
	# calculate tdimen and saved it for next itreration
	arr.inject(0) do |tdimen, x|
		# If num exits in the position x of the array,
		# tdimen is incremented but only if the previous
		# index was also num.
		if x == num
			#puts "Value #{x}: tdimen #{tdimen}, dimen: #{dimen}"
			tdimen + 1
		else
		# save tdimen only if it is bigger than the 
		# previous saved dimen
			dimen = tdimen unless tdimen < dimen
			#puts "Value #{x}: tdimen #{tdimen}, dimen: #{dimen}"
			tdimen = 0
		end
		
	end
	# return
	dimen * num
end

def calculate_temporal_array(array2d)
	copy = Marshal.load(Marshal.dump(array2d))
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
	copy
end

def calculate_temporal_array_new(array2d)
	copy = Marshal.load(Marshal.dump(array2d))
	array2d.each_with_index do |array, i|
		array.each_with_index do |value, j|
			if i != 0
				if value == 0
					copy[i][j] = 0
				else
					copy[i][j] = copy[i][j] + copy[i-1][j]
				end
			end
		end
	end
	copy
end

def create_array
	print "Please, select number of rows: "
	rows = gets.chomp.to_i
	print "Please, select number of columns: "
	columns = gets.chomp.to_i
	array2d = []
	
	for i in 0..rows-1
	array = Array.new
		for j in 0..columns-1
			array << rand(2).to_i
		end
		array2d << array
	end 
array2d
end

##### Uncomment to test if dimen method works ##########
#puts dimen([1,0,1,1], 1)
#puts dimen([1,0,3,1,0,0,5,5,5,5,1,0,1,5,5,5,0], 5)
#array2d = [[1,1,0],[1,1,1],[1,1,1]]

array2d = create_array
puts ""
puts "----------------------------"
puts "Array created is:"
array2d.each do |x|
	print x
	puts ""
end
puts "----------------------------"
puts ""

###### Method using for loop ####################
copy = calculate_temporal_array(array2d)
for_loop_time = Time.now
dimens = copy.collect do |row|
	dimen(row, row.max)
end
puts "Dimens: #{dimens}"
puts "The size of the maximun's sub-array is: #{dimens.max}"
for_loop_time = Time.now - for_loop_time
puts "It has been calculated in #{for_loop_time} ms using for loop"
#puts "Temporaly array created: #{copy}"
puts "----------------------------"

###### Method using for collect method of Enumeration module ##########
copy = calculate_temporal_array_new(array2d)
time = Time.now
dimens = copy.collect do |row|
	dimen(row, row.max)
end
puts "Dimens: #{dimens}"
puts "The size of the maximun's sub-array is: #{dimens.max}"
time = Time.now - time
puts "It has been calculated in #{for_loop_time} ms using collect"

#puts "Temporaly array created: #{copy}"



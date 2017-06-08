##### Generate a random array with the dimension selected by the user
def create_array
array2d = []
	print "Please, select number of rows: "
	rows = gets.chomp.to_i
	print "Please, select number of columns: "
	columns = gets.chomp.to_i

	for j in 0..columns-1
		array =[]
		array << rand(2).to_i
		for i in 0..rows-1
			array2d.push array
		end 
	end
array2d
end



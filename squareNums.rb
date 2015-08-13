class Squareofnums
	def squareNums(a)
		puts "given array is"
		puts a.join(" ")
		puts "square of numbers are"
		a.each{ |x| 
			print x 
			print "-"
			puts x*x }
	end
end

array=Squareofnums.new
arr=[1,2,3,4,5,6,7,8,9]
array.squareNums(arr)
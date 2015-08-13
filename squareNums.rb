class Squareofnums
	def squareNums(a)
		puts "given array is"
		puts a.join(" ")
		res=[]
		puts "square of numbers are"
		a.each{ |x| 
			res.push x*x}
		puts res.join(" ")
	end
end

array=Squareofnums.new
arr=[1,2,3,4,5,6,7,8,9]
array.squareNums(arr)
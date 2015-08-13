class Oddnumbers
	def oddNums(a)
		puts "given array is"
		puts a.join(" ")
		puts "odd numbers are"
		a.each{ |x| 
			if((x%2)!=0) 
			 puts x
			end}
	end
end

array=Oddnumbers.new
arr=[1,2,3,4,5,6,7,8,9]
array.oddNums(arr)
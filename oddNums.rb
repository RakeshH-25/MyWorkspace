class Oddnumbers
	def oddNums(a)
		puts "given array is"
		puts a.join(" ")
		res=[]
		puts "odd numbers are"
		a.each{ |x| 
			if((x%2)!=0) 
			 res.push x
			end}
		puts res.join(" ")
	end
end

array=Oddnumbers.new
arr=[1,2,3,4,5,6,7,8,9]
array.oddNums(arr)
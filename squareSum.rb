class Sumofsquare
	def squareSum(a)
		puts "given array is"
		puts a.join(" ")
		sum=0
		puts "sum of numbers is"
		a.each{ |x| sum+=x*x }
		puts sum
	end
end

array=Sumofsquare.new
arr=[1,2,3,4,5,6,7,8,9]
array.squareSum(arr)
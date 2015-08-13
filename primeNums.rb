class Primenumbers
	def primeNums(a)
		puts "given array is"
		puts a.join(" ")
		res=[]
		puts "prime numbers are"
		a.each{ |x| 
			j = 2
			  while j <= x
			    break if x%j == 0
			    j += 1
			  end
			  if j == x
			    res.push x
			end}
		puts res.join(" ")
	end
end

array=Primenumbers.new
arr=[1,2,3,4,5,6,7,8,9]
array.primeNums(arr)
class Triangletype1
	def triangle_1(n)
	    num=line=1
	    p=[1]
	    pt=Array.new(n*2-line+1," ")
	    pt.each{ |x| print x }
	    puts p.join(" ")
	    while(p.length<n*2)
	        pt=Array.new(n*2-line," ")
	        c= pt+p

	        p=Array.new(p.length+2) {|i| 
	          a=i<=line ? num+=1 : num-=1
	          a}
			
			line+=1

	        pt.each{ |x| print x }
	        puts p.join(" ")
	        puts
	    end
	end
end

triangle=Triangletype1.new
triangle.triangle_1(10)
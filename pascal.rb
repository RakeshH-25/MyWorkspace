class Pascal
    def pascalTriangle(n)
        line=1
        p=[1]
        pt=Array.new(n*2-line+1," ")
        pt.each{ |x| print x }
            puts p.join(" ")
            puts
        while(p.length<=n)
            pt=Array.new(n*2-line," ")
            c= pt+p
            #puts c.join(" ")
            p=Array.new(p.length+1) {|i| 
              a=i<p.length ? p[i] : 0
              b=i>0 ? p[i-1] : 0
              a+b}
            line+=1

            pt.each{ |x| print x }
            puts p.join(" ")
            puts
        end
    end
end

triangle=Pascal.new
triangle.pascalTriangle(10)
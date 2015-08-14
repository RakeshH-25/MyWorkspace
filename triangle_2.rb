
require "test/unit"

class Triangletype2
    def triangle_1(i,n)
        num=i-1
        line=[" "]
            line.push(" "*(n*2-i*2))
            i.times do |i| 
                if num==9
                    line.push(num=0)
                else
                    line.push(num+=1)
                end
            end
        if i-1>0
            (i-1).times do |i|  
                if num==9
                    line.push(num=8)
                else
                    if num==0
                        line.push(num=9)

                    end
                    
                line.push(num-=1)
                end
            end
        end
        return line
    end
end

class TestNumbers < Test::Unit::TestCase
    def test_line
        assert_equal([" ", "", 5, 6, 7, 8, 9, 8, 7, 6, 5], Triangletype2.new.triangle_1(5,5))
    end

end

n=ARGV[0].to_i

tri=Triangletype2.new
n.times do |i|
    
    line=tri.triangle_1(i,n)
    puts line.join(" ")
end


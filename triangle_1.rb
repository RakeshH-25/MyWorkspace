
require "test/unit"

class Triangletype1
    def triangle_1(i,n)
        num=i-1
        line=[" "]
            line.push(" "*(n*2-i*2))
            (i*2-1).times do |i| 
                if num==9
                    line.push(num=0)
                else
                    line.push(num+=1)
                end
            end
        
        return line
    end
end

class TestNumbers < Test::Unit::TestCase
    def test_odds
        assert_equal([" ", "", 5, 6, 7, 8, 9, 0, 1, 2, 3], Triangletype1.new.triangle_1(5,5))
    end

end

n=ARGV[0].to_i

tri=Triangletype1.new
n.times do |i|
    
    line=tri.triangle_1(i,n)
    puts line.join(" ")
end


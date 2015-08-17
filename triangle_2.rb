
require "test/unit"

class Triangletype2

    def triangle_line(current_line,total_lines)

        @line = ""
        add_space(total_lines-current_line)
        add_digits(current_line)
        @line
    end

    def add_space(space_count)
        @line << " "*space_count.to_i
    end

    def add_digits(current_line)
        current_line.times { |n| @line << ((n+1)%10).to_s }
        add_second_half_digits(current_line)
    end

    def add_second_half_digits(current_line)
        @line << @line.chop.reverse
    end
end

class TestNumbers < Test::Unit::TestCase
    def test_line
        assert_equal("123454321", Triangletype2.new.triangle_line(5,5))
    end

end

n = ARGV[0].to_i

triangle = Triangletype2.new
n.times do |i|
    
    line = triangle.triangle_line(i,n)
    puts line
end


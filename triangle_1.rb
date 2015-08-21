
require "test/unit"

class Triangletype1

    def initialize
        @line           = ""
        @num_to_print   = 0
    end

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
        
        (current_line*2-1).times do |i| 
                if @num_to_print == 9
                    @line << ((@num_to_print = 0)%10).to_s
                else
                    @line << ((@num_to_print += 1)%10).to_s
                end
            end
    end

end

# class TestNumbers < Test::Unit::TestCase
#     def test_line
#         assert_equal("   234", Triangletype1.new.triangle_line(3,5))
#     end

# end

n = ARGV[0].to_i

triangle = Triangletype1.new
n.times do |i|
    
    line = triangle.triangle_line(i,n)
    puts line
end

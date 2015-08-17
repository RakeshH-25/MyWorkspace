require "test/unit"

class Whether
	
	def get_day(path)
		@col3 = []
		@col1 = []
		File.open(path, "r").each_line do |line|
		  	#puts line
		  	data = line.split(/\s+/)
		  	 @col3 << data[3] if (data[3] != nil && data[3].to_i > 0)
		  	 @col1 << data[1] if (data[3] != nil && data[3].to_i > 0)
		end

		day_index =  @col3.index(@col3.min)
		
		@col1[day_index.to_i]
	end
end

class TestNumbers < Test::Unit::TestCase
    def test_line
    	file="/home/rakesh/Downloads/weather.txt"
        assert_equal("9", Whether.new.get_day(file))
    end

end

file="/home/rakesh/Downloads/weather.txt"
 day = Whether.new.get_day(file)
 puts day
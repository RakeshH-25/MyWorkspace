require "test/unit"

class Whether
	
	def get_day(path)
		temp_diff = []
		day = []
		File.open(path, "r").each_line do |line|
		  	#puts line
		  	data = line.split(/\s+/)
		  	 temp_diff << data[2].to_i-data[3].to_i if (data[1].to_i > 0 && data[3].to_i > 0)
		  	 day << data[1] if ( data[3].to_i > 0)
		end
		temp_index = temp_diff.index(temp_diff.min)
		day.at(temp_index)
	end
end

class TestNumbers < Test::Unit::TestCase
    def test_line
    	file="/home/rakesh/Downloads/weather.txt"
        assert_equal("14", Whether.new.get_day(file))
    end

end

file="/home/rakesh/Downloads/weather.txt"
 day = Whether.new.get_day(file)
 puts day
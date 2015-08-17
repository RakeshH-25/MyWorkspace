require "test/unit"

class Whether
	
	def get_day(path)
		temp_diff = []
		col1 = []
		File.open(path, "r").each_line do |line|
		  	#puts line
		  	data = line.split(/\s+/)
		  	 temp_diff << data[2].to_i-data[3].to_i if (data[1].to_i > 0 && data[3].to_i > 0)
		  	 #col1 << data[1] if ( data[3].to_i > 0)
		end

		temp_diff[temp_diff.min]
	end
end

class TestNumbers < Test::Unit::TestCase
    def test_line
    	file="/home/rakesh/Downloads/weather.txt"
        assert_equal(22, Whether.new.get_day(file))
    end

end

file="/home/rakesh/Downloads/weather.txt"
 day = Whether.new.get_day(file)
 puts day
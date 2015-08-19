
require "test/unit"

class Squareofnums
	def square_elements(array)
    array.map {|i| i * i}
  end
end

class TestNumbers < Test::Unit::TestCase
  def test_squares
    assert_equal([1,4,9,16,25,36,49,64], Squareofnums.new.square_elements([1,2,3,4,5,6,7,8]))
  end
end
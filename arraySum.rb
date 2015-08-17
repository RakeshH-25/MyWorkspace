
require "test/unit"

class Sumofarray
def sum_of_array(array)
    array.inject(0) { |sum, i| sum + i}
  end
end

class TestNumbers < Test::Unit::TestCase
	def test_sume
    assert_equal(36, Sumofarray.new.sum_of_array([1,2,3,4,5,6,7,8]))
  end
end
require "test/unit"

class Sumofarray
def sum_of_array(array)
    array.inject(0) { |sum, i| sum + i * i}
  end
end

class TestNumbers < Test::Unit::TestCase
	def test_sume
    assert_equal(30, Sumofarray.new.sum_of_array([1,2,3,4]))
  end
end
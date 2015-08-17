
require "test/unit"

class Oddnumbers
	def odd_numbers(range)
    range.reject { |i| i.even?  }
  end
end

class TestNumbers < Test::Unit::TestCase
  def test_odds
    assert_equal([1,3,5,7,9], Oddnumbers.new.odd_numbers([1,2,3,4,5,6,7,8,9]))
  end
end
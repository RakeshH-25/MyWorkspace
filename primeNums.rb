
require "test/unit"

class Primenumbers
	def divisible_by_sqrt(sqrt, i)
    2.upto(sqrt) do |j|
      return false if (i % j) == 0
    end
    return true
    end

    def primes(array)
   	 array.select do |i|
      if i == 1
        false
      else
        root = Math.sqrt(i)
        divisible_by_sqrt(root, i)
      end
     end
    end
end

class TestNumbers < Test::Unit::TestCase
	def test_primes
    	assert_equal([2,3,5,7,11], Primenumbers.new.primes([1,2,3,4,5,6,7,8,9,10,11]))
    end
end
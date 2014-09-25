require "helper"

class TestFreak < MiniTest::Unit::TestCase
  def setup()
    @sequence = "ABBCCCDDDDEEEEE\t"
    @result = Freak::Frequency.frequency(@sequence)
  end
  
  def test_frequency()
    assert_kind_of Hash, @result
    assert_equal(@result["a"], 1)
    assert_equal(@result["b"], 2)
    assert_equal(@result["0x09"], 1)
  end
  
  def test_csv()
    result = Freak::Frequency.csv(@result)
    puts "CSV: #{result}"
    assert_equal(result.split(/,/).first, "a")
    assert_equal(result.split(/,/)[1], "1")
  end
  
  def test_top()
    result = Freak::Frequency.top(@result, 2)
    assert_equal(result.keys.first, "e")
    assert_equal(result["e"], 5)
  end
  
  def test_length
    assert_equal(Freak::Frequency.length(@result), 15)
  end
  
  def test_relative_frequency()
    result = Freak::Frequency.relative_frequency(@result)
    # Add up the values and it should be 1
    puts result
  end
  
  def test_long_sentence()
    s = "In Switzerland secret remedies cannot be advertised without submitting the formula and a sample of the remedy to the board of health."
    result = Freak::Frequency.frequency(s)
    csv = Freak::Frequency.csv(result)
    puts csv
    header = Freak::Frequency.header(result)
    puts "Header: #{header}"
    #puts Freak::Frequency.top(result, 1)
  end
  
end
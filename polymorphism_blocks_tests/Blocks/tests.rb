require_relative 'processing_array' 
require 'minitest/autorun'

class ArrayProcessorTest < Minitest::Test
  def setup
    @array = ArrayProcessor.new([1, 2, 3, 4, 5])
    @chunk_array = ArrayProcessor.new([12, 2, 3, 4, 5, 7])
  end

  def test_include
    assert_equal true, @array.include? { |n| n.even? }
    assert_equal false, @array.include? { |n| n > 5 }
  end

  def test_reduce
    assert_equal 120, @array.reduce(1) { |acc, elem| acc * elem }
    assert_equal 25, @array.reduce(10) { |acc, elem| acc + elem }
  end

  def test_sum
    assert_equal 9, @array.sum { |n| !n.even? }
    assert_equal 6, @array.sum { |n| n.even? }
  end

  def test_member
    assert_equal false, @array.member? { |n| n == 7 }
    assert_equal true, @array.member? { |n| n == 1 }
  end

  def test_filter
    result = @array.filter { |n| n.even? }
    assert_equal [2, 4], result

    result = @array.filter { |n| n > 3 }
    assert_equal [4, 5], result
  end

  def test_chunk
    result = @chunk_array.chunk { |n| n.even? }
    expected = [
      [true, [12, 2]],
      [false, [3]],
      [true, [4]],
      [false, [5, 7]]
    ]
    assert_equal expected, result
  end
end

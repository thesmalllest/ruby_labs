require_relative 'processing_array'

array = ArrayProcessor.new([1,2,3,4,5])

puts array.include? {|n| n.even?}
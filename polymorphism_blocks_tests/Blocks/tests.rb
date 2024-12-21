require_relative 'processing_array'

array = ArrayProcessor.new([1,2,3,4,5])

puts array.include? {|n| n.even?}

puts array.reduce(1) {|acc, elem| acc * elem}
puts array.reduce(10) {|acc, elem| acc + elem}

puts array.sum {|n| !n.even?}
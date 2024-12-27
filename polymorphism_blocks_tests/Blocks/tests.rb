require_relative 'processing_array'

array = ArrayProcessor.new([1,2,3,4,5])

puts array.include? {|n| n.even?} # => true

puts array.reduce(1) {|acc, elem| acc * elem} # => 120
puts array.reduce(10) {|acc, elem| acc + elem} # => 25

puts array.sum {|n| !n.even?} # =>9

puts array.member? {|n| n == 7} # => false
puts array.member? {|n| n == 1} # => true

puts array.filter {|n| n.even?} # => 2
                                # => 4
                                
array_for_chunk = ArrayProcessor.new([12,2,3,4,5,7])

puts array_for_chunk.chunk  {|n| n.even?}
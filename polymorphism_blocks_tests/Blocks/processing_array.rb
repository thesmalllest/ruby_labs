class ArrayProcessor

 def initialize(array)
    @array=array.dup.freeze
 end

 def include?(&block)
    @array.each do |element|
        if yield element
            return true
        end
    end
    return false
 end

 def reduce(init_value = nil, &block)
    accumulator = init_value
    if accumulator.nil?
        accumulator = 0
    end
    @array.each do |element|
        accumulator = yield accumulator, element
    end
    return accumulator			
 end
end


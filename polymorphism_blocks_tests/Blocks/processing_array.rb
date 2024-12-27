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

 def sum(&block)
    sum = 0
    @array.each do |element|
        if yield element
            sum += element
        end
    end
    return sum
 end

 def member?(&block)
    @array.each do |element|
        if yield element
            return true
        end
    end
    return false
 end

 def filter(&block)
    collection = []
    @array.each do |element|
        if yield element
            collection << element
        end
    end
    return collection
 end

 def chunk(&block)
    result = []
    current_key = nil
    current_chunk = []

    @array.each do |element|
      key = yield(element)
      if key != current_key
        result << [current_key, current_chunk] unless current_chunk.empty?
        current_key = key
        current_chunk = []
      end
      current_chunk << element
    end
    result << [current_key, current_chunk] unless current_chunk.empty?
    result
 end
end


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
end


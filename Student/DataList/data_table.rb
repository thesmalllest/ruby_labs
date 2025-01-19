class DataTable
   private attr_reader :data

    def initialize(data)
      self.data = data
    end

    private def data=(data)
        unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
        raise ArgumentError, 'Data must be a 2D array'
      end
      @data = data
    end

    def get_element(row, col)
      @data[row][col]
    end

    def row_count
      @data.size
    end

    def column_count
      @data.first.size
    end
  
  end
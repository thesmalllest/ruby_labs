class DataList

    private attr_reader :data, :selected
  
    def initialize(data)
      @data = data
      @selected = []
    end
  
    def select(number)
      raise IndexError, "Элемент по указанному номеру не существует" if @data[number].nil?
      @selected << number unless @selected.include?(number)
      @data[number]
    end
  
    def get_selected
      @selected
    end
  
    def get_names
      raise NotImplementedError, 'Метод реализован в наследнике.'
    end
  
    def get_data
      index = 0
      data = []
      selected = self.get_selected
      selected.each do |index|
        obj = @data[index]
        row = get_row_of_values(index, obj)
        data.append(row)
      end
      DataTable.new(data)
    end

    def data=(data)
      unless data.is_a?(Array)
        raise ArgumentError, 'Data должна быть массивом'
      end
      @data = data
    end
  
    private
    
    def get_row_of_values(index, student_short)
      raise NotImplementedError, 'Метод реализован в наследнике.'
    end
    
  end
  
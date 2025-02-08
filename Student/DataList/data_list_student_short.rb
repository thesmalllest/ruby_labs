require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList
  attr_accessor :count, :offset

  def initialize(data, offset = 0)
    super(data)
    @offset = offset
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify
    @observers.each do |observer|
      observer.set_table_params(get_names, @count)
      observer.set_table_data(get_data)
    end
  end

  def get_names
    ['№', 'Фамилия И.О.', 'Git', 'Контакт']
  end

  private def get_row_of_values(index, student_short)
    [student_short.initials, student_short.git, student_short.contact]
  end

end

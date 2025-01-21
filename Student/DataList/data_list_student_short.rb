require_relative 'data_list'

require_relative 'data_table'

class DataListStudentShort < DataList

  private

  def get_names_of_attributes_of_object
    ['№', 'Фамилия И.О.', 'Git', 'Контакт']
  end

  def get_row_of_values_of_object(index, student_short)
    [index, student_short.initials, student_short.git, student_short.contact]
  end

end


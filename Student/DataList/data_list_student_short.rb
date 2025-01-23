require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList

  def get_names
    ['№', 'Фамилия И.О.', 'Git', 'Контакт']
  end
  
  private def get_row_of_values(index, student_short)
    [index, student_short.initials, student_short.git, student_short.contact]
  end

end


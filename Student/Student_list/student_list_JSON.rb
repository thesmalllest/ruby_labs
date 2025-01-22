require 'json'
require_relative '../student'
require_relative '../student_short'
require_relative '../DataList/data_list'
require_relative 'student_list'

class StudentListJSON < StudentList 

  def load_students
    if File.exist?(self.file_path)
      file = File.read(self.file_path)
      student_data = JSON.parse(file, symbolize_names: true)
      self.students = student_data.map { |data| Student.new(**data) }
    else
      self.students = []
    end
  end

  def save_students
    data = self.students.map { |student| {
      id: student.id,
      surname: student.surname,
      name: student.name,
      patronymic: student.patronymic,
      phone: student.phone,
      telegram: student.telegram
      email: student.email,
      git: student.git
    }}
    File.write(file_path, JSON.pretty_generate(data))
  end

end
  
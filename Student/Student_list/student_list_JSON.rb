require_relative 'file_strategy'
require 'json'

class StudentListJSON < FileStrategy 

  def load_students(file_path)
    if File.exist?(file_path)
      file = File.read(file_path)
      student_data = JSON.parse(file, symbolize_names: true)
      student_data.map { |student_hash| Student.new(**student_hash) }
    else
      []
    end
  end

  def save_students(file_path, student_data)
    data = student_data.map do |student| 
      {
        id: student.id,
        surname: student.surname,
        name: student.name,
        patronymic: student.patronymic,
        phone: student.phone,
        telegram: student.telegram,
        email: student.email,
        git: student.git
      }
    end
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end

end

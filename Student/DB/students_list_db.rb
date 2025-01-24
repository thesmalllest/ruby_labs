require 'pg'
require_relative './db_connection' # Файл находится в той же папке
require_relative '../student' # Файл находится в родительской папке
require_relative '../student_short' # Файл находится в родительской папке
require_relative '../DataList/data_list' # Файл в папке DataList
require_relative '../DataList/data_list_student_short' # Файл в папке DataList


class StudentsListDB
  def initialize
    @connection = DBConnection.connection
  end

  def get_student_by_id(id)
    result = @connection.exec_params("SELECT * FROM students WHERE id = $1;", [id])
    raise "Студент с таким ID не найден" if result.ntuples.zero?
  
    row = result.first.transform_keys(&:to_sym)
    row[:id] = row[:id].to_i if row[:id] 
    Student.new(**row)
  end
  
  def get_k_n_student_short_list(k, n, data_list = nil)
    start = (k - 1) * n
    result = @connection.exec_params('SELECT * FROM students ORDER BY id LIMIT $1 OFFSET $2', [n, start])
    
    students_short = result.map(&:to_h).map do |row|
      StudentShort.from_student(Student.new(**row.transform_keys(&:to_sym)))
    end
  
    data_list ||= DataListStudentShort.new(students_short)
    data_list
  end
  
  def add_student(student)
    result = @connection.exec_params(
      'INSERT INTO students (surname, name, patronymic, phone, telegram, email, git)
       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id',
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git]
    )
    student.id = result[0]['id'].to_i
    student
  end
  
  def replace_student_by_id(id, student)
    result = @connection.exec_params(
      'UPDATE students SET surname = $1, name = $2, patronymic = $3, phone = $4,
       telegram = $5, email = $6, git = $7 WHERE id = $8',
      [student.surname, student.name, student.patronymic, student.phone,
       student.telegram, student.email, student.git, id]
    )
    raise "Студент с ID #{id} не найден для обновления" if result.cmd_tuples.zero?
    true
  end

  def delete_student_by_id(id)
    result = @connection.exec_params("DELETE FROM students WHERE id = $1;", [id])
    raise "Студент с ID #{id} не найден" if result.cmd_tuples.zero?
  end  

  def get_students_count
    result = @connection.exec("SELECT COUNT(*) AS count FROM students;")
    result[0]['count'].to_i
  end
end

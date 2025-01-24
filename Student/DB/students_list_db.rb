require 'pg'
require_relative '../db_connection'
require_relative '../../student'
require_relative '../../student_short'
require_relative '../../DataList/data_list'
require_relative '../../DataList/data_list_student_short'

class StudentsListDB
  def initialize
    @connection = DBConnection.connection
  end

  def get_student_by_id(id)
    result = @connection.exec_params("SELECT * FROM students WHERE id = $1;", [id])
    raise "Студент с таким ID не найден" if result.ntuples.zero?

    row = result.first.transform_keys(&:to_sym)
    Student.from_hash(row)
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start = (k - 1) * n
    result = @connection.exec_params('SELECT * FROM students ORDER BY id LIMIT $1 OFFSET $2', [n, start])
  
    students_short = result.map(&:to_h).map do |student|
      student.transform_keys!(&:to_sym)
      StudentShort.from_student(Student.from_hash(student))
    end
  
    data_list ||= DataListStudentShort.new(students_short)
    data_list
  end  

  def add_student(student)
    result = @connection.exec_params(
      'INSERT INTO students (surname, name, patronymic, phone, telegram, email, git)
       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;',
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git]
    )
    student.id = result[0]['id'].to_i
    student
  end

  def replace_student_by_id(id, student)
    result = @connection.exec_params(
      "UPDATE students 
       SET surname = $1, name = $2, patronymic = $3, phone = $4, telegram = $5, email = $6, git = $7 
       WHERE id = $8;",
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git, id]
    )
    raise "Студент с ID #{id} не найден" if result.cmd_tuples.zero?
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

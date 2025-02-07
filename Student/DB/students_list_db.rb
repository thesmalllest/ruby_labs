require 'pg'
require_relative './db_connection'
require_relative '../Models/student'
require_relative '../Models/student_short'
require_relative '../DataList/data_list'
require_relative '../DataList/data_list_student_short'

class StudentsListDB
  def initialize
    @db = DBConnection.instance
  end

  def get_student_by_id(id)
    query = 'SELECT * FROM students WHERE id = $1'
    result = @db.execute_query(query, [id])
    raise "Студент с таким ID не найден" if result.ntuples.zero?

    row = result.first.transform_keys(&:to_sym)
    row[:id] = row[:id].to_i if row[:id]
    Student.new(**row)
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start = (k - 1) * n
    query = 'SELECT * FROM students ORDER BY id LIMIT $1 OFFSET $2'
    result = @db.execute_query(query, [n, start])

    students_short = result.map(&:to_h).map do |row|
      StudentShort.from_student(Student.new(**row.transform_keys(&:to_sym)))
    end

    data_list ||= DataListStudentShort.new(students_short)
    data_list
  end

  def add_student(student)
    query = 'INSERT INTO students (surname, name, patronymic, phone, telegram, email, git)
             VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id'
    params = [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git]
    result = @db.execute_query(query, params)

    student.id = result[0]['id'].to_i
    student
  end

  def replace_student_by_id(id, student)
    query = 'UPDATE students SET surname = $1, name = $2, patronymic = $3, phone = $4,
             telegram = $5, email = $6, git = $7 WHERE id = $8'
    params = [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git, id]
    result = @db.execute_query(query, params)

    raise "Студент с ID #{id} не найден для обновления" if result.cmd_tuples.zero?
    true
  end

  def delete_student_by_id(id)
    query = 'DELETE FROM students WHERE id = $1'
    result = @db.execute_query(query, [id])
    raise "Студент с ID #{id} не найден" if result.cmd_tuples.zero?
  end

  def get_students_count
    query = 'SELECT COUNT(*) AS count FROM students'
    result = @db.execute_query(query)
    result[0]['count'].to_i
  end
end
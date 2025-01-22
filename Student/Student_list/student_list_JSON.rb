require 'json'
require_relative '../student'
require_relative '../student_short'
require_relative '../DataList/data_list'

class StudentlistJSON

    attr_accessor :file_path 
    attr_reader :students
  
    def initialize(file_path:, students:)
      @file_path = file_path
      self.students = []
    end
  
    def students=(students)
      unless students.nil? || students.is_a?(Array) 
        raise ArgumentError, "Неверный тип данных"
      end
      @students = students
    end
  
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
  
    def get_student_by_id(id)
      @students.find { |student| student.id == id }
    end
  
    # Получить список k по счету n объектов класса Student_short
    def get_k_n_student_short_list(k, n, data_list = nil)
      start = (k - 1) * n
      selected = @students[start, n] || []
      students_short = selected.map { |student| StudentShort.from_student(student) }
      # Если data_list не передан, создаём новый объект
      data_list ||= DataListStudentShort.new(students_short)
      # Если data_list передан, обновляем его
      data_list.replace(students_short) if data_list
      data_list
    end
  
    def sort_by_surname_initials
      @students.sort_by! { |student| student.initials }
    end
  
    def add_student(student)
      new_id = @students.empty? ? 1 : @students.map(&:id).max + 1
        new_student = Student.new(
          id: student.id,
          surname: student.surname,
          name: student.name,
          patronymic: student.patronymic,
          phone: student.phone,
          telegram: student.telegram
          email: student.email,
          git: student.git
      )
      @students << new_student
    end
  
    def replace_student_by_id(id, new_student)
      index = @students.index { |student| student.id == id }
      return unless index
      @students[index] = new_student
      save_students
    end
  
    def delete_student_by_id(id)
      @students.reject! { |student| student.id == id }
      save_students
    end
  
    def get_student_short_count
      @students.size
    end
  end
  
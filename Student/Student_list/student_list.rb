require_relative '../student'
require_relative '../student_short'
require_relative '../DataList/data_list'
require_relative '../DataList/data_list_student_short'
require_relative 'student_list_JSON'
require_relative 'student_list_YAML'

class StudentList

    private attr_reader :strategy, :file_path, :students
  
    def initialize(file_path:, strategy:)
      @strategy = strategy  
      @file_path = file_path
      self.students = []
    end
  
    def load_students
      self.students = @strategy.load_students(@file_path)
    end
    
    def save_students
        @strategy.save_students(@file_path, self.students)
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
  
    def sort_by_initials
      @students.sort_by! { |student| student.initials }
    end
  
    def add_student(student)
        if @students.any? { |existing_student| existing_student == student }
          raise ArgumentError, "Такой студент уже существует"
        end

        new_id = @students.empty? ? 1 : @students.map(&:id).max + 1

        new_student = Student.new(
          id: new_id,
          surname: student.surname,
          name: student.name,
          patronymic: student.patronymic,
          phone: student.phone,
          telegram: student.telegram,
          email: student.email,
          git: student.git
        )
        @students << new_student
    end
      
  
    def replace_student_by_id(id, new_student)
      index = @students.index { |student| student.id == id }
      return unless index
      @students[index] = new_student
    end
  
    def delete_student_by_id(id)
      @students.reject! { |student| student.id == id }
    end
  
    def get_student_short_count
      @students.size
    end

    def change_strategy(new_strategy, new_file_path)
        raise ArgumentError, "Неверная стратегия" unless new_strategy.is_a?(FileStrategy)
        @strategy = new_strategy
        @file_path = new_file_path
    end

    private

    def strategy=(new_strategy)
        raise ArgumentError, "Неверная стратегия" unless new_strategy.is_a?(FileStrategy)
        @strategy = new_strategy
    end
    
    def file_path=(new_file_path)
        raise ArgumentError, "Некорректный путь к файлу" unless new_file_path.is_a?(String) && !new_file_path.empty?
        @file_path = new_file_path
    end
  
    def students=(students)
      unless students.nil? || students.is_a?(Array) 
        raise ArgumentError, "Неверный тип данных"
      end
      @students = students
    end

end
  
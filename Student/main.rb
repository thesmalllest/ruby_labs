require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/Student_list/student_list.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/Student_list/student_list_JSON.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/Student_list/student_list_YAML.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/student_short.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/student.rb")
require 'json'
require 'yaml'

# Create student instances
student_1 = Student.new(
  surname: "Есенин",
  name: "Сергей",
  patronymic: "Александрович",
  id: 1,
  phone: "+79231233242",
  telegram: "@sergey_esenin",
  email: "sergey.esenin@example.com",
  git: "https://github.com/eseninss"
)

student_2 = Student.new(
  surname: "Пушкин",
  name: "Александр",
  patronymic: "Сергеевич",
  id: 2,
  phone: "+79161234567",
  telegram: "@a_pushkin",
  email: "alex.pushkin@example.com",
  git: "https://github.com/pushkinalex"
)

student_3 = Student.new(
  surname: "Толстой",
  name: "Лев",
  patronymic: "Николаевич",
  id: 3,
  phone: "+79876543210",
  telegram: "@lev_tolstoy",
  email: "lev.tolstoy@example.com",
  git: "https://github.com/tolstoyln"
)

# Define file paths
file_path_json = 'data/student_data.json'
file_path_yaml = 'data/student_data.yaml'

# Initialize the lists with JSON and YAML strategies
json_strategy = StudentListJSON.new
yaml_strategy = StudentListYAML.new

json_list = StudentList.new(file_path: file_path_json, strategy: json_strategy)
yaml_list = StudentList.new(file_path: file_path_yaml, strategy: yaml_strategy)

# Add students to both lists and save
begin
  [json_list, yaml_list].each do |list|
    list.add_student(student_1)
    list.add_student(student_2)
    list.add_student(student_3)
    list.save_students
  end

  puts "Студенты записаны в файлы: #{file_path_json} и #{file_path_yaml}"

  # Load and display students from both files
  [json_list, yaml_list].each do |list|
    list.load_students
    puts "Список студентов после чтения из файла #{list.file_path}:"
    list.students.each do |student|
      puts "#{student.id}. #{student.initials} - Git: #{student.git}, Contact: #{student.contact}"
    end
  end

rescue StandardError => e
  puts "Ошибка: #{e.message}"
end

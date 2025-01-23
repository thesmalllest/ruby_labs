require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/Student_list/student_list.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/Student_list/student_list_JSON.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/Student_list/student_list_YAML.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/student_short.rb")
require File.expand_path("C:/Users/user/Documents/GitHub/ruby_labs/Student/student.rb")
require 'json'
require 'yaml'

file_path_json = 'data/student_data.json'
file_path_yaml = 'data/student_data.yaml'

student_list = StudentList.new(file_path: file_path_json, strategy: StudentListJSON.new)

student_list.load_students
puts "Студенты успешно загружены из файла #{file_path_json}"

student_list.change_strategy(StudentListYAML.new, file_path_yaml)
puts "Студенты успешно записаны в файл #{file_path_yaml}"

student_list.save_students
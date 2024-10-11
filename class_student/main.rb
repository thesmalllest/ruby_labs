require_relative 'creating_class_student'

student_1 = Student.new(1, 'Есенин', 'Сергей', 'Александрович', '1234567890', 'sergey_esenin', 'sergey.esenin@example.com', 'eseninss')
student_2 = Student.new(2, 'Вознесенский', 'Андрей', 'Андреевич', '9876543210', 'andrey_vozn', 'voznesenskiy@example.com', 'andrey_v')

puts "Информация о студенте 1:"
puts student_1.to_s

puts "\nИнформация о студенте 2:"
puts student_2.to_s

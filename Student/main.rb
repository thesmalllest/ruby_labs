require_relative 'student'

student_1 = Student.new(1, 'Есенин', 'Сергей', 'Александрович', '1234567890', 'sergey_esenin', 'sergey.esenin@example.com', 'eseninss')

puts "Информация о студенте 1:"
puts student_1.to_s
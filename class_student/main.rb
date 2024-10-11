require_relative 'creating_class_student'

student_data_1 = {
 id: 1,
 surname: 'Есенин',
 name: 'Сергей',
 patronymic: 'Александрович',
 phone: '1234567890',
 telegram: 'sergey_esenin',
 email: 'sergey.esenin@example.com',
 git: 'eseninss'
}

student_data_2 = {
 id: 2,
 surname: 'Вознесенский',
 name: 'Андрей',
 patronymic: 'Андреевич',
 phone: '9876543210'
}

student_1 = Student.new(student_data_1)

puts "Информация о студенте 1:"
puts student_1.to_s

student_2 = Student.new(student_data_2)

puts "\nИнформация о студенте 2:"
puts student_2.to_s

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
 phone: '88765432144'
}

begin
 student1 = Student.new(student_data_1)
 puts "Студент 1 создан успешно: #{student1}"
rescue ArgumentError => e
 puts "Ошибка при создании студента 1: #{e.message}"
end

begin
 student2 = Student.new(student_data_2)
 puts "Студент 2 создан успешно: #{student2}"
rescue ArgumentError => e
 puts "Ошибка при создании студента 2: #{e.message}"
end
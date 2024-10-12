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

student_data_3 = {
 id: 3,
 surname: 'Пушкин',
 name: 'Александр',
 patronymic: 'Сергеевич',
 phone: '+79112345678',
 telegram: 'pushkin_tg',
 email: 'alexandr.pushkin@example.com',
 git: 'pushkin-git' 
}

student_data_4 = {
 id: 4,
 surname: 'Чехов',
 name: 'Anton',
 patronymic: 'Павлович',
 phone: '89112345678',
 telegram: 'anton_chehov',
 email: 'anton.chehov@example.com',
 git: 'chekhov'
}


begin
 student_1 = Student.new(student_data_1)
 puts "Студент 1 создан успешно: #{student1}"
rescue ArgumentError => e
 puts "Ошибка при создании студента 1: #{e.message}"
end

begin
 student_2 = Student.new(student_data_2)
 puts "Студент 2 создан успешно: #{student_2}"
rescue ArgumentError => e
 puts "Ошибка при создании студента 2: #{e.message}"
end

begin
 student_3 = Student.new(student_data_3)
 puts "Студент 3 создан успешно: #{student_3}"
rescue ArgumentError => e
 puts "Ошибка при создании студента 3: #{e.message}"
end

begin
 student_4 = Student.new(student_data_4)
 puts "Студент 4 создан успешно: #{student_4}"
rescue ArgumentError => e
 puts "Ошибка при создании студента 4: #{e.message}"
end
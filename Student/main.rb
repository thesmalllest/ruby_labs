require_relative 'student'

student_1 = Student.new({
  surname: "Есенин",
  name: "Сергей",
  patronymic: "Александрович",
  id: 1,
  phone: "123456789",
  telegram: "@sergey_esenin",
  email: "sergey.esenin@example.com",
  git: "eseninss"
})


puts "Информация о студенте 1:"
puts student_1.to_s
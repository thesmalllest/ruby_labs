require_relative 'student'
require_relative 'student_short'

student_1 = Student.new(
  surname: "Есенин",
  name: "Сергей",
  patronymic: "Александрович",
  id: 1,
  git: "https://github.com/eseninss"
)

student_1.set_contacts(
  phone: "+79231233242",
  telegram: "@sergey_esenin",
  email: "sergey.esenin@example.com"
)

student_1.validate
puts "Информация о студенте #{student_1.id}:"
puts student_1

puts "Краткая информация о студенте #{student_1.id}:"
puts student_short_from_student = StudentShort.from_student(student_1)
puts student_short_from_string = StudentShort.parse_info(3,student_1.getInfo)


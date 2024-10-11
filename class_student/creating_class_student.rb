class Student
 attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

 def initialize(student_data)

  raise ArgumentError, "Некорректный номер телефона" unless Student.valid_phone(student_data[:phone])

  @id = student_data[:id]
  @surname = student_data[:surname]
  @name = student_data[:name]
  @patronymic = student_data[:patronymic]
  @phone = student_data[:phone]
  @telegram = student_data[:telegram]
  @email = student_data[:email]
  @git = student_data[:git]
 end

 def self.valid_phone(phone)
  return false unless phone.is_a?(String)
  phone.match?(/^(?:\+7|8)\d{10}$/)
 end

 def to_s
  "ID: #{id}: ФИО: #{surname} #{name} #{patronymic} Телефон: #{phone} Telegram: #{telegram} Email: #{email} Git: #{git}"
 end
end

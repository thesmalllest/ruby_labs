class Student
  attr_accessor :id, :phone, :telegram, :email, :git
  attr_reader :surname, :name, :patronymic

  def initialize(student_data = {})
    @surname = student_data[:surname]
    @name = student_data[:name]
    @patronymic = student_data[:patronymic]
    @id = student_data[:id]
    @phone = student_data[:phone]
    @telegram = student_data[:telegram]
    @email = student_data[:email]
    @git = student_data[:git]
  end

  def to_s
    "ID: #{id}, ФИО: #{surname} #{name} #{patronymic}, Телефон: #{phone}, Telegram: #{telegram}, Email: #{email}, Git: #{git}"
  end
end

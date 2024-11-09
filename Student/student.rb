class Student
  attr_accessor :id, :phone, :telegram, :email, :git
  attr_reader :surname, :name, :patronymic

  def initialize(student_data = {surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil})
    @surname = student_data[:surname]
    @name = student_data[:name]
    @patronymic = student_data[:patronymic]
    @id = student_data[:id]
    self.phone = student_data[:phone]
    @telegram = student_data[:telegram]
    @email = student_data[:email]
    @git = student_data[:git]
  end

  def self.valid_phone?(phone)
    phone.match(/\A(\+7|8)?\d{10}\z/)
  end

  def phone=(phone)
  		raise "Некорректный номер телефона" if !Student.valid_phone?(phone)
  		@phone=phone
  end

  def to_s
    "ID: #{id}, ФИО: #{surname} #{name} #{patronymic}, Телефон: #{phone}, Telegram: #{telegram}, Email: #{email}, Git: #{git}"
  end

end

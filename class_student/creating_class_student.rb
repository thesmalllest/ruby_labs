class Student
 attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

 def initialize(id, surname, name, patronymic, phone, telegram, email, git)
  @id = id
  @surname = surname
  @name = name
  @patronymic = patronymic
  @phone = phone
  @telegram = telegram
  @email = email
  @git = git
 end

 def to_s
  "ID: #{id}: ФИО: #{surname} #{name} #{patronymic} Телефон: #{phone} Telegram: #{telegram} Email: #{email} Git: #{git}"
 end

end

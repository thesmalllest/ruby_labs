class Student
 def initialize(id, surname, name, patronymic, phone = nil, telegram = nil, email = nil, git = nil)
  @id = id
  @surname = surname
  @name = name
  @patronymic = patronymic
  @phone = phone
  @telegram = telegram
  @email = email
  @git = git
 end

 # Геттеры
 def id
  @id
 end

 def surname
  @surname
 end

 def name
  @name
 end

 def patronymic
  @patronymic
 end

 def phone
  @phone
 end

 def telegram
  @telegram
 end

 def email
  @email
 end

 def git
  @git
 end

 # Сеттеры
 def id=(new_id)
  @id = new_id
 end

 def surname=(new_surname)
  @surname = new_surname
 end

 def name=(new_name)
  @name = new_name
 end

 def patronymic=(new_patronymic)
  @patronymic = new_patronymic
 end

 def phone=(new_phone)
  @phone = new_phone
 end

 def telegram=(new_telegram)
  @telegram = new_telegram
 end

 def email=(new_email)
  @email = new_email
 end

 def git=(new_git)
  @git = new_git
 end

 def to_s
  "ID: #{id}: ФИО: #{surname} #{name} #{patronymic} Телефон: #{phone} Telegram: #{telegram} Email: #{email} Git: #{git}"
 end

end

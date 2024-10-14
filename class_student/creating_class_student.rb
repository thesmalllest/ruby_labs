class Student
 attr_accessor :id, :surname, :name, :patronymic

 def initialize(student_data)
  validate_data(student_data)
  @id = student_data[:id]
  @surname = student_data[:surname]
  @name = student_data[:name]
  @patronymic = student_data[:patronymic]
  @phone = student_data[:phone]
  @telegram = student_data[:telegram]
  @email = student_data[:email]
  @git = student_data[:git]
 end

 def to_s
  "ID: #{@id}: ФИО: #{@surname} #{@name} #{@patronymic} Телефон: #{@phone} Telegram: #{@telegram} Email: #{@email} Git: #{@git}"
 end

  def set_contacts(contacts)
    validate_contacts(contacts) 
      send("#{key}=", value) if [:phone, :telegram, :email, :git].include?(key)
    end
  end

 def self.valid_fio?(surname, name, patronymic)
  return false unless surname.is_a?(String) && name.is_a?(String) && patronymic.is_a?(String)
  return false unless surname.match?(/^[А-Яа-я]+$/) && name.match?(/^[А-Яа-я]+$/) && patronymic.match?(/^[А-Яа-я]+$/)
  true
 end
 

 def self.valid_phone?(phone)
  return false unless phone.is_a?(String)
  phone.match?(/^(?:\+7|8)\d{10}$/)
 end
 return false unless phone.is_a?(String)
 phone.match?(/^(?:\+7|8)\d{10}$/) 
end

 def self.valid_telegram?(telegram)
  return false unless telegram.is_a?(String)
  telegram.match?(/^[a-zA-Z0-9_]{5,32}$/)
 end

 def self.valid_email?(email)
  return false unless email.is_a?(String)
  email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
 end

 def self.valid_git?(git)
  return false unless git.is_a?(String)
  git.match?(/^[a-zA-Z0-9_]+$/)
 end

 private

def validate_data(student_data)
 raise ArgumentError, "Некорректный номер телефона" if student_data.key?(:phone) && !Student.valid_phone?(student_data[:phone])
 raise ArgumentError, "Некорректное имя пользователя Telegram" if student_data.key?(:telegram) && !Student.valid_telegram?(student_data[:telegram])
 raise ArgumentError, "Некорректный email" if student_data.key?(:email) && !Student.valid_email?(student_data[:email])
 raise ArgumentError, "Некорректное ФИО" unless Student.valid_fio?(student_data[:surname], student_data[:name], student_data[:patronymic])
 raise ArgumentError, "Некорректное имя пользователя Git" if student_data.key?(:git) && !Student.valid_git?(student_data[:git])

 if !student_data.key?(:git) && !Student.has_contact?(student_data) 
  raise ArgumentError, "Отсутствуют имя пользователя Git и контакт для связи" 
 elsif !student_data.key?(:git)
  raise ArgumentError, "Отсутствует имя пользователя Git"
 elsif !Student.has_contact?(student_data)
  raise ArgumentError, "Отсутствует контакт для связи"
 else
  true
 end
end

def validate_contacts(contacts)
    raise ArgumentError, "Некорректный номер телефона" if contacts.key?(:phone) && !Student.valid_phone?(contacts[:phone])

def self.has_contact?(student_data)
  if student_data.key?(:phone) && Student.valid_phone?(student_data[:phone]) 
   return true
  elsif student_data.key?(:telegram) && Student.valid_telegram?(student_data[:telegram])
   return true
  elsif student_data.key?(:email) && Student.valid_email?(student_data[:email])
   return true
  end
  false
 end

 def self.has_git_and_contact?(student_data)
 student_data.key?(:git) && Student.valid_git?(student_data[:git]) && has_contact?(student_data)
 end

end

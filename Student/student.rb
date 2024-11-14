class Student
  attr_reader :surname, :name, :patronymic, :id, :phone, :telegram, :email, :git

  def initialize(student_data = {surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil})
    self.surname = student_data[:surname]
    self.name = student_data[:name]
    self.patronymic = student_data[:patronymic]
    self.id = student_data[:id]
    self.phone = student_data[:phone]
    self.telegram = student_data[:telegram]
    self.email = student_data[:email]
    self.git = student_data[:git]
  end

  def self.valid_surname?(surname)
    surname.match(/\A[А-Яа-яA-Za-z]+\z/)
  end

  def surname=(surname)
  	raise ArgumentError, "Некорректно введена фамилия" if !Student.valid_surname?(surname)
  	@surname=surname
  end

  def self.valid_name?(name)
    name.match(/\A[А-Яа-яA-Za-z]+\z/)
  end

  def name=(name)
  	raise ArgumentError, "Некорректно введено имя" if !Student.valid_name?(name)
  	@name=name
  end

  def self.valid_patronymic?(patronymic)
    patronymic.match(/\A[А-Яа-яA-Za-z]+\z/)
  end

  def patronymic=(patronymic)
  	raise ArgumentError, "Некорректно введена фамилия" if !Student.valid_patronymic?(patronymic)
  	@patronymic=patronymic
  end

  def self.valid_id?(id)
  	id > 0 && id.is_a?(Integer)
  end

  def id=(id)
  	raise ArgumentError, "Некорректный ID" if !Student.valid_id?(id)
  	@id=id
  end

  def self.valid_phone?(phone)
    phone.match(/\A(\+7|8)?\d{10}\z/)
  end

  def phone=(phone)
  	if !phone.nil? && !Student.valid_phone?(phone)
  	  raise ArgumentError, "Некорректный номер телефона"
    end
  	@phone=phone
  end

  def self.valid_telegram?(telegram)
  	telegram.match(/\A[A-Za-z0-9_@]+\z/)
  end

  def telegram=(telegram)
  	if !telegram.nil? && !Student.valid_telegram?(telegram)
  	  raise ArgumentError, "Некорректно введен Telegram"
    end
  	@telegram=telegram
  end

  def self.valid_email?(email)
  	email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
  end

  def email=(email)
  	if !email.nil? && !Student.valid_email?(email)
  	  raise ArgumentError, "Некорректно введен Email" 
  	end
  	@email=email
  end

  def self.valid_git?(git)
  	git.match(/\A[A-Za-z0-9_]+\z/)
  end
  
  #Только если git не является nil, будет выполняться проверка valid_git?.
  def git=(git)
	if !git.nil? && !Student.valid_git?(git)
	  raise ArgumentError, "Некорректно введен Git"
	end
	@git = git
  end

  def has_git?
  	!git.nil?
  end

  def has_contact?
  	!phone.nil? || !email.nil? || !telegram.nil?
  end

  def validate
  	raise ArgumentError, "Отсутствует Git" unless has_git?
  	raise ArgumentError, "Отсутствует контакт для связи" unless has_contact?
  end

  def to_s
    "ID: #{id}, ФИО: #{surname} #{name} #{patronymic}, Телефон: #{phone}, Telegram: #{telegram}, Email: #{email}, Git: #{git}"
  end

end

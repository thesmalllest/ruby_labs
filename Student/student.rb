class Student
  attr_reader :surname, :name, :patronymic, :id, :phone, :telegram, :email, :git

  def initialize(student_data = {surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil})
    self.surname = student_data[:surname]
    self.name = student_data[:name]
    self.patronymic = student_data[:patronymic]
    self.id = student_data[:id]
    self.git = student_data[:git]
    set_contacts(phone: student_data[:phone], telegram: student_data[:telegram], email: student_data[:email])
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
  	git.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9\-]+\z/)
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

  def set_contacts(phone: nil, telegram: nil, email: nil)
    if phone && !Student.valid_phone?(phone)
      raise ArgumentError, "Некорректный номер телефона"
    end
    if telegram && !Student.valid_telegram?(telegram)
      raise ArgumentError, "Некорректно введен Telegram"
    end
    if email && !Student.valid_email?(email)
      raise ArgumentError, "Некорректно введен Email"
    end

    @phone = phone
    @telegram = telegram
    @email = email
  end

  def to_s
    "ID: #{id}, ФИО: #{surname} #{name} #{patronymic}, Телефон: #{phone}, Telegram: #{telegram}, Email: #{email}, Git: #{git}"
  end

  def surname_with_initials
    "#{surname} #{name[0]}.#{patronymic[0]}."
  end

  def primary_contact
    if !phone.nil?
      "Телефон: #{phone}"
    elsif !telegram.nil?
      "Telegram: #{telegram}"
    else !email.nil?
      "Email: #{email}"
    end
  end

  # Основной метод getInfo
  def getInfo
    "#{surname_with_initials}; GitHub: #{git}; #{primary_contact}"
  end

end

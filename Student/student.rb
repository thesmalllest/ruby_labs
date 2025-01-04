require_relative 'person'

class Student < Person
  attr_reader :surname, :name, :patronymic, :phone, :telegram, :email

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    set_contacts(phone: phone, telegram: telegram, email: email)
    super(id: id, git: git)
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

  def self.valid_phone?(phone)
    phone.match(/\A(\+7|8)?\d{10}\z/)
  end

  private def phone=(phone)
  	if !phone.nil? && !Student.valid_phone?(phone)
  	  raise ArgumentError, "Некорректный номер телефона"
    end
  	@phone=phone
  end

  def self.valid_telegram?(telegram)
  	telegram.match(/\A[A-Za-z0-9_@]+\z/)
  end

  private def telegram=(telegram)
  	if !telegram.nil? && !Student.valid_telegram?(telegram)
  	  raise ArgumentError, "Некорректно введен Telegram"
    end
  	@telegram=telegram
  end

  def self.valid_email?(email)
  	email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
  end

  private def email=(email)
  	if !email.nil? && !Student.valid_email?(email)
  	  raise ArgumentError, "Некорректно введен Email" 
  	end
  	@email=email
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

  def initials
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
  def get_info
    "#{initials}, #{git}, #{primary_contact}"
  end

end


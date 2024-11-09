class Student

	attr_accessor :id, :phone, :telegram, :email, :git
	attr_reader :surname, :name, :patronymic

	def initialize(surname, name, patronymic, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
	
		@surname = surname
		@name = name
		@patronymic = patronymic
		@id = id
		@phone = phone
		@telegram = telegram
		@email = email
		@git = git

	end

	def to_s
		"ФИО: #{surname} #{name} #{patronymic}, ID: #{id}, Телефон: #{phone}, Telegram: #{telegram}, Email: #{email}, Git: #{git}"
	end

end

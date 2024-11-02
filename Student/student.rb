class Student
	def initialize(surname, name, patronymic, id = nill, phone = nill, telegram = nill, email = nill, git = nill)
	
		@surname = surname
		@name = name
		@patronymic = patronymic
		@id = id
		@phone = phone
		@telegram = telegram
		@email = email
		@git = git

	end

	#getters

	def surname
		@surname
	end

	def name
		@name
	end

	def patronyumic
		@patronymic
	end

	def id
		@id
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

	#setters

	def surname = (new_surname)
		@surname = new_surname
	end

	def name = (new_name)
		@name = new_name
	end

	def patronymic = (new_patronymic)
		@patronymic = new_patronymic
	end

	def id
		@id
	end

	def phone = (new_phone)
		@phone = new_phone
	end

	def telegram = (new_telegram)
		@telegram = new_telegram
	end

	def email = (new_email)
		@email = new_email
	end

	def git = (new_git)
		@git = new_git
	end

	def to_s
		"ID: #{@id}, ФИО: #{@name} #{@surname} #{@patronymic}, Телефон: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
	end

end

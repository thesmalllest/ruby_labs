class Student_short
	attr_accessor :id, :surname_with_initials, :git, :contact

	def initialize(id:, surname_with_initials:, git:, contact)
		@id = id
		@surname_with_initials = surname_with_initials
		@git = git
		@contact = contact
	end

end

student = Student_short.new(1, "Ivanov I.I.", "https://github.com/ivanov", "+71234567890")
require_relative 'person'

class StudentShort < Person
  attr_reader :initials, :contact

  def initialize(initials, id: nil, git: nil, contact: nil)
    @initials = initials
    @contact = contact
    super(id: id, git: git)
  end

  def self.from_student(student)
   new(student.surname_with_initials, id: student.id, git: student.git, contact: student.primary_contact)
  end

  def self.from_string(id, info_str)
    info = info_str.split(", ")
    initials = info[0]
    git = info[1]
    contact = info[2]
    new(initials, id: id, git: git, contact: contact)
  end

  def to_s
    "ID: #{@id}, ФИО: #{@initials}, Git: #{@git}, Contact: #{@contact}"
  end

  def validate
    has_git? || has_contact?
  end
  private_class_method :new

end


class Person
  attr_reader :id, :git

  def initialize(id: nil, git: nil)
    self.id = id
    self.git = git
  end

  def self.valid_id?(id)
      id > 0 && id.is_a?(Integer)
    end

    def id=(id)
      raise ArgumentError, "Некорректный ID" if !Student.valid_id?(id)
      @id=id
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

    def self.valid_surname?(surname)
      raise NotImplementedError, "Метод не реализован в классе Person"
    end

    def self.valid_name?(name)
      raise NotImplementedError, "Метод не реализован в классе Person"
    end

    def self.valid_patronymic?(patronymic)
      raise NotImplementedError, "Метод не реализован в классе Person"
    end

    def self.valid_phone?(phone)
      raise NotImplementedError, "Метод не реализован в классе Person"
    end

    def self.valid_telegram?(telegram)
      raise NotImplementedError, "Метод не реализован в классе Person"
    end

    def self.valid_email?(email)
      raise NotImplementedError, "Метод не реализован в классе Person"
    end

    def has_git?
      !git.nil?
    end

    def has_contact?
      !phone.nil? || !email.nil? || !telegram.nil?
    end
    
    def validate
      has_git? && has_contact?
    end
end
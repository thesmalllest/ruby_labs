class Person
  attr_reader :id, :git

  def initialize(id: nil, git: nil)
    self.id = id
    self.git = git
  end

  def self.valid_id?(id)
    id.nil? || (id.is_a?(Integer) && id > 0)
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

    def contact
      raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
    end

    def initials
      raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
    end

    def has_git?
      !git.nil?
    end

    def has_contact?
      raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
    end
    
    def validate
      has_git? && has_contact?
    end
end
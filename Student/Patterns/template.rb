class Animal
    def show_behavior
      wake_up
      make_sound
      eat
      sleep
    end
  
    def wake_up
      puts "Просыпается"
    end
  
    def sleep
      puts "Ложится спать"
    end
  
    def make_sound
      raise NotImplementedError, "Этот метод должен быть определён в подклассе"
    end
  
    def eat
      raise NotImplementedError, "Этот метод должен быть определён в подклассе"
    end
  end

  class Cat < Animal
    def make_sound
      puts "Мяукает: 'Мяу!'"
    end
  
    def eat
      puts "Ест рыбу"
    end
  end

  class Dog < Animal
    def make_sound
      puts "Лает: 'Гав-гав!'"
    end
  
    def eat
      puts "Ест кость"
    end
  end
  
  puts "Поведение кошки:"
  cat = Cat.new
  cat.show_behavior
  
  puts "\nПоведение собаки:"
  dog = Dog.new
  dog.show_behavior
  
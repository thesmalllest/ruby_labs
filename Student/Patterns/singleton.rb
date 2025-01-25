class SingletonExample
    def self.instance
      @instance ||= new
    end
  
    private_class_method :new
  
    def demonstrate
      "Singleton instance is working!"
    end
  end

  singleton1 = SingletonExample.instance
  singleton2 = SingletonExample.instance
  
  puts singleton1.demonstrate
  puts singleton1.equal?(singleton2) 
  
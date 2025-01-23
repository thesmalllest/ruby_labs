# Интерфейс стратегии
class RouteStrategy
    def build_route(a, b)
      raise NotImplementedError, "This method should be overridden in a subclass"
    end
end
  
  # Конкретные стратегии
class RoadStrategy < RouteStrategy
    def build_route(a, b)
      "Building a road route from #{a} to #{b}"
    end
end
  
class PublicTransportStrategy < RouteStrategy
    def build_route(a, b)
      "Building a public transport route from #{a} to #{b}"
    end
end
  
class WalkingStrategy < RouteStrategy
    def build_route(a, b)
      "Building a walking route from #{a} to #{b}"
    end
end
  
  # Контекст (Navigator)

class Navigator
    attr_accessor :route_strategy
  
    def initialize(route_strategy)
      @route_strategy = route_strategy
    end
  
    def build_route(a, b)
      @route_strategy.build_route(a, b)
    end
end

road_strategy = RoadStrategy.new
public_transport_strategy = PublicTransportStrategy.new
walking_strategy = WalkingStrategy.new

navigator = Navigator.new(road_strategy)
puts navigator.build_route("Point A", "Point B") 

navigator.route_strategy = public_transport_strategy
puts navigator.build_route("Point A", "Point B") 

navigator.route_strategy = walking_strategy
puts navigator.build_route("Point A", "Point B") 
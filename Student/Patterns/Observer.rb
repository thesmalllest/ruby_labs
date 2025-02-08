# Класс "Издатель" (Observable)
class NewsPublisher
  def initialize
    @observers = []  # Список подписчиков (наблюдателей)
  end

  # Добавляем подписчика
  def add_observer(observer)
    @observers << observer
  end

  # Удаляем подписчика
  def remove_observer(observer)
    @observers.delete(observer)
  end

  # Уведомляем всех подписчиков о новой новости
  def notify_observers(news)
    @observers.each { |observer| observer.update(news) }
  end

  # Метод публикации новости
  def publish_news(news)
    puts "📢 Новая новость: #{news}"
    notify_observers(news)  # Оповещение всех подписчиков
  end
end

# Класс "Наблюдатель" (Observer)
class User
  def initialize(name)
    @name = name
  end

  # Метод, который вызывается при уведомлении
  def update(news)
    puts "🔔 #{@name}, вам новое уведомление: '#{news}'"
  end
end

# --- Демонстрация работы ---

# Создаем новостной портал
news_portal = NewsPublisher.new

# Создаем пользователей (наблюдателей)
user1 = User.new("Алиса")
user2 = User.new("Боб")

# Подписываем пользователей на новости
news_portal.add_observer(user1)
news_portal.add_observer(user2)

# Публикуем новость, и все подписчики получают уведомление
news_portal.publish_news("Руби 4.0 вышел в релиз!")

# Отписываем одного пользователя
news_portal.remove_observer(user2)

# Публикуем еще одну новость, теперь только один подписчик получит уведомление
news_portal.publish_news("Rails 7.1 доступен для скачивания!")

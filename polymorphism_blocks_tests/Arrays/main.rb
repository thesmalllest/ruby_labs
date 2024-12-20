require_relative 'tasks'

def main
  loop do
    puts 'Выберите задачу:'
    puts '1. Найти элементы между первым и вторым максимальным.'
    puts '2. Найти элементы между первым и последним максимальным.'
    puts '3. Найти минимальный четный элемент.'
    puts '4. Построить список всех простых делителей числа.'
    puts '5. Закончить.'
    print 'Введите номер задачи: '
    choice = gets.to_i

    case choice
    when 1
      print 'Введите массив через пробел: '
      arr = gets.split.map(&:to_i)
      result = elements_between_first_and_second_max(arr)
      puts "Результат: #{result}"
    when 2
      print 'Введите массив через пробел: '
      arr = gets.split.map(&:to_i)
      result = elements_between_first_and_last_max(arr)
      puts "Результат: #{result}"
    when 3
      print 'Введите массив через пробел: '
      arr = gets.split.map(&:to_i)
      result = minimum_even_element(arr)
      puts "Результат: #{result}"
    when 4
      print 'Введите число: '
      number = gets.to_i
      result = prime_factors(number)
      puts "Простые делители: #{result}"
    when 5
      puts 'Завершение программы. Спасибо!'
      break
    else
      puts 'Неверный выбор! Попробуйте снова.'
    end
    puts
  end
end

main

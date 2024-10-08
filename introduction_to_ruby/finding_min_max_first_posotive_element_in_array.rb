# Метод для поиска минимального элемента массива с помощью цикла for
def find_min_for(array)
  min_value = array[0] 
  for i in 1...array.length
    if array[i] < min_value
      min_value = array[i]
    end
  end
  min_value
end

# Метод для поиска минимального элемента массива с помощью цикла while
def find_min_while(array)
  min_value = array[0] 
  i = 1
  while i < array.length
    if array[i] < min_value
      min_value = array[i]
    end
    i += 1
  end
  min_value
end

# Метод для поиска максимального элемента массива с помощью цикла for
def find_max_for(array)
  max_value = array[0] 
  for i in 1...array.length
    if array[i] > max_value
      max_value = array[i]
    end
  end
  max_value
end

# Метод для поиска максимального элемента массива с помощью цикла while
def find_max_while(array)
  max_value = array[0] 
  i = 1
  while i < array.length
    if array[i] > max_value
      max_value = array[i]
    end
    i += 1
  end
  max_value
end

# Метод для поиска номера первого положительного элемента массива с помощью цикла for
def find_first_positive_for(array)
  for i in 0...array.length
    if array[i] > 0
      return i 
    end
  end
  -1 # Если нет положительных элементов, возвращаем -1
end

# Метод для поиска номера первого положительного элемента массива с помощью цикла while
def find_first_positive_while(array)
  i = 0
  while i < array.length
    if array[i] > 0
      return i 
    end
    i += 1
  end
  -1 # Если нет положительных элементов, возвращаем -1
end

array_for_first_task = [-1, -5, 3, 0, 1, -8]

puts "Массив: #{array_for_first_task}" 

puts "Минимальный элемент (for): #{find_min_for(array_for_first_task)}"
puts "Минимальный элемент (while): #{find_min_while(array_for_first_task)}"

puts "Максимальный элемент (for): #{find_max_for(array_for_first_task)}"
puts "Максимальный элемент (while): #{find_max_while(array_for_first_task)}"

puts "Номер первого положительного элемента (for): #{find_first_positive_for(array_for_first_task)}"
puts "Номер первого положительного элемента (while): #{find_first_positive_while(array_for_first_task)} \n "


# Обработка аргументов и выполнение операции
if ARGV.length != 2
  puts "Неправильное количество аргументов. Необходимо два аргумента: метод и файл."
  exit
end

method_name = ARGV[0]
file_path = ARGV[1]

# Чтение массива из файла
array_for_second_task = []
File.open(file_path, "r") do |file|
  array_for_second_task = file.readline.split(",").map(&:to_i) 
end

# Выполнение выбранного метода
case method_name
when "min_for"
  result = find_min_for(array_for_second_task)
when "min_while"
  result = find_min_while(array_for_second_task)
when "max_for"
  result = find_max_for(array_for_second_task)
when "max_while"
  result = find_max_while(array_for_second_task)
when "first_positive_for" 
  result = find_first_positive_for(array_for_second_task)
when "first_positive_while"
  result = find_first_positive_while(array_for_second_task)
else
  puts "Неизвестный метод."
  exit
end

# Вывод результата
puts "Массив: #{array_for_second_task}"
puts "Выбранный метод: #{method_name}"
puts "Результат: #{result}"

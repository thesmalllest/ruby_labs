puts "Попробуем решить пару задач! \n "

# Метод 1. Найти количество четных чисел, не взаимно простых с данным
def count_even_not_coprime(n)
  count = 0
  (2..n).step(2) do |i|
    if gcd(n, i) > 1
      count += 1
    end
  end
  count
end

# Метод 2. Найти максимальную цифру числа, не делящуюся на 3
def max_digit_not_divisible_by_3(n)
  max_digit = -1
  n.to_s.each_char do |digit|
    digit = digit.to_i
    if digit % 3 != 0 && digit > max_digit
      max_digit = digit
    end
  end
  max_digit
end

# Метод 3. Найти произведение максимального числа, не взаимно простого с данным, не делящегося на наименьший делитель исходно числа, и суммы цифр числа, меньших 5
def product_of_max_not_coprime_and_sum_of_digits(n)
  max_not_coprime = -1
  sum_of_digits_less_than_5 = 0
  min_divisor = n

  (2..n / 2).each do |i|
    if n % i == 0
      min_divisor = i if i < min_divisor
      if gcd(n, i) > 1 && i > max_not_coprime
        max_not_coprime = i
      end
    end
  end

  n.to_s.each_char do |digit|
    digit = digit.to_i
    sum_of_digits_less_than_5 += digit if digit < 5
  end

  max_not_coprime * sum_of_digits_less_than_5
end

# Вспомогательные методы
def gcd(a, b)
  return a if b == 0
  gcd(b, a % b)
end

# Запрос данных у пользователя и решение задач
puts "Задача 1: Найти количество четных чисел, не взаимно простых с данным. Введите число для первой задачи: "
number1 = STDIN.gets.chomp.to_i
puts "Количество четных чисел, не взаимно простых с #{number1}: #{count_even_not_coprime(number1)} \n "

puts "Задача 2: Найти максимальную цифру числа, не делящуюся на 3. Введите число для второй задачи:"
number2 = STDIN.gets.chomp.to_i
puts "Максимальная цифра числа #{number2}, не делящаяся на 3: #{max_digit_not_divisible_by_3(number2)} \n "

puts "Задача 3: Найти произведение максимального числа, не взаимно простого с данным, не делящегося на наименьший делитель исходно числа, и суммы цифр числа, меньших 5. Введите число для третьей задачи:"
number3 = STDIN.gets.chomp.to_i
puts "Произведение максимального числа, не взаимно простого с #{number3}, не делящегося на наименьший делитель, и суммы цифр числа, меньших 5: #{product_of_max_not_coprime_and_sum_of_digits(number3)} \n "

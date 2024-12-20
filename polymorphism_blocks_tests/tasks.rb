# Метод для нахождения элементов между первым и вторым максимальными
def elements_between_first_and_second_max(arr)
    return [] if arr.size < 2
  
    max1, max2 = arr.max(2)
    index1 = arr.index(max1)
    index2 = arr.rindex(max2)
  
    start, finish = [index1, index2].sort
  
    arr[(start + 1)...finish]
  end
  
  # Метод для нахождения элементов между первым и последним максимальными
  def elements_between_first_and_last_max(arr)
    return [] if arr.empty?
  
    max_val = arr.max
    first_index = arr.index(max_val)
    last_index = arr.rindex(max_val)
  
    start, finish = [first_index, last_index].sort
  
    arr[(start + 1)...finish]
  end
  
  # Метод для нахождения минимального четного элемента
  def minimum_even_element(arr)
    evens = arr.select(&:even?)
    evens.min
  end
  
  # Метод для нахождения всех простых делителей числа, с учетом кратности
  def prime_factors(number)
    require 'prime'
    Prime.prime_division(number).flat_map { |factor, power| [factor] * power }
  end
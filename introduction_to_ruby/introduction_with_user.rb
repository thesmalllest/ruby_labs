puts "Hello World!" 

user_name = ARGV[0] 
puts "Добро пожаловать, #{user_name}!" 

puts "Какой твой любимый язык программирования?"
favorite_language = STDIN.gets.chomp

if favorite_language.downcase == "ruby"
  puts "Ты, конечно, подлиза!"
else
  puts "Скоро будет Ruby!"
  # Комментарии для разных языков:
  case favorite_language.downcase
  when "python"
    puts "Python тоже отличный язык!"
  when "javascript"
    puts "JavaScript - язык веб-разработки!"
  when "java"
    puts "Java - мощный язык для больших проектов!"
  else
    puts "Любой язык хорош, если в нем писать хороший код!"
  end
end

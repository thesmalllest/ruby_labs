require_relative '../db_connection' 

def fetch_students
  connection = DBConnection.connection 
  result = connection.exec("SELECT * FROM students;") 
 
  result.each do |row|
    puts "ID: #{row['id']}, ФИО: #{row['surname']} #{row['name']} #{row['patronymic']}, " \
         "Телефон: #{row['phone']}, Telegram: #{row['telegram']}, Email: #{row['email']}, Git: #{row['git']}"
  end
end

fetch_students

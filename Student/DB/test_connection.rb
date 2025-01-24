require_relative 'db_connection'

connection = DBConnection.connection
puts "Connected to database: #{connection.db}"

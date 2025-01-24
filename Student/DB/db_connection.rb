require 'pg'

class DBConnection
  def self.connection
    @connection ||= PG.connect(
      dbname: 'StudentsDataBase',
      user: 'postgres',
      password: '123', 
      host: 'localhost',
      port: 5432
    )
  end
end

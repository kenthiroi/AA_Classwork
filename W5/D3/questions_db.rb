require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
  
end

class Users

  # def self.all
  #   users = QuestionsDatabase.instance.execute('SELECT * FROM users')
  #   users.map { |datum| Users.new(datum) }
  # end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM
        users
      WHERE
        id = ?
    SQL

    
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        * 
      FROM
        users
      WHERE
        fname = ? OR lname = ?
    SQL
  end

end

p Users.all

p Users.find_by_id(1)
p Users.find_by_id(2)
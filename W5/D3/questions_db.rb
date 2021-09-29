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
  attr_accessor :fname, :lname, :id

  def self.all
    users = QuestionsDatabase.instance.execute('SELECT * FROM users')
    users.map { |datum| Users.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM
        users
      WHERE
        id = ?
    SQL
    Users.new(user.first)
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
    Users.new(user.first)
  end

  def initialize(hash)
    @fname = hash['fname']
    @lname = hash['lname']
    @id = hash['id']
  end

end

class Questions
  attr_accessor :title, :body, :author_id, :id

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        * 
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    Questions.new(question.first)
  end

  def initialize(hash)
    @title = hash['title']
    @body = hash['body']
    @author_id = hash['author_id']
    @id = hash['id']
  end
  
end

class QuestionsFollow

  def initialize(hash)
    @id = hash['id']
    @user_id = hash['user_id']
    @question_id = hash['question_id']
  end
  
end
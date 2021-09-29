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

  def authored_questions
    Questions.find_by_author_id(id)
  end

  def authored_replies
    Replies.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
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
  
  def author
    Users.find_by_id(author_id)
  end

  def replies
    Replies.find_by_question_id(id)
  end
  
  def followers
    QuestionFollow.followers_for_question_id(id)
  end

end

class Replies
  attr_accessor :id, :question_id, :user_id, :body, :parent_id

  def self.find_by_user_id(user_id)
    user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    Replies.new(user.first)
  end

  def self.find_by_question_id(question_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    Replies.new(question.first)
  end

  def initialize(hash)
    @id = hash['id']
    @question_id = hash['question_id']
    @user_id = hash['user_id']
    @body = hash['body']
    @parent_id = hash['parent_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def question
    Question.find_by_question_id(question_id)
  end

  def parent_reply
    Replies.find_by_user_id(parent_id)
  end

  def child_reply
    Replies.find_by_user_id(parent_reply)
  end

end

class QuestionLikes
  attr_accessor :id, :user_id, :question_id

  def initialize(hash)
    @id = hash['id']
    @user_id = hash['user_id']
    @question_id = hash['question_id']
  end

end

class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM
        question_follows
        JOIN users
          ON question_follows.user_id = users.id
      WHERE
        question_id = ?
    SQL
    followers.map { |follower| Users.new(follower)}
  end

  def self.followed_questions_for_user_id(question_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM
        question_follows
        JOIN questions
          ON question_follows.user_id = questions.id
      WHERE
        question_id = ?
    SQL
    questions.map { |question| Questions.new(question)}
  end

  def initialize(hash)
    @id = hash['id']
    @user_id = hash['user_id']
    @question_id = hash['question_id']
  end
  
end


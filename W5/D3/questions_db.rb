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

  def liked_question
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM
        questions
      WHERE
        (
          SELECT
            COUNT(DISTINCT(questions.id)) 
          FROM
            questions
            LEFT OUTER JOIN question_likes
            ON questions.id = question_likes.question_id
          WHERE

        )
    SQL
    Questions.new(question.first)
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

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        * 
      FROM
        question_likes
        JOIN questions
          ON question_likes.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    questions.map { |question| Questions.new(question) }
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

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
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

class QuestionLike
  attr_accessor :id, :user_id, :question_id

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM
        question_likes
        JOIN users
          ON question_likes.user_id = users.id
      WHERE
        question_id = ?
    SQL

    likers.map { |user| Users.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        COUNT(*) 
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    likers.first['COUNT(*)']
  end

  def self.liked_questions_for_user_id(user_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM
        users
      JOIN question_likes
        ON users.id = question_likes.user_id
      JOIN questions
        ON question_likes.question_id = questions.id
      WHERE
        user_id = ?
    SQL

    likers.map { |question| Questions.new(question) }
  end

  def self.most_liked_question(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        * 
      FROM
        question_likes
        JOIN questions
          ON question_likes.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    questions.map { |question| Questions.new(question) }
  end

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

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        title 
      FROM
        question_follows
        JOIN questions
          ON question_follows.user_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    questions.map { |question| Questions.new(question) }
  end

  def initialize(hash)
    @id = hash['id']
    @user_id = hash['user_id']
    @question_id = hash['question_id']
  end
  
end


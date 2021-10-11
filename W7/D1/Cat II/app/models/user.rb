# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  attr_reader :password

  after_initialize :ensure_session_token
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    self.password_digest = BCrpyt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    password_object = BCrpyt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(username: user_name)
    if user && user.is_password?(password)
      return user
    else
      nil
    end
  end


end

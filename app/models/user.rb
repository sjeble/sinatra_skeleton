require 'bcrypt'

class User < ActiveRecord::Base
  has_many
  has_many

  validates :email, presence: true, uniquesness: true

  validates :valid_email

  def valid_email
    unless email =~ /^.+@.+?\.(.+)$/
      self.errors.add(:email, "Must be a valid email address")
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate?(email, password)
    self.email == email && self.password == password
  end
end

class User < ActiveRecord::Base
  include BCrypt

  validates :name, presence: true
  validates :password_hash, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash) 
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    return nil if user.nil?
    user.password == password ? user : nil
  end

end

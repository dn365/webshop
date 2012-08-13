require "digest/sha2"
class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :phone, :salt, :password, :password_confirmation

  validates :password, :confirmation => true, :presence => true
  attr_accessor :password_confirmation
  attr_reader :password

  validates :name, :uniqueness => true, :presence => true

  def User.authenticate(name,password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password,user.salt)
        user
      end
    end
  end


  def User.encrypt_password(password,salt)
    Digest::SHA2.hexdigest(password + "something" + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end


  private
  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end

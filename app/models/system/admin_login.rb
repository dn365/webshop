require "digest/sha2"
class System::AdminLogin < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :salt, :password_confirmation, :password
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password

  validates :name, :uniqueness => true, :presence => true

  def authenticate(name, password)
    if admin_login = System::AdminLogin.find_by_name(name)
       if admin_login.hashed_password == encrypt_password(password, admin_login.salt)
         admin_login
       end
    end
  end

  def encrypt_password(password,salt)
      Digest::SHA2.hexdigest(password + "hzdzcc" + salt)
  end

  def password=(password)
      @password = password

      generate_salt
      self.hashed_password = encrypt_password(password,salt) if password.present?
  end

  private

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end

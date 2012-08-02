class System::AdminLogin < ActiveRecord::Base
  attr_accessible :name, :password, :salt
  attr_accessor :password_confirmation
  attr_accessible :password_confirmation
  validates :password, :confirmation => true, :presence => true

  validates :name, :uniqueness => true, :presence => true

end

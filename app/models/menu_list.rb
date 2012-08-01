class MenuList < ActiveRecord::Base
  attr_accessible :title
  has_many :line_items, :dependent => :destroy
  has_many :products, :dependent => :destroy
end

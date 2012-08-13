class LineItem < ActiveRecord::Base
  attr_accessible :menu_list_id, :product_id, :cart_id
  belongs_to :product
  belongs_to :cart
end

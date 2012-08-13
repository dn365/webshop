class Product < ActiveRecord::Base
  attr_accessible :description, :dish_num, :image_url, :price, :title, :menu_list_id
  has_many :line_items
  belongs_to :menu_list

  before_destroy :ensure_not_referenced_by_any_line_item

  MENU_LIST_TYPES = MenuList.all.map {|v| [v.title, v.id]}
  
  has_attached_file :image_url, :styles => { :medium => "300x300>", :thumb => "150x150>" }
  validates_attachment :image_url, :presence => true, :content_type => {:content_type => ['image/jpg', 'image/png', 'image/gif', 'image/jpeg']},
                         :size => { :in => 0..600.kilobytes }

  validates :title, :description, :price, :dish_num, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :dish_num, :numericality => true
  validates :title, :uniqueness => true

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end



end

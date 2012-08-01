class AddAttachmentImageUrlToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.has_attached_file :image_url
    end
  end

  def self.down
    drop_attached_file :products, :image_url
  end
end

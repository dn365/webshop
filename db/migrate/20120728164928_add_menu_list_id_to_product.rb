class AddMenuListIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :menu_list_id, :integer
  end
end

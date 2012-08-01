class CreateMenuLists < ActiveRecord::Migration
  def change
    create_table :menu_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
